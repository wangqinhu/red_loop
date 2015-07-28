setwd("output")
bg<-read.table("bg.dat")
bg<-as.numeric(bg$V1)
ed<-read.table("ed.dat")
ed<-as.numeric(ed$V1)
ed30<-read.table("ed30.dat")
ed30<-as.numeric(ed30$V1)
ed60<-read.table("ed60.dat")
ed60<-as.numeric(ed60$V1)
ed100<-read.table("ed100.dat")
ed100<-as.numeric(ed100$V1)
x<-cbind(bg,ed,ed30,ed60,ed100)
pdf(width=6, height=6, file = "mfe.pdf")
boxplot(x, col=2:6, ylab="MFE (kcal/mol)")
dev.off()
t.test(bg, ed, alternative = "t")$p.value
t.test(bg, ed30, alternative = "t")$p.value
t.test(bg, ed60, alternative = "t")$p.value
t.test(bg, ed100, alternative = "t")$p.value

t.test(ed, ed30, alternative = "t")$p.value
t.test(ed, ed60, alternative = "t")$p.value
t.test(ed, ed100, alternative = "t")$p.value

t.test(ed60, ed100, alternative = "t")$p.value

