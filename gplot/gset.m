function gset(set_command)
% function gset(set_command)
% add set set_command

global gp


fprintf(gp.fid,'set %s \n',set_command);

