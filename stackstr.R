setwd("output")
pdf(width=6, height=6, file = "stack.pdf")
x<-read.table("class.freq.dat", header = T)
par(mar(4,4,4,4))
barplot(as.matrix(x),col=2:6, ylab = "Ratio", xlim=c(0, 8.5))
legend("topright",  rownames(x), pch=19, col=2:6)
dev.off()

y<-read.table("class.dat", header = T)
chisq.test(y[,2], p=x[,1])$p.value
chisq.test(y[,3], p=x[,1])$p.value
chisq.test(y[,4], p=x[,1])$p.value
chisq.test(y[,5], p=x[,1])$p.value

chisq.test(y[,3], p=x[,2])$p.value
chisq.test(y[,4], p=x[,2])$p.value
chisq.test(y[,5], p=x[,2])$p.value

chisq.test(y[,5], p=x[,4])$p.value
