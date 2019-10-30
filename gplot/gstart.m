function gstart(basename,outfile,term)
% function gstart(basename,outfile,term)
%
%function to initalize a new gnuplot plot
%
% basename :  the name of the .gp and .h5 files
% outfile  :  output file from gnuplot
% term     :  terminal definition
%
global gp

fid = fopen([basename '.gp'],'w');
gp.fid=fid;
gp.basename=basename;
gp.newplot=1;
gp.Ndat=0; % number of added data sets
gp.dat=[];

% adds code for setting the terminal
fprintf(gp.fid,'set term %s\n',term);
fprintf(gp.fid,'set output "%s"\n',outfile);
