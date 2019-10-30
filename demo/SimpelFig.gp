set term cairolatex pdf color dashed linewidth 2 size 8.5cm,6cm font ", 10"
set output "SimpelFig.tex"
load 'default.inc'  
set xlabel '$\theta$' offset 0,0.5 
set ylabel '$f(\theta)$' offset 1,0 
set yrange [-1.05:1.05]  
set key left bottom 
set key sample 2 #width of sample part 
set key height 1 
set key nobox 
set key Left 
set title 'A simpel figure' offset 0,-1  
set xtics  format "$%h$" 
set ytics  format "$%h$" 
plot '< h5totxt  -s " " -T SimpelFig.h5:sin' ls 1  title '$\sin(\theta)$'  ,\
 '< h5totxt  -s " " -T  SimpelFig.h5:var_2' ls 2  title '$\cos(\theta)$'  
set output 
