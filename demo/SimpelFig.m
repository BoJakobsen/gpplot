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

gstart('SimpelFig','SimpelFig.tex',gpexp) % for the make file to work name has to be the same as .m file
 
%load a default.inc file 
gcmd('load ''default.inc'' ') 

% set axis labels
gset 'xlabel ''$\theta$'' offset 0,0.5'
gset 'ylabel ''$f(\theta)$'' offset 1,0'

% set axis range
gset 'yrange [-1.05:1.05] '

% fix the key part
gset 'key left bottom'
gset 'key sample 2 #width of sample part'
gset 'key height 1'
gset 'key nobox'
gset 'key Left'

% set the titel
gset 'title ''A simpel figure'' offset 0,-1 '

% set a nice formate of the axis label
gset 'xtics  format "$%h$"'
gset 'ytics  format "$%h$"'

%make the plot (notice that the readable name is optional)
gpplot([x' y1'],'sin', 'ls 1  title ''$\sin(\theta)$'' ')
gpplot([x' y2'],[], 'ls 2  title ''$\cos(\theta)$'' ')
 
%ends the gnuplot figure
gend
