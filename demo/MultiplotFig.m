%define some random test data
x=linspace(0,2*pi);
y1=sin(x);
y2=cos(x);



%% make a test matlab plot

% this will only be run if matlab is interactive
if plotit
    figure; hold on; box on;
    plot(x,y1,'r')
    plot(x,y2,'g')
end

%% make the gnuplot plot
 

gstart('MultiplotFig','MultiplotFig.tex','cairolatex pdf color linewidth 2 size 8.5cm,20cm font ", 10"') % for the make file to work name has to be the same as .m file
 

% set axis range
gset 'yrange [-1.05:1.05] '
gset 'xrange [0:7] '

% set a nice formate of the y-axis tics labels
gset 'ytics  format "$%h$"'

%set the multiplot with 2,1 figures
gset 'multiplot layout 2,1  '

% removed xlables and xtics labels for first plot
gset 'xlabel '''' '
gset 'xtics format " "  #remove x tics for this plot ' 

% set a title here 
gset 'title ''A multiplot figure'' offset 0,-1 '

% small bottom margin, and a large top margin
gset 'tmargin 4.0'
gset 'bmargin 0.2'

%set yaxis label
gset 'ylabel ''$\sin(\theta)$'' offset 1,0'

%plot the data
gpplot([x' y1'],'sin', 'ls 1  title '''' ')

%new plot in the multiplot
gpnewplot

% set axis labels
gset 'xlabel ''$\theta$'' offset 0,0.5'

% small top margin set a bottom margin
gset 'bmargin 4.0'
gset 'tmargin 0.2'

%remove title
gset 'title ''''  '

% remove the key part
gset 'key off'

%restore xtics labels
gset 'xtics  format "$%h$"'
%gset 'xtics  format "% g"'

%set yaxis label
gset 'ylabel ''$\cos(\theta)$'' offset 1,0'

%plot
gpplot([x' y2'],'cos', 'ls 1  title '''' ')


%stop multiplot mode
gcmd 'unset multiplot'

%ends the gnuplot figure
gend
