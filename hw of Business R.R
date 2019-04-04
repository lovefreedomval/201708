#自訂函數SummarizeData
#功能：計算任dataframe中數值欄的統計量
SummarizeData1 <- function(df){
  output <- data.frame(
    mean = rep(0, 4),
    var = rep(0, 4),
    max = rep(0, 4),
    min = rep(0, 4))
  #迴圈計算output'S column = input的
  for (i in 1:4){
    output[i, ] <- c(mean(df[, i]), var(df[, i]), max(df[, i]), min(df[, i]))
  }
  #列名：轉置input column names ->Output Row names
  row.names(output) <- colnames(df[, 1:4] )
  
  return(output)
}

SummarizeData1(iris)

