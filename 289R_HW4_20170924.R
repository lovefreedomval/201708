# 公正的骰子，必須出現三次六點才可以停止 - 請問總共要投幾次？ - 投擲的歷史紀錄為何？

dice_flips <- c()  # 投擲紀錄
dice_vector =c(1:6)  # 定義骰子的內容/結果
i <- 1

while (sum(dice_flips==6) < 3){  # 什麼條件下要一直執行
  dice_flips[i] <- sample(dice_vector, size = 1)  # 用sample函數骰骰子, 並把每次結果紀錄給dice_flips
  i <- i + 1  # while迴圈往後交棒=指定下一次
}

dice_flips # 印出投擲紀錄
length(dice_flips) # 總共投了幾次