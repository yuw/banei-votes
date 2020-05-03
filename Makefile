CSVFILE := banei-votes-2020.csv

status:
	git status .

plot-race:
	Rscript plot-total-votes_par-race.R $(CSVFILE) $(ROUND)
	open Rplots.pdf

plot-round:
	Rscript plot-total-votes_par-round.R $(CSVFILE)
#	open Rplots.pdf
