# 
# review code and results 
# -> write command -> write tunner 
# -> test new -> clear files -> clear gpu and run 
# 

# 
# ELDR
# 
# no adv loss and pdl loss before ramp start.
# 
# i.	PDL 0.0 ？10-4 10-3 10-2 10-1
# ii.	ADV 0.0 ？10-4 10-3 10-2 10-1
#  
# sample from 0 to 9.
# 
# iii.	Time add ？
# iv.	Time end ？
# v.	N_iter TBD
# vi.	N_pre_train = 0 to test for bugs


# svhn
python train_triplegan_debug_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder DEBUG_VN -alpha_c_pdl 0.0 -alpha_c_adv 0.0 -n_labels 1000 -ssl_seed 1001 -translate 2 -gpu 1

python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder DEBUG_VN -alpha_c_pdl 0.0 -alpha_c_adv 0.0 -n_labels 1000 -ssl_seed 1001 -translate 2 -gpu 3
python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder DEBUG_VN -alpha_c_pdl 0.0001 -alpha_c_adv 0.0 -n_labels 1000 -ssl_seed 1001 -translate 2 -gpu 3
python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder DEBUG_VN -alpha_c_pdl 0.001 -alpha_c_adv 0.0 -n_labels 1000 -ssl_seed 1001 -translate 2 -gpu 3
python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder DEBUG_VN -alpha_c_pdl 0.01 -alpha_c_adv 0.0 -n_labels 1000 -ssl_seed 1001 -translate 2 -gpu 3
python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder DEBUG_VN -alpha_c_pdl 0.1 -alpha_c_adv 0.0 -n_labels 1000 -ssl_seed 1001 -translate 2 -gpu 3
python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder DEBUG_VN -alpha_c_pdl 0.0 -alpha_c_adv 0.001 -n_labels 1000 -ssl_seed 1001 -translate 2 -gpu 3
python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder DEBUG_VN -alpha_c_pdl 0.001 -alpha_c_adv 0.001 -n_labels 1000 -ssl_seed 1001 -translate 2 -gpu 3



# tiny
python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_noaug_elr.yaml -subfolder DEBUG_TN -alpha_c_pdl 0.0 -alpha_c_adv 0.0 -n_labels 1000 -ssl_seed 1001 -translate 2 -flip_horizontal True -gpu 3
python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_noaug_elr.yaml -subfolder DEBUG_TN -alpha_c_pdl 0.0 -alpha_c_adv 0.0 -n_labels 2000 -ssl_seed 1001 -translate 2 -flip_horizontal True -gpu 3


# cifar10
python train_triplegan_final_elr.py ./configs/triple_gan_cifar10_noaug_elr.yaml -subfolder DEBUG_CI -alpha_c_pdl 0.0 -alpha_c_adv 0.0 -n_labels 4000 -ssl_seed 1001 -translate 2 -flip_horizontal True -gpu 3


# 
# SSL for TINY 1000
# 


# 
# Generation 
# All scores
# update conditional generation figures
# 


# 
# Ablation
# 


# 
# Fixmatch keep 2 4GPUs
# 
















# # - test bcr on ssl tiny tgan (to generate images and check bcr for bug and check elr for bug)
    
#     # xuan 
#     python train_triplegan.py ./configs/triple_gan_tinyimagenet_mt_aug_sngan.yaml -subfolder Tiny32_SSL_TGAN_BCR -gan_type bcr -n_labels 2000 -gpu 0
#     python train_triplegan.py ./configs/triple_gan_tinyimagenet_mt_noaug_sngan.yaml -subfolder Tiny32_SSL_TGAN_BCR -gan_type bcr -n_labels 2000 -gpu 1

#     python train_triplegan.py ./configs/triple_gan_tinyimagenet_mt_aug_sngan.yaml -subfolder Tiny32_SSL_TGAN_BCR -gan_type bcr -n_labels 1000 -gpu 2
#     python train_triplegan.py ./configs/triple_gan_tinyimagenet_mt_noaug_sngan.yaml -subfolder Tiny32_SSL_TGAN_BCR -gan_type bcr -n_labels 1000 -gpu 3

