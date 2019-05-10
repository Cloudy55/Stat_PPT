#1.在地图上绘制交互式各省份2010年预期寿命图

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

#带标记
leaflet() %>% addTiles() %>% addMarkers(lat = 40.169, lng = 116.275)
#不带标记
leaflet() %>% addTiles() %>% setView(lat = 40.169, lng = 116.275, zoom = 14)

