from library import mean_teacher

classifier_dict = {
    "cifar10_cnn": mean_teacher.architectures.cifar_cnn,
    "cifar10_cnn_gaussian": mean_teacher.architectures.cifar_cnn_gauss,
    "cifar10_resnet_26":mean_teacher.architectures.cifar_shakeshake26
}