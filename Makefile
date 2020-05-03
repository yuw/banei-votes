CSVFILE := banei-votes-2020.csv

all: plot-race plot-round

status:
	git status .

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
