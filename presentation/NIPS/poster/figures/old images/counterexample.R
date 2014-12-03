#library("ggplot2")
#n=60
#f=rep(0,n)
#i=10
#f[i]=1
#barplot(f+1, col="blue")
#plot(x=1:n, y=f, col='blue', xlab=expression(i), ylab=expression(f(a)), pch=19)
#lines(x=1:n, f, col='blue')

x=1:1000
l=length(x)/100
z=x/l
i=10
f=as.numeric((z>=i)&(z<i+1))
plot(z, f,col="red", yaxt="n", xaxt="n", bty="n", ylab=NA, xlab=NA)
polygon(c(min(z), z, max(z)), c(min(f), f, min(f)),  col = "red") 
pdf("C:/Users/Dan/Dropbox/Talks/NIPS 2013/figures/counterexample.pdf", 
    width=6, height=5, units="in", res=300)
dev.off()
