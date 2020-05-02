data <- read.csv("banei-votes-2020.csv", header=T)
#data[,1] <- as.Date(data[,1], "%Y-%m-%d")

races <- cbind(#
data[45:55,3],
data[34:44,3],
data[23:33,3],
data[12:22,3],
data[1:11,3])

par(bg="black", fg="white",
col.axis="white", col.lab="white", cex.lab=1.5)

#pdf("plot.pdf", bg="black", fg="white")

matplot(data[1:11,2], races,
type="l", lwd=3,
xaxt="n",
xlab="race #", ylab="total votes",
col.axis="white", col.lab="white", cex.lab=1.5)
axis(side=1,at=1:11)

matpoints(data[1:11,2], data[45:55,3], type="l", lwd=6, col="white")

#dev.off()