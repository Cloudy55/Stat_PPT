#牛顿迭代要求函数连续可导
#Write R code to find the root of g(x) = 3x5 - 4x4 + 6x3 + 4x - 4

g <- function(x){  return(3*x^5 -4*x^4 +6*x^3 +4*x -4) }

dg <- function(x){  return(15*x^4 -16*x^3 +18*x^2 +4) }


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
          return(c(x[i],f(x[i])))}
    }
  }
}
Newton_Raphson(g,dg,3,1e-07)
