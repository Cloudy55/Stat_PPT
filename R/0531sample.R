#生成指数分布的随机数

#定义累积分布函数(CDF)逆函数
invcdf = function(x,lamda){
  return(-log(1-x)/lamda)
}
#生成均匀分布随机数
a = runif(10000)
#求CDF横轴
b = invcdf(a,2)

#r自带指数分布随机数
c = rexp(10000,2)

#比较
par(mfrow = c(1,2))
hist(b)
hist(c)

#已知gamma分布，产生卡方分布随机数

#验证当α=n/2，β=1/2时，伽马分布就是自由度为n的卡方分布，X^2(n)
a = rgamma(10000,shape = 2,rate = 0.5)
b = rchisq(10000, df = 4)
par(mfrow = c(1,2))
hist(a)
hist(b)
#利用上述特例产生卡方分布随机数
i = 1
y = NULL
M = 1
while(i<1000) {
  x = rgamma(1,shape = 2,rate = 0.5)
  u = runif(1)
  if(u<dchisq(x, df=4)/(M*dgamma(x,shape = 2,rate = 0.5)))
    y[i] = x
    i = i+1
}
b = rchisq(10000, df = 4)
hist(b)
hist(y)

#beta = 0.25
i = 1
y = NULL
M = 4
while(i<10000) {
  x = rgamma(1,shape = 2,rate = 0.25)
  u = runif(1)
  if(u<dchisq(x, df=4)/(M*dgamma(x,shape = 2,rate = 0.25)))
    y[i] = x
  i = i+1
}
b = rchisq(10000, df = 4)
hist(b)
hist(y)


