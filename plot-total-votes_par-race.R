#
# Rscript banei-votes-2020.csv $CSVfile $round
# $CSVfile = データ元CSV
# $round = 通算開催数
# レース毎の投票数グラフをRplot.pdfに出力する
#

#install.packages("colorspace", dependencies = TRUE)
library(colorspace)# 折れ線の色制御のため

CSVfile <- commandArgs(trailingOnly = TRUE)[1]

data <- read.csv(CSVfile, header = T)

races <- NULL

round <- as.integer(commandArgs(trailingOnly = TRUE)[2])# 引数としてとった文字列（$round）を整数に変換
round <- round - 1

for (i in 0 : round){
   races <- cbind(races, data[(12 * i + 1) : (12 + 12 * i), 3] - data[(12 * i + 1) : (12 + 12 * i), 4])
}

races[, (round - 4) : (round + 1)]

par(bg = "black", fg = "white",
col.axis = "white", col.lab = "white", cex.lab = 1.5)

matplot(data[1 : 12, 2], races,
type = "l", lwd = 3,
xaxt = "n",
xlab = "race #", ylab = "total votes",
lty = 1, col = rainbow_hcl((round + 1), c = 150))

race_number <- NULL

for (i in 1 : 12){
    race_number <- rbind(race_number, paste(i, "R", sep = ""))
}

axis(side = 1, labels = race_number, at = 1 : 12)

matpoints(data[1 : 12, 2], data[(12 * round + 1) : (12 + 12 * round), 3],
type = "o", pch = 5, lwd = 6, col = "white")# 最新は白線で表す

legend("topleft", legend = "current",
lty = 1, col = "white", pch = 5, lwd = 6)
