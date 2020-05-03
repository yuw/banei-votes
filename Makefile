CSVFILE := banei-votes-2020.csv

all: plot-race plot-round

status:
	git status .

plot-race:
	Rscript plot-total-votes_par-race.R $(CSVFILE) $(ROUND)
	mv Rplots.pdf par-race.pdf
	open par-race.pdf

plot-round:
	Rscript plot-total-votes_par-round.R $(CSVFILE) $(ROUND)
	mv Rplots.pdf par-round.pdf
	open par-round.pdf
