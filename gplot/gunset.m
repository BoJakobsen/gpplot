function gunset(set_command)
 % function gunset(set_command)
 % adds unset set_command 
global gp


fprintf(gp.fid,'unset %s \n',set_command);

