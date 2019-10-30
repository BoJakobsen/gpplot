function gend
% function gend
% Closes the gnuplot "session"
%
% saves the .gp and .h5 file

global gp
dat=gp.dat;

% clears output buffer
fprintf(gp.fid,'set output \n');

fclose(gp.fid);
save([gp.basename '.h5'],'-struct','dat','-v7.3')


end

