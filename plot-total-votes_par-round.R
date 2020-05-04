#
# Rscript banei-votes-2020.csv $CSVfile $round
# $CSVfile = データ元CSV
# $round = 通算開催数
# 開催日毎の投票数グラフをRplot.pdfに出力する
#

CSVfile <- commandArgs(trailingOnly = TRUE)[1]

data <- read.csv(CSVfile, header = T)

races <- NULL

round <- as.integer(commandArgs(trailingOnly = TRUE)[2])# 引数としてとった文字列（$round）を整数に変換
round <- round - 1

for (i in 0 : round){
    races <- rbind(races, sum(data[(11 * i + 1) : (11 + 11 * i), 3] - data[(11 * i + 1) : (11 + 11 * i), 4]))
}

round_date <- NULL

for (i in 0 : round){
    round_date <- rbind(round_date, data[(11 * i + 1), 1])
}

total_votes <- cbind(round_date, races)
#total_votes

par(bg = "black", fg = "white",
col.axis = "white", col.lab = "white", cex.lab = 1.5)

total_votes_date <- as.POSIXlt(as.Date(total_votes[, 1], format = "%Y-%m-%d"))
#total_votes_date
#total_votes_date$mon + 1
#total_votes_date$mday

total_votes_date_month_day <- NULL

for (i in 0 : round){
    total_votes_date_month_day <- rbind(total_votes_date_month_day,
    paste(total_votes_date[i + 1]$mon + 1, total_votes_date[i + 1]$mday, sep = "/"))
}

#total_votes_date_month_day

total_votes_round <- as.integer(total_votes[1 : (round + 1), 2])
total_votes_round

plot(xlim = c(1, round + 1), total_votes_round,
type = "o", pch = 5, lwd = 3, col = "white",
xaxt = "n",
xlab = "date", ylab = "total votes")
axis(side = 1,
labels = total_votes_date_month_day, at = 1 : (round + 1))

votes_mean <- mean(total_votes_round)
#votes_mean
votes_mean_wo_1st <- mean(total_votes_round[2 : (round + 1)])
#votes_mean_wo_1st

abline(h = c(votes_mean, votes_mean_wo_1st),
lwd = 3, col = c("yellow", "pink"))

legend("topright", legend = c(votes_mean), title = "mean",
lty = 1, col = c("yellow"), lwd = 3)
legend("bottomleft", legend = c(votes_mean_wo_1st), title = "mean w/o 4/24",
lty = 1, col = c("pink"), lwd = 3)
