addpath('../gplot')
global gp % gives access to the internal gp plotting structure

% usefull for plot/noplot option in matlab programs
plotit=usejava('jvm')==1; % only plot when interactive

%Define a standard export command
%ensures that figures using this, has same size
%NB sets font size to 10, should correspond to latex document
gpexp='cairolatex pdf color dashed linewidth 2 size 8.5cm,6cm font ", 10"'


