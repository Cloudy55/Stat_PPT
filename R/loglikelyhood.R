NormlogLike = function(x,mu,sigma){
  return(sum(dnorm(x,mu,sigma,log = TRUE)))
}

f = function(mu){
  return(NormlogLike(mu,x=data,sigma = 1200))
}

dNormlogLike = function(x,mu,sigma){
  return(sum((x-mu)/sigma^2))
}


df = function(mu){
  return(dNormlogLike(mu,x=data,sigma = 1200))
}

ddNormlogLike = function(x,mu,sigma){
  return(-length(x)/sigma^2)
}

ddf = function(mu){
  return(ddNormlogLike(mu,x=data,sigma = 1200))
}

data = c(3000,2500,5000,2456,5637,3800,3040,4308,1300,4212,5601)

#利用牛顿迭代求极大似然函数极大值
Newton_Raphson <- function(f,df,x0,episilon){
  if(f(x0) == 0)
    return(c(x0,0))
  else{
    x = rep(0,10000) 
    x[1] = x0
    for(i in 2:10000){
      if(df(x[i-1]) == 0)
        return("error")
      else{
        x[i] = x[i-1] - f(x[i-1])/df(x[i-1])
        if(abs(f(x[i])) < episilon)
          return(c(x[i],f(x[i])))
      }
    }
  }
}

Newton_Raphson(df,ddf,4000,10)

#验证
x = c(3000,2500,5000,2456,5637,3800,3040,4308,1300,4212,5601)
mu = seq(min(x),max(x),50)
sigma = 1200
z = matrix(NA,length(mu),length(sigma))  #z设为空矩阵
for(i in 1:length(mu))
  for (j in 1:length(sigma))
    z[i,j]=NormlogLike(x,mu[i],sigma[j])
which(z==z[which.max(z)],arr.ind = T)
mu[49]
#[1] 3700