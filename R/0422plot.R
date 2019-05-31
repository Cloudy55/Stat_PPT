#par画图之前的设置

#par(mfrow=c(2,3))  row表示按行先排
#par(mfcol=c(2,3))  col表示按列先排

#1.设置横纵坐标的方向
par(mfrow=c(2,2))

par(las=0)  
plot(0,main="par(las=0)")

par(las=1)
plot(0,main="par(las=1)")

par(las=2)
plot(0,main="par(las=2)")

par(las=3)
plot(0,main="par(las=3)")

#2.设置坐标轴名称的位置
par(mfrow=c(2,2))
par(adj=0)
plot(0,main="par(adj=0)",ylab="ylab",xlab="xlab")
par(adj=.5)
plot(0,main="par(adj=.5)",ylab="ylab",xlab="xlab")
par(adj=.7)
plot(1,main="par(adj=.7)",ylab="ylab",xlab="xlab")
par(adj=1)
plot(1,main="par(adj=1)",ylab="ylab",xlab="xlab")

#3.设置坐标轴框线
par(mfrow=c(2,4))
par(bty="o")
plot(0,main="par(bty=\"o\")")
par(bty="l")
plot(0,main="par(bty=\"l\")")
par(bty="7")
plot(0,main="par(bty=\"7\")")
par(bty="n")
plot(0,main="par(bty=\"n\")")
par(bty="c")
plot(0,main="par(bty=\"c\")")
par(bty="u")
plot(0,main="par(bty=\"u\")")
par(bty="]")
plot(0,main="par(bty=\"]\")")

#4.图中图
# give 100 random t with df 12
x <- rt(100, df=12)
# make a histgram
hist( x, col = "light blue")
# prepare to add a new small graph
op <- par(fig = c(.02,.42,.53,.99),new = TRUE)  #fig=c(x1,x2,y1,y2)设置横纵坐标范围
# the qqnorm in the small graph
qqnorm(x, xlab = "", ylab = "", main = "", axes = FALSE)
# add a qq line in the small graph
qqline(x, col = "red", lwd = 2)
# set the line width of the small frame box
box(lwd=1)
# apply
par(op)

#5.分割画布
# split display into two screens(1,2)
split.screen(c(2,1))
# split bottom half in two(3,4)
split.screen(c(1,2),2)
# activate screen (1), the top one and plot something
screen(1)
plot(c(1:10),c(1:10),type="l",main="Screen(1)")
# activate screen (3), the top one and plot something
screen(3)
plot((1:10),(1:10),type="l",main="Screen(3)")
# activate screen (4), the top one and plot something
screen(4)
plot((1:10),type="l",main="Screen(4)")
# exit split-screen mode
close.screen(all = TRUE)   #关闭screen☆

#练习，上3下2
split.screen(c(2,1))
split.screen(c(1,3),1)
split.screen(c(1,2),2)
screen(3)
plot((1:10),type="l",main="Screen(1)")
screen(4)
plot(c(1:10),type="l",main="Screen(2)")
screen(5)
plot(c(1:10),type="l",main="Screen(3)")
screen(6)
plot(c(1:10),type="l",main="Screen(4)")
screen(7)
plot(c(1:10),type="l",main="Screen(5)")
close.screen(all = TRUE)

#6.添加网格线
par(mfrow=c(2,2))
plot(1:3)
# grid only in y-direction
grid(nx=NA, ny=5,col="gray")

plot(1:3)
# only x-direction
grid(nx=5,ny=NA, col="red")

plot(1:3)
# both x and Y
grid(nx = 5, ny = 5,lty="dashed",col="blue")

plot(1:3)
# x and y but different numbers
grid(nx = 3, ny = 5)

#7.Double axises graph
set.seed(1) 
par(mar=c(5,5,5,5)) # set the margin,设置与图四周的距离
par(bty="o")

x1<-sort(rnorm(100,mean=20,sd=5)) # asumption this is Interest rate
x2<-x1^3 # this is GDP
#xaxt='n'表示不绘制刻度值及刻度线,‘s’为默认值，表示绘制
plot(x2,xaxt='n',yaxt='n',type="l",col="green",xlab="",ylab="")  
axis(1) # add the axis on bottom
axis(2,col="green") # add the axis on left
par(new=TRUE) # add new plot on the current graph
par(bty="n")  #保证不覆盖左坐标轴
plot(x1,xaxt='n',yaxt='n',type="l",col="red",xlab="",ylab="")
axis(4,col="red") # add the axis on right
# We will give the three axises labels
mtext(c("Time","GDP(mil. $)","Interest rate(%)"),
      side=c(1,2,4),line=3)
title("GDP with interest rate") # give the main title

#8.插入数学公式
hist(rnorm(1000),xlim=c(-3,3),freq=FALSE)
x<-seq(-5,5,.01)
curve(dnorm(x),add=TRUE) #在直方图上添加曲线
# add a density expression，用法类似CTex语言
text(x=2, y=.35, 
     expression(paste("f(x)=",frac(1,sqrt(2*pi)*sigma),
                      exp(-frac(1,2*sigma^2)*((x-mu)^2)))))

#更多用法使用命令“demo(plotmath)”查看

#9.长标题，strwrap函数,width控制每行长度
plot(0:3,type='l',main=paste(strwrap("This is a really long title
                            that I can not type it properly but we can use
                            strwap function to wrap it", width=55)))

#10.添加图例
x<-seq(0,1,.01)
plot(x,dbeta(x,5,1),type="l", ylim=c(0,3),
     col="green", lty=1,lwd=2,xlab="",ylab="") #dbeta函数，beta分布密度函数
lines(x,dbeta(x,.5,.5), col="red",lty=2,lwd=2)
lines(x,dbeta(x,1,3),col="blue",lty=3,lwd=2)
lines(x,dbeta(x,2,2), col="pink",lty=4,lwd=2)
lines(x,dbeta(x,2,5), col="black",lty=5,lwd=2)
lines(x,dbeta(x,1,1),col="orange",lty=6,lwd=2)
legend("topleft",
       c("Beta(5,1)","Beta(.5,.5)","Beta(1,3)",
         "Beta(2,2)","Beta(2,5)","Beta(1,1)"),
       lty=c(1,2,3,4,5,6),
       col=c("green","red","blue","pink","black","orange"),
       ncol=2)

#11.多变量绘图
palette(rainbow(12)) # 调色板，取rainbow的12个颜色

#利用mtcars数据集绘制星图，也称雷达图，每个小图表示一个实体，每个扇形(箱线图)表示一个变量
#从红色开始表示第一个变量，逆时针转圈
#对每个变量，画出其在所有实体构成的数据的箱线图中的位置，最小值对应的圆弧不画
#draw.segments参数设置图为弧形，默认为直线
stars(mtcars[1:4, 1:7], len = 0.8, key.loc = c(12, 1.5),
      main = "Motor Trend Cars",draw.segments = TRUE)

#画脸谱图
library("aplpack")
#sample(1:1000,128),从1:1000中随机取128个整数
#face.type = 2,表示以圣诞老人为原型
faces(matrix(sample(1:1000,128),16,8),face.type = 2,main="random faces") 



