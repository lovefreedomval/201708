# �ξ�my.length()�Bmy.sum() �P my.mean() ��Ƨ� sd() ��ƹ�@�X�ӡGmy.sd()
# my.length() ���
my.length <- function(x) {
  count <- 0
  for (i in x) {
    count <- count + 1
  }
  return(count)
}

# my.sum() ���
my.sum <- function(x) {
  my_sum <- 0
  for (i in x) {
    my_sum <- my_sum + i
  }
  return(my_sum)
}

# my.mean() ���
my.mean <- function(x) {
  cnt <- my.length(x)
  summation <- my.sum(x)
  return(summation / cnt)
}

# my.sd()���
my.sd<- function(x){
  mean <- my.mean(x)
  devi_sum <- 0
  n_minus_1 <- my.length(x)-1
  for(i in 1:length(x)){
    devi_sum <- devi_sum + (x[i] - mean)^2  
  }
  return(sqrt(devi_sum /n_minus_1))
}

# ���X inputs
my_vector <- 1:10


# �I�s���
my.sd(my_vector)
sd(my_vector) #��R�������
my.sd(my_vector)==sd(my_vector) #���