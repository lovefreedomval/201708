#hahow_R語言和商業分析 - 洞悉商業世界中的資料科學
#第 1 章，作業 1 - Ch 1 - R 語言基礎 - 基本的資料操作

#第一題：試圖撰寫函數 SummarizeData(data.frame)
#輸入：名為 data.frame 的資料框架，該函數將計算計算 data.frame 的統計量 0    
#輸出：名為 `output` 的資料框架，`output`  columns 的值依序為 `data.frame` 
#每個 column 的平均數（`mean`）、變異數（`var`）、最大值（`max`）、最小值（`min`），
#每個 row 是 `data.frame` 的一個 column 
#利用這個函數，計算 iris 資料集合前四個 columns 的各項統計量。

#The earth laughs in flowers.” -Ralph Waldo Emerson
#https://www.spataru.at/iris-dataset-svm/iris_types.jpg
str(iris)
head(iris)

#自訂函數SummarizeData
#Solution1：apply()系列函數
#example from https://hah'ow.in/creations/5bbacecbe6ed7e001e03e41d
#Holly Lu
SummarizeData <- function(df){
  output <- data.frame(
    MEAN = apply(df,2,mean),      #apply(變數,2col,函數)
    VAR  = apply(df,2,var),       #(暫以大寫命名，方便自己分辨編碼中的向量名稱或函數)
    MAX  = apply(df,2,max),
    MIN  = apply(df,2,min))
  return(output)
}
SummarizeData(iris[1:4])


#Solution2 :迴圈
#example from教師參考答案
SummarizeData2 <- function(df){
  #先建立空的/新的向量(容器)(暫以大寫命名，方便自己分辨編碼中的向量名稱或函數)
  #rep第一個參數僅為dummy用, 是NA或不同數值皆可
  output2 <- data.frame(
    MEAN = rep(NA, 4),
    VAR = rep(4, 4),
    MAX = rep(8, 4),
    MIN = rep(7, 4))
  #迴圈計算output row = input的column運算
  for (i in 1:4){
    output2[i, ] <- c(mean(df[, i]), var(df[, i]), max(df[, i]), min(df[, i]))
  }
  #列名：轉置input column names -> Output Row names
  row.names(output2) <- colnames(df[, 1:4] )
  
  return(output2)
}

SummarizeData2(iris)
#驗算
identical(SummarizeData(iris[1:4]),SummarizeData2(iris))



#第二題：定義第 i 朵花與第 j 朵花的差異程度為兩朵花資料的歐式距離 (Euclidean distance)，
#其中 xik 代表第 i 朵花在 iris資料集合中第 k 個變數的數值。
#試著用 for 迴圈建立一個 150 x 150 的矩陣 A，其中 Aij=d(i,j)。


#Solution1_迴圈計算最小單位至_iris每列(i與j)的同變數k運算後總和
#example from教師參考答案
A <- matrix(0, nrow = 150, ncol = 150)
for(i in 1:150){
  for(j in 1:150){
    for(k in 1:4){
      A[i,j] <- A[i, j] + (iris[i,k] - iris[j, k])^2
          }
        }
}
#因為迴圈是小至1of4變數K,開方要最後寫,而不能在迴圈裡寫
A <- sqrt(A)
      

#Solution2__寫出歐式距離函數後，代入iris每列(i與j)運算迴圈
#example from https://hahow.in/creations/5babde479afd5e009d88c860
#Shan-Jyun Wu
A2 <- matrix(0, nrow = 150, ncol = 150)

euc.dist <- function(x1, x2) sqrt(sum((x1 - x2) ^ 2))
for (i in 1:150){
  for (j in 1:150){
    A2[i,j] <- euc.dist(iris[i, 1:4],iris[j, 1:4])
  }
}

#驗算
z <- A == A2
z[1,81]
A2[1,81]
A[1,81]
identical(A2[1,81],A[1,81])
