function gcmd(cmd)
% function gcmd(cmd)
%
% cmd [string] : is added to the gnuplot script
%
global gp

fprintf(gp.fid,'%s \n',cmd);
 
 