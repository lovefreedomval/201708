# ��������l�A�����X�{�T�����I�~�i�H���� - �а��`�@�n��X���H - ���Y�����v��������H

dice_flips <- c()  # ���Y����
dice_vector =c(1:6)  # �w�q��l�����e/���G
i <- 1

while (sum(dice_flips==6) < 3){  # �������U�n�@������
  dice_flips[i] <- sample(dice_vector, size = 1)  # ��sample��ƻ��l, �ç�C�����G������dice_flips
  i <- i + 1  # while�j�驹����=���w�U�@��
}

dice_flips # �L�X���Y����
length(dice_flips) # �`�@��F�X��