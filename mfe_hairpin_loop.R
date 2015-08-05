setwd("output")
bg<-read.table("bg.h.dat")
bg<-as.numeric(bg$V1)
ed<-read.table("ed.h.dat")
ed<-as.numeric(ed$V1)
ed30<-read.table("ed30.h.dat")
ed30<-as.numeric(ed30$V1)
ed60<-read.table("ed60.h.dat")
ed60<-as.numeric(ed60$V1)
ed100<-read.table("ed100.h.dat")
ed100<-as.numeric(ed100$V1)
x<-cbind(bg,ed,ed30,ed60,ed100)
pdf(width=6, height=6, file = "mfe_hairpin_loop.pdf")
cc<-rev(heat.colors(5))
boxplot(x, col=c(cc[1],cc[3],cc[2],cc[4],cc[5]), ylab="MFE (kcal/mol)")
dev.off()
t.test(bg, ed, alternative = "t")$p.value
t.test(bg, ed30, alternative = "t")$p.value
t.test(bg, ed60, alternative = "t")$p.value
t.test(bg, ed100, alternative = "t")$p.value

t.test(ed, ed30, alternative = "t")$p.value
t.test(ed, ed60, alternative = "t")$p.value
t.test(ed, ed100, alternative = "t")$p.value

t.test(ed60, ed100, alternative = "t")$p.value

