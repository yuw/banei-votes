data <- read.csv("banei-votes-2020.csv", header=T)
#data[,1] <- as.Date(data[,1], "%Y-%m-%d")

races <- NULL

for (i in 4:0){
    races <- cbind(races, data[(11 * i + 1) : (11 + 11 * i), 3])
}

par(bg="black", fg="white",
col.axis="white", col.lab="white", cex.lab=1.5)

matplot(data[1:11,2], races,
type="l", lwd=3,
xaxt="n",
xlab="race #", ylab="total votes")
axis(side=1,at=1:11)

matpoints(data[1:11,2], data[45:55,3], type="l", lwd=6, col="white")
