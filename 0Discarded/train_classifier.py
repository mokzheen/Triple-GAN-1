import torch
import torch.nn as nn
import numpy as np

from library import inputs
from Utils.checkpoints import save_context, Logger
from Utils import flags
from Utils import config

import Torture
from library import evaluation
from library import loss_classifier

FLAGS = flags.FLAGS
KEY_ARGUMENTS = config.load_config(FLAGS.config_file)
text_logger, MODELS_FOLDER, SUMMARIES_FOLDER = save_context(__file__, KEY_ARGUMENTS)

torch.manual_seed(1234)
torch.backends.cudnn.deterministic = True
torch.backends.cudnn.benchmark = True
np.random.seed(1235)
torch.cuda.manual_seed(1236)
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

itr = inputs.get_data_iter(subset=FLAGS.n_labels)
netC, optim_c = inputs.get_classifier_optimizer()
netC = netC.to(device)
netC = nn.DataParallel(netC)

checkpoint_io = Torture.utils.checkpoint.CheckpointIO(checkpoint_dir=MODELS_FOLDER)
checkpoint_io.register_modules(netC=netC)
logger = Logger(log_dir=SUMMARIES_FOLDER)
# train
print_interval = 50
test_interval = 500
max_iter = FLAGS.n_iter
loss_func = loss_classifier.loss_dict[FLAGS.c_loss]

logger_prefix = "Itera {}/{} ({:.0f}%)"
for i in range(max_iter):
    data, label = itr.__next__()
    data, label = data.to(device), label.to(device)

    tloss = loss_func(netC, data, label)
    optim_c.zero_grad()
    tloss.backward()
    if FLAGS.clip_value > 0:
        torch.nn.utils.clip_grad_norm_(netC.parameters(), FLAGS.clip_value)
    optim_c.step()

    logger.add("training", "loss", tloss.item(), i + 1)

    if (i + 1) % test_interval == 0:
        total_t, correct_t, loss_t = evaluation.test_classifier(netC)
        logger.add("testing", "loss", loss_t.item(), i + 1)
        logger.add("testing", "accuracy", 100 * (correct_t / total_t), i + 1)

        prefix = logger_prefix.format(i + 1, max_iter, (100 * i + 1) / max_iter)
        cats = ["training", "testing"]
        logger.log_info(prefix, text_logger.info, cats=cats)
    elif (i + 1) % print_interval == 0:
        prefix = logger_prefix.format(i + 1, max_iter, (100 * i + 1) / max_iter)
        cats = ["training"]
        logger.log_info(prefix, text_logger.info, cats=cats)

    if (i + 1) % FLAGS.save_every == 0:
        logger.save_stats("{:08d}.pkl".format(i))
        file_name = "model" + str(i + 1) + ".pt"
        checkpoint_io.save(file_name)
