#
# Rscript banei-votes-2020.csv $CSVfile $round
# $CSVfile = データ元CSV
# $round = 通算開催数
# グラフをRplot.pdfに出力する
#

CSVfile <- commandArgs(trailingOnly=TRUE)[1]

data <- read.csv(CSVfile, header=T)
#data[,1] <- as.Date(data[,1], "%Y-%m-%d")

races <- NULL

round <- as.integer(commandArgs(trailingOnly=TRUE)[2])# 引数としてとった文字列（$round）を整数に変換
round <- round - 1

n <- round:0

for (i in n){
    races <- cbind(races, data[(11 * i + 1) : (11 + 11 * i), 3])
}

par(bg="black", fg="white",
col.axis="white", col.lab="white", cex.lab=1.5)

matplot(data[1:11,2], races,
type="l", lwd=3,
xaxt="n",
xlab="race #", ylab="total votes")
axis(side=1,at=1:11)

matpoints(data[1:11,2], data[(11 * round + 1) : (11 + 11 * round), 3],
type="l", lwd=6, col="white")# 最新は白線で表す
