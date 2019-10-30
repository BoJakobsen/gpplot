set term cairolatex pdf color linewidth 2 size 8.5cm,20cm font ", 10"
set output "MultiplotFig.tex"
set yrange [-1.05:1.05]  
set xrange [0:7]  
set ytics  format "$%h$" 
set multiplot layout 2,1   
set xlabel ''  
set xtics format " "  #remove x tics for this plot  
set title 'A multiplot figure' offset 0,-1  
set tmargin 4.0 
set bmargin 0.2 
set ylabel '$\sin(\theta)$' offset 1,0 
plot '< h5totxt  -s " " -T MultiplotFig.h5:sin' ls 1  title ''  
set xlabel '$\theta$' offset 0,0.5 
set bmargin 4.0 
set tmargin 0.2 
set title ''   
set key off 
set xtics  format "$%h$" 
set ylabel '$\cos(\theta)$' offset 1,0 
plot '< h5totxt  -s " " -T MultiplotFig.h5:cos' ls 1  title ''  
unset multiplot 
set output 
