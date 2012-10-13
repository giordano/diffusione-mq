##### Variabili
SHELL			= /bin/sh
CARTELLA		= $(shell basename $$(pwd))
PRINCIPALE		= diffusione
PRINCIPALE_TEX		= $(PRINCIPALE).tex
PRINCIPALE_PDF		= $(PRINCIPALE).pdf
BIBLIOGRAFIA		= bibliografia.bib
IMMAGINI_GNUPLOT	= $(wildcard gnuplot/*.gnuplot)
IMMAGINI_GNUPLOT_PDF	= $(patsubst %.gnuplot,%.pdf,$(IMMAGINI_GNUPLOT))
IMMAGINI_GNUPLOT_EPS	= $(patsubst %.gnuplot,%.eps,$(IMMAGINI_GNUPLOT))
IMMAGINI_GNUPLOT_TEX	= $(patsubst %.gnuplot,%.tex,$(IMMAGINI_GNUPLOT))
TUTTI_TEX		= $(PRINCIPALE_TEX) $(BIBLIOGRAFIA)
CLEAN_FILE		= *.aux *.bbl *.bcf *.blg *-blx.bib *.fdb_latexmk *.fls \
	*.idx *.ilg *.ind *.lof *.log *.nav *.out *.pgf-plot.* *.run.xml *.snm \
	*.toc *~ $(IMMAGINI_GNUPLOT_EPS)
DISTCLEAN_FILE		= *.pdf $(IMMAGINI_GNUPLOT_PDF) $(IMMAGINI_GNUPLOT_TEX)

##### Regole
.PHONY: pdf clean distclean dist full-dist

pdf: $(PRINCIPALE_PDF)

$(PRINCIPALE_PDF): $(TUTTI_TEX) $(IMMAGINI_GNUPLOT_PDF)
	latexmk -pdf $(PRINCIPALE_TEX)

# Per compilare tutte le immagini in formato EPS:
gnuplot/%.eps: gnuplot/%.gnuplot
	gnuplot $<

# Per generare i file .tex da includere nel documento.
# La regola è uguale a quella precedente:
gnuplot/%.tex: gnuplot/%.gnuplot
	gnuplot $<

gnuplot/%.pdf: gnuplot/%.eps
	epstopdf $<

# Per fare pulizia dei file temporanei generati:
clean:
	rm -f $(CLEAN_FILE)

# Per cancellare tutti i file generati nella compilazione lasciando solo il
# sorgente:
distclean: clean
	rm -f $(DISTCLEAN_FILE)

# Per creare un archivio compresso contenente il sorgente e il repository di git
dist: $(TUTTI_TEX) $(BIBLIOGRAFIA) distclean
	git gc # comprimo il repository di git per ridurre al minimo la tarball
	cd .. && tar -cJvpsf $(CARTELLA).tar.xz --exclude=$(CARTELLA)/auto $(CARTELLA)/

# Crea un archivio compresso (.tar.xz) contenente tutte le immagini e senza il
# repo git
full-dist: $(PRINCIPALE_PDF) clean
	cd .. && tar -cJvpsf $(CARTELLA).tar.xz --exclude=$(CARTELLA)/auto --exclude-vcs $(CARTELLA)/
