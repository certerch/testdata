# 清空环境
rm(list=ls())

# 安装包并加载包
# 使用k-means聚类所需的包：factoextra和cluster 
site="https://mirrors.tuna.tsinghua.edu.cn/CRAN"
package_list = c("factoextra","cluster")
for(p in package_list){
  if(!suppressWarnings(suppressMessages(require(p, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)))){
    install.packages(p, repos=site)
    suppressWarnings(suppressMessages(library(p, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)))
  }
}

# 数据准备
# 使用内置的R数据集USArrests
data("USArrests")
# remove any missing value (i.e, NA values for not available)
USArrests = na.omit(USArrests) #view the first 6 rows of the data
head(USArrests, n=6) 
# 显示测试数据示例如下

desc_stats = data.frame( "最小值"=apply(USArrests, 2, min),#minimum
                         "最大值"=apply(USArrests, 2, max),#maximum
                         "中位數"=apply(USArrests, 2, median),#median
                         "平均數"=apply(USArrests, 2, mean),#mean
                         "標準差"=apply(USArrests, 2, sd)#Standard deviation
                         
)
desc_stats = round(desc_stats, 0)#保留小数点后一位head(desc_stats)
desc_stats

df_stats = data.frame( "Min"=apply(score, 2, min),#minimum
                       "Max"=apply(score, 2, max),#maximum
                       "Med"=apply(score, 2, median),#median
                       "Mean"=apply(score, 2, mean),#mean
                       "SD"=apply(score, 2, sd)#Standard deviation
                         
)
names(df_table) <-  c("班級","性別","地區","國文","英文","數學")
df_table$班級 = factor(df_table$班級,levels=1:5,labels=c("忠班","孝班","仁班","愛班","信班"))
df_table$性別 = factor(df_table$性別,levels=1:2,labels=c("男","女"))
df_table$地區 = factor(df_table$地區,levels=1:3,labels=c("北區","中區","南區"))
df <-as.data.frame(score)

tapply(df, df$CLASS, min)

library(data.table)
library(dplyr)
df2 <- data.table(df)

max1 <- df_table[,max(英文),by ="班級"]
main1 <- df_table[,min(英文),by ="班級"]

names(max1) <-c("班級","最大值" )

select(df_table,"國文")