setwd("output")
x<-read.table("class.freq.dat", header = T)
barplot(as.matrix(x),col=2:6, ylab = "Ratio", xlim=c(0, 7.5))
legend("right",  rownames(x), pch=19, col=2:6)
