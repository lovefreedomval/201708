# 参俱my.length()my.sum() 籔 my.mean() ㄧ计р sd() ㄧ计龟ㄓmy.sd()
# my.length() ㄧ计
my.length <- function(x) {
  count <- 0
  for (i in x) {
    count <- count + 1
  }
  return(count)
}

# my.sum() ㄧ计
my.sum <- function(x) {
  my_sum <- 0
  for (i in x) {
    my_sum <- my_sum + i
  }
  return(my_sum)
}

# my.mean() ㄧ计
my.mean <- function(x) {
  cnt <- my.length(x)
  summation <- my.sum(x)
  return(summation / cnt)
}

# my.sd()ㄧ计
my.sd<- function(x){
  mean <- my.mean(x)
  devi_sum <- 0
  n_minus_1 <- my.length(x)-1
  for(i in 1:length(x)){
    devi_sum <- devi_sum + (x[i] - mean)^2  
  }
  return(sqrt(devi_sum /n_minus_1))
}

# 玻 inputs
my_vector <- 1:10


# ㊣ㄧ计
my.sd(my_vector)
sd(my_vector) #ノRず喷衡
my.sd(my_vector)==sd(my_vector) #喷衡
