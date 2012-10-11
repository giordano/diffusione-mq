set terminal epslatex

set lmargin at screen 0.17
set rmargin at screen 1
set samples 1e4
set logscale y
set xlabel "$r$"
set ylabel "$V(r)$"
set output 'gnuplot/potenziale-yukawa.tex'
plot [0:10][5e-4:1000] exp(-x)/x title "Yukawa", 1/x title "Coulomb"
