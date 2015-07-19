setwd("output")
x<-read.table("class.freq.dat", header = T)
barplot(as.matrix(x),col=2:6, ylab = "Ratio", xlim=c(0, 7.5))
legend("right",  rownames(x), pch=19, col=2:6)
y<-read.table("class.dat", header = T)
chisq.test(y[,2], p=x[,1])$p.value
chisq.test(y[,3], p=x[,1])$p.value
chisq.test(y[,4], p=x[,1])$p.value
chisq.test(y[,5], p=x[,1])$p.value

chisq.test(y[,3], p=x[,2])$p.value
chisq.test(y[,4], p=x[,2])$p.value
chisq.test(y[,5], p=x[,2])$p.value

chisq.test(y[,5], p=x[,4])$p.value
