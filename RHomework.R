#(1) 請讀取final資料夾下的lvr_prices檔案
setwd("E:/riii/final")
load("E:/riii/final/lvr_prices_big5.RData")

#(2) 請問可使用哪個函式觀看檔案的資料結構？
str(lvr_prices)

#(3) 請問可使用哪個函式觀看資料前10筆資料？
head(lvr_prices, 10)

#(3)-2 請問可使用哪個函式觀看資料後10筆資料？
tail(lvr_prices, 10)

#(4) 請篩選出
#  1. city_land_type為住宅用
#  2. total_price > 0
#  3. building_sqmeter > 0
#  4. finish_ymd 非空值
#  的房屋資料,並存入house變數中。[8分]

house = lvr_prices[lvr_prices$city_land_type == "住家用" & total_price > 0 & building_sqmeter > 0 & finish_ymd != Null]
house

#(5) 請使用house資料，利用房屋價格(total_price)及房屋平方米數(building_sqmeter)兩欄位，
#    產生一新欄位為每平方米價格(price_per_sqmeter)，並將其四捨五入到整數位。


#(6) 請使用house資料，利用scale() 將每平方米價格(price_per_sqmeter)欄位資料標準化
#    ，並剔除掉outlier資料(z-score > 3)。[5分]
house = house[abs(scale(house$price_per_sqmeter)) <= 3,]

#(7) 請問在house資料中各行政區(area)的資料筆數為何? 可否畫出其長條圖?

#各個行政區之資料筆數
table(lvr_prices$area)

#畫長條圖
barplot(table(lvr_prices$area), xlab = "台北市之所屬區域", ylab = "筆數")

#(8) 請使用house資料，計算各行政區每平方米價格(price_per_sqmeter)欄位資料的平均數，中位數及標準差
library(dplyr)
# count average
price_per_sqmeter = lvr_prices %>%
group_by(lvr_prices$area) %>%
summarize_at(.vars = vars(land_sqmeter), .funs = funs(mean,median,sd))
price_per_sqmeter


#(9) 請使用house資料,利用ggplot2的facet_wrap函數繪製各行政區房屋每平方米價格(price_per_sqmeter)的直方圖
library(ggplot2)


#(10) 試利用房屋完工日期(finish_ymd)產生一新變數為屋齡(building_age)加入house資料中。
#hint1: 取得當前日期的函數為 Sys.Date()
#hint2: 一年請以365天計算，四捨五入至整數位
#hint3: 將運算完的資料轉為整數型態(integer)

#(11) 請讀取final資料夾下的house_danger檔案，
#     並將house資料集和house_danger資料集以left outer join方式join起來，
#     存回house變數中