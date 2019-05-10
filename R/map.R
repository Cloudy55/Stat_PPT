#1.在地图上绘制各省份2010年预期寿命图

install.packages('leafletCN')
library(leafletCN)

data = read.csv("C:/Users/lenovo/Desktop/ex_life.csv",header = TRUE)
#data缺少香港，澳门，台湾的数据
regionNames("china")

#绘图
geojsonMap(data, "china",popup =  paste0(data$Province, ":", data$ex_life2010), 
           palette = "Greens",legendTitle = "预期寿命")

geojsonMap(data, "china",popup =  paste0(data$Province, ":", data$ex_life2010), 
           palette = topo.colors(2),legendTitle = "预期寿命")

#2.查找学校地图
require(leaflet)
# %>% 把左件的值发送给右件的表达式，并作为右件表达式函数的第一个参数

#不带标记
leaflet() %>% addTiles() %>% setView(lat = 40.169, lng = 116.275, zoom = 14)
#带标记
leaflet() %>% addTiles() %>% addMarkers(lat = 40.169, lng = 116.275)
#比心
heart = data.frame(lat = 40.171 + c(0,0.0003,0.0007,0.0003,-0.0003,-0.0009,-0.0014,-0.0019,-0.0023,0.0003,0.0007,0.0003,-0.0003,-0.0009,-0.0014,-0.0019), 
               lng = 116.2775+c(0,0.0008,0.0015,0.0021,0.0018,0.0015,0.001,0.0005,0,-0.0008,-0.0015,-0.0021,-0.0018,-0.0015,-0.001,-0.0005))
heart %>% leaflet() %>% addTiles() %>% addMarkers()
