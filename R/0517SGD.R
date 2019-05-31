SGD = function(target_fn, gradient_fn, x, y,theta_0, alpha_0=0.0001){
  data = cbind(x, y)
  n = length(y)
  theta = theta_0 # 初始值猜测
  alpha = alpha_0 # 初始步长
  min_theta = NA
  min_value = Inf # min_value初始值为正无穷
  count = 0
  j = 1
  # 如果循环超过200次仍无改进，停止
  while(count < 200){
    value = 0
    for(i in 1:n){
      xi = as.vector(data[i,1:ncol(data)-1])
      yi = data[i,ncol(data)]
      fi = target_fn(xi, yi, theta)
      value = value +fi
    }
    
    # 如果找到新的最小值，则替换
    if(value < min_value){
      min_theta = theta
      min_value = value
      count = 0
      alpha = alpha_0
    }
    else{
      # 尝试缩小步长改进
      count = count + 1
      alpha = alpha*0.8
    }
    # 向负梯度方向前进
    i = sample(n,1)
    xi = as.vector(data[i,1:ncol(data)-1])
    yi = data[i,ncol(data)]
    gradient_i = gradient_fn(xi, yi, theta)
    theta = theta - as.vector(alpha*gradient_i)
  }
  return(min_theta)
}

#数据
x1 = c(100,80,120,75,60,43,140,132,63,55,74,44,88,20,5,6,15,35,22)
x2 = c(-20, -17, -24, -16, -15, -9, -28, -29, -11, -12,-15, -8, -19,35,40,5,5,20,-3)
x = cbind(x1,x2)
y = c(120, 92, 144, 86, 60, 50, 168, 148, 82, 62, 88, 56, 100,180,170,32,50,150,32)


target_fn = function(x,y,theta){
  return((x%*%theta-y)^2)
}
gradient_fn = function(x,y,theta){
  return((x%*%theta-y)%*%x)
}
SGD(target_fn, gradient_fn, x, y,theta_0 = c(1,1),alpha_0=0.0005)
