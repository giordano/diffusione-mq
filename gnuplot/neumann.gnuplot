set terminal epslatex

#set lmargin at screen 0.17
#set rmargin at screen 1
set samples 1e4
set xlabel "$x$"
set output 'gnuplot/neumann.tex'
set zeroaxis
set mxtics 2
set mytics 2
set key bottom right
plot [0:20][-1:0.4] -cos(x)/x title '$n_{0}(x)$', \
     -cos(x)/x**2 - sin(x)/x  title '$n_{1}(x)$', \
     (-3/x**2+1)*cos(x)/x - 3*sin(x)/x**2 title '$n_{2}(x)$', \
     (-15/x**3+6/x)*cos(x)/x - (15/x**2-1)*sin(x)/x title '$n_{3}(x)$'