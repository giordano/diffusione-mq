set terminal epslatex

set lmargin at screen 0.17
set rmargin at screen 1
set samples 1e4
set logscale y
set xlabel "$\\theta$"
set ylabel "$F(\\theta) = \\bigg(\\frac{\\alpha^{2}\\hslash^{2}}{2mV_{0}}\\bigg)^{2} \\sigma(\\theta)$"
set xtics ("$0$" 0, "$\\pi/4$" pi/4, "$\\pi/2$" pi/2, "$3\\pi/4$" 3*pi/4, \
"$\\pi$" pi)
# cambio la separazione verticale fra le voci della legenda, altrimenti
# sarebbero troppo vicine
set key spacing 1.3
F(x,k)=1/(4*k*sin(x/2)**2 + 1)**2
set output 'gnuplot/sez-urto-yukawa.tex'
plot [0:pi][5e-4:1] F(x,1) title "$(k/\\alpha)^{2} = 1$", \
     F(x,10) title "$(k/\\alpha)^{2} = 10$", \
     F(x,100) title "$(k/\\alpha)^{2} = 100$"
