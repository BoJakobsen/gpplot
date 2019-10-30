function gpplot(dat,varname,varargin)
%function gpplot(dat,varname,opt)
%dat        : Array of data x,y,[z]
%varname    : Human readable name to use in script and hd5 file, may be
%             left empty for auto generated name)
%opt        : gnuplot options for the plot
%
% Can be called multiple times, and will add to the current plot

global gp

gp.Ndat=gp.Ndat+1;

if isempty(varargin)
    opt=[];
else
    opt=varargin{1}; 
end

if isempty(varname)
    varname=['var_' num2str(gp.Ndat)];
end

if isfield(gp.dat,varname)
    error(['gpplot error: varname ' varname ' is alreaddy in use'])
end

%store data for later export
gp=setfield(gp,'dat',varname,dat);

%add the plotting commands
filename=[gp.basename '.h5'];
if gp.newplot==1 %first plot in a new command
    fprintf(gp.fid,'plot ''< h5totxt  -s " " -T %s:%s'' %s \n',filename,varname,opt);
    gp.newplot=0;
else  
    fseek(gp.fid,-1,0); % step back one character (remore newline)
    fprintf(gp.fid,',\\\n ''< h5totxt  -s " " -T  %s:%s'' %s \n',filename,varname,opt);
end