# # - bcr + mt (original setting cifar10 and tiny. just no improvement or marginal)
#     # should compare with losses in ssl settings to debug or improve

#     # NEW_SVHN g25 g19
#     python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 0.3 -n_labels 1000 -ssl_seed 1001 -translate 2 -gpu 1
#     python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 1.0 -n_labels 1000 -ssl_seed 1001 -translate 2 -gpu 2
#     python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 1.0 -n_labels 1000 -ssl_seed 1001 -pdl_ramp_start 40000 -pdl_ramp_end 60000 -translate 2 -gpu 3
#     python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 1.0 -n_labels 1000 -ssl_seed 1001 -translate 0 -gpu 4
#     python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 3.0 -n_labels 1000 -ssl_seed 1001 -translate 2 -gpu 1

#     # add icr
#     python train_triplegan_final_elr.py ./configs/triple_gan_svhn_icr_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 3.0 -n_labels 1000 -ssl_seed 1001 -translate 2 -key icr -gpu 1

#     # NEW_SVHN 800 g19
#     python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 0.3 -n_labels 800 -ssl_seed 1001 -translate 2 -gpu 2
#     python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 1.0 -n_labels 800 -ssl_seed 1001 -translate 2 -gpu 3
#     python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 1.0 -n_labels 800 -ssl_seed 1001 -translate 0 -gpu 4
    
#     # NEW_SVHN 500 g32
#     python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 0.3 -n_labels 500 -ssl_seed 1001 -translate 2 -gpu 6
#     python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 1.0 -n_labels 500 -ssl_seed 1001 -translate 2 -gpu 5
#     python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 1.0 -n_labels 500 -ssl_seed 1001 -translate 0 -gpu 4

#     # NEW_CIFAR10 g32
#     python train_triplegan_final_elr.py ./configs/triple_gan_cifar10_noaug_elr.yaml -subfolder NEW_CIFAR10 -alpha_c_pdl 3.0 -n_labels 4000 -ssl_seed 1001 -translate 2 -flip_horizontal true -gpu 0
#     python train_triplegan_final_elr.py ./configs/triple_gan_cifar10_noaug_elr.yaml -subfolder NEW_CIFAR10 -alpha_c_pdl 1.0 -n_labels 4000 -ssl_seed 1001 -translate 2 -flip_horizontal true -gpu 1
#     python train_triplegan_final_elr.py ./configs/triple_gan_cifar10_noaug_elr.yaml -subfolder NEW_CIFAR10 -alpha_c_pdl 3.0 -n_labels 4000 -ssl_seed 1001 -translate 0 -flip_horizontal false -gpu 2

#     # add icr
#     python train_triplegan_final_elr.py ./configs/triple_gan_cifar10_icr_elr.yaml -subfolder NEW_CIFAR10 -alpha_c_pdl 3.0 -n_labels 4000 -ssl_seed 1001 -translate 2 -flip_horizontal true -key icr -gpu 3


#     # NEW_TINY g28 g26
#     python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_noaug_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 3.0 -n_labels 2000 -ssl_seed 1001 -translate 2 -flip_horizontal true -gpu 0
#     python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_noaug_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 1.0 -n_labels 2000 -ssl_seed 1001 -translate 2 -flip_horizontal true -gpu 1
#     python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_noaug_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 3.0 -n_labels 2000 -ssl_seed 1001 -translate 0 -flip_horizontal false -gpu 2

#     python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_noaug_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 3.0 -n_labels 1000 -ssl_seed 1001 -translate 2 -flip_horizontal true -gpu 3
#     python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_noaug_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 1.0 -n_labels 1000 -ssl_seed 1001 -translate 2 -flip_horizontal true -gpu 2
#     python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_noaug_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 3.0 -n_labels 1000 -ssl_seed 1001 -translate 0 -flip_horizontal false -gpu 3

#     # add icr
#     python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_icr_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 3.0 -n_labels 2000 -ssl_seed 1001 -translate 2 -flip_horizontal true -key icr -gpu 1


