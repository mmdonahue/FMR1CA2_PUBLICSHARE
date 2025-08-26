function coords = read_in_coords_box(coordFileName)
% function coords = read_in_coords(coordFileName)
%
% PURPOSE:
%   To read in rat's coordinate data from a session.
%
% INPUT:
%   coordFileName = string containing the name of the .nvt file to be read in
%
% OUTPUT:
%    coords = n x 3 vector where col 1 equals frametimes, column 2 is x coords, and column 3 is y coords
%
%  IMPORTANT NOTE!!!!
%    Conversion factor for going from pixels to cm is based on the linear track length.
%    Edit: Now based on 1mX1m arena
%       AJM 06/2017
%
% JBT 09/2016
% Colgin Lab



% fprintf('\n\n\n\t\t\t\t\t\t\t ********* IMPORTANT NOTE********* \n\t\t\tConversion factor for going from pixels to cm is based on the linear track length.\n\n\n\n\n');
scale = 100; %cm -- known length of the track the rats are running on


%% THESE ARE PARAMETERS REQUIRED FOR USING THE FUNCTION THAT READS IN THE RATS' POSITION DATA

%position extraction variables
fieldSelection(1) = 1; % Timestamps
fieldSelection(2) = 1; % Extracted X
fieldSelection(3) = 1; % Extracted Y
fieldSelection(4) = 0; % Extracted Angel
fieldSelection(5) = 0;  % Targets
fieldSelection(6) = 0; % Points
extractHeader = 0;% Do we return header 1 = Yes, 0 = No.
extractMode = 1; % Extract all data -- 5 different extraction modes, see help file for Nlx2MatVT



%% READ IN THE COORDINATE DATA

[t2, x, y] = Nlx2MatVT(coordFileName,fieldSelection,extractHeader,extractMode); %read in position file

t = t2*10^-6; %convert time to seconds


ind = find(x == 0);
t(ind) = [];
x(ind) = [];
y(ind) = [];

for cc=8:length(x)-7
    x(cc) = nanmean(x(cc-7:cc+7));
    y(cc) = nanmean(y(cc-7:cc+7));
end
y = -y + max(y)-min(y) + 2*max(y); % reflects posisitons so they are consistent with orientation in recording room
[hx,xc] = hist(x,50); [hy,yc] = hist(y,50);
th = 50;
xmin = xc(find(hx>th,1,'first'));
xmax = xc(find(hx>th,1,'last'));
ymin = yc(find(hy>th,1,'first'));
ymax = yc(find(hy>th,1,'last'));

% Adjust input data
scalex = scale/(xmax-xmin);
scaley = scale/(ymax-ymin);
x = x * scalex;
y = y * scaley;
xmin = xmin * scalex;
ymin = ymin * scaley;
xmax = xmax * scalex;
ymax = ymax * scaley;
xcen = xmin+(xmax-xmin)/2;
ycen = ymin+(ymax-ymin)/2;
x = x - xcen;
y = y - ycen;
xmin = xmin-xcen;
xmax = xmax-xcen;
ymin = ymin-ycen;
ymax = ymax-ycen;


%% ASSIGN OUTPUT STRUCTURE
coords(:,1) = t;
coords(:,2) = x;
coords(:,3) = y;


