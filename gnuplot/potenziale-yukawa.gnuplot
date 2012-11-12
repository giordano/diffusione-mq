set terminal epslatex

set lmargin at screen 0.20
set rmargin at screen 0.98
set samples 1e4
set logscale y
set xlabel "$r$"
set ylabel "$V(r)$"
set format y "\\num{%g}"
set xtics 2
set mxtics 2
set output 'gnuplot/potenziale-yukawa.tex'
plot [0:20][1e-10:100] exp(-x)/x title "Yukawa", 1/x title "Coulomb"
