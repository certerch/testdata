names(score) <-  c("班級","性別","地區","國文","英文","數學")
score$班級 = factor(score$班級,levels=1:5,labels=c("忠班","孝班","仁班","愛班","信班"))
score$性別 = factor(score$性別,levels=1:2,labels=c("男","女"))
score$地區 = factor(score$地區,levels=1:3,labels=c("北區","中區","南區"))

