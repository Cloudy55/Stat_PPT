library(Rcpp)
#cpp函数求斐波那契数列
cppFunction(
  'int fib_cpp_0(int n){
  if(n==1||n==2) return 1;
  return(fib_cpp_0(n-1)+fib_cpp_0(n-2));
  }'
)
#r函数
fib_r <- function(n){
  if(n==1||n==2) return(1)
  return(fib_r(n-1)+fib_r(n-2))
}
#比较二者运行时间
system.time(fib_r(30))
system.time(fib_cpp_0(30))
#rcpp快很多

#调用cpp
setwd("D:\\stat")
sourceCpp("fib_cpp_1.cpp")

system.time(fib_cpp_0(50))
system.time(fib_cpp_1(50))
