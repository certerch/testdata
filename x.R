#匯入資料
score <- read.table("score.csv",header = T,sep=",")

#更改變數名稱
names(score) <-  c("班級","性別","地區","國文","英文","數學")

#更改標籤名稱
score$班級 = factor(score$班級,levels=1:5,labels=c("忠班","孝班","仁班","愛班","信班"))
score$性別 = factor(score$性別,levels=1:2,labels=c("男","女"))
score$地區 = factor(score$地區,levels=1:3,labels=c("北區","中區","南區"))

#轉成titable格式
library(data.table)
tib_score <- data.table(score)

#查看北區的學生成績

tib_score[(tib_score$地區=="北區"),]

#設定班級為索引值，可以省去篩選步驟
setkey(tib_score,地區)
tib_score["北區",]
tib_score[c("北區","南區"),]


#可以設定數個索引值，後面可用J函數引用

setkey(tib_score,班級,性別,地區) #設定三個索引
key(tib_score) #查看索引

tib_score[J("愛班","女","中區"),]
tib_score[J("愛班","男","中區"),]

# 求某欄的平均值、標準差、最大值、最小值

tib_score[,list(mean=round(mean(英文),2),
                min=min(英文),
                max=max(英文)),
            by=c("性別","地區")]

# 將統計量存成另一table
base_static <- tib_score[,list(Mean=round(mean(英文),2),
                SD =round(sd(英文),2),
                Min=min(英文),
                Max=max(英文)),
          by=性別]





