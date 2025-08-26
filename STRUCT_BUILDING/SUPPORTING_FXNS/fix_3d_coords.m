function coords = fix_3d_coords(coords)

scale = 100; %cm -- known length of the arena the rats are running in


x = coords(:,2);
y = coords(:,3);


x = -x + max(x)-min(x) + 2*max(x); % reflects posisitons so they are consistent with orientation in recording room
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


%% ASSIGN OUTPUT STRUCTURE
coords(:,2) = x;
coords(:,3) = y;


end %function