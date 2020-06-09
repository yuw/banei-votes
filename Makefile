CSVFILE := banei-votes-2020.csv
OFFICIALCSVFILE := official-sales-2020.csv

all: status

status:
	git status .

double: plot-race plot-round

plot-race:
	Rscript plot-total-votes_par-race.R $(CSVFILE) $(ROUND)
	cp Rplots.pdf par-race.pdf
	rm Rplots.pdf
	open par-race.pdf

plot-round:
	Rscript plot-total-votes_par-round.R $(CSVFILE) $(ROUND)
	cp Rplots.pdf par-round.pdf
	rm Rplots.pdf
	open par-round.pdf

official-salse:
	Rscript plot-official-sales.R $(OFFICIALCSVFILE) $(ROUND)
	cp Rplots.pdf official-sales.pdf
	rm Rplots.pdf
	open official-sales.pdf
