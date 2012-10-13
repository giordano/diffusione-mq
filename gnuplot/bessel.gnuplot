set terminal epslatex

#set lmargin at screen 0.17
#set rmargin at screen 1
set samples 1e4
set xlabel "$x$"
set output 'gnuplot/bessel.tex'
set zeroaxis
set mxtics 2
set mytics 2
plot [0:20] sin(x)/x title '$j_{0}(x)$', \
     sin(x)/x**2 - cos(x)/x title '$j_{1}(x)$', \
     (3/x**2-1)*sin(x)/x - 3*cos(x)/x**2 title '$j_{2}(x)$', \
     (15/x**3-6/x)*sin(x)/x - (15/x**2-1)*cos(x)/x title '$j_{3}(x)$'