# # try more hyperparameters
#     # g16
#         python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 0.3 -n_labels 1000 -ssl_seed 1001 -translate 0 -gpu 0

#         python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 0.3 -n_labels 800 -ssl_seed 1001 -translate 0 -gpu 1

#         python train_triplegan_final_elr.py ./configs/triple_gan_svhn_noaug_elr.yaml -subfolder NEW_SVHN -alpha_c_pdl 0.3 -n_labels 500 -ssl_seed 1001 -translate 0 -gpu 2

#         python train_triplegan_final_elr.py ./configs/triple_gan_cifar10_noaug_elr.yaml -subfolder NEW_CIFAR10 -alpha_c_pdl 0.3 -n_labels 4000 -ssl_seed 1001 -translate 2 -flip_horizontal true -gpu 3
    
#         python train_triplegan_final_elr.py ./configs/triple_gan_cifar10_noaug_elr.yaml -subfolder NEW_CIFAR10 -alpha_c_pdl 1.0 -n_labels 4000 -ssl_seed 1001 -translate 0 -flip_horizontal false -gpu 4

#         python train_triplegan_final_elr.py ./configs/triple_gan_cifar10_noaug_elr.yaml -subfolder NEW_CIFAR10 -alpha_c_pdl 0.3 -n_labels 4000 -ssl_seed 1001 -translate 0 -flip_horizontal false -gpu 5

#         python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_slow_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 0.3 -n_labels 2000 -ssl_seed 1001 -translate 2 -flip_horizontal true -key slow -gpu 6
#         python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_slow_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 0.3 -n_labels 2000 -ssl_seed 1001 -translate 0 -flip_horizontal false -key slow -gpu 7
#     # g18 g21
#         python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_slow_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 1.0 -n_labels 2000 -ssl_seed 1001 -translate 2 -flip_horizontal true -key slow -gpu 2
#         python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_slow_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 1.0 -n_labels 2000 -ssl_seed 1001 -translate 0 -flip_horizontal false -key slow -gpu 3

#         python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_slow_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 0.3 -n_labels 1000 -ssl_seed 1001 -translate 2 -flip_horizontal true -key slow -gpu 4
#         python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_slow_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 0.3 -n_labels 1000 -ssl_seed 1001 -translate 0 -flip_horizontal false -key slow -gpu 5
#         python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_slow_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 1.0 -n_labels 1000 -ssl_seed 1001 -translate 2 -flip_horizontal true -key slow -gpu 6
#         python train_triplegan_final_elr.py ./configs/triple_gan_tinyimagenet_slow_elr.yaml -subfolder NEW_TINY -alpha_c_pdl 1.0 -n_labels 1000 -ssl_seed 1001 -translate 0 -flip_horizontal false -key slow -gpu 0

#     # baseline slow g23
#         python train_classifier_elr.py ./configs/classifier_tinyimagenet_slow_elr.yaml -subfolder FINAL_BASE_ELR_TINY -n_labels 1000 -translate 0 -flip_horizontal false -ssl_seed 1001 -key slow -gpu 0
#         python train_classifier_elr.py ./configs/classifier_tinyimagenet_slow_elr.yaml -subfolder FINAL_BASE_ELR_TINY -n_labels 1000 -translate 2 -flip_horizontal true -ssl_seed 1001 -key slow -gpu 1
        
#         python train_classifier_elr.py ./configs/classifier_tinyimagenet_slow_elr.yaml -subfolder FINAL_BASE_ELR_TINY -n_labels 2000 -translate 0 -flip_horizontal false -ssl_seed 1001 -key slow -gpu 2
#         python train_classifier_elr.py ./configs/classifier_tinyimagenet_slow_elr.yaml -subfolder FINAL_BASE_ELR_TINY -n_labels 2000 -translate 2 -flip_horizontal true -ssl_seed 1001 -key slow -gpu 3

# # report 
# # report 
# # report

# # baseline
#     # in kun ELR_SVHN

# # ELR svhn
    
