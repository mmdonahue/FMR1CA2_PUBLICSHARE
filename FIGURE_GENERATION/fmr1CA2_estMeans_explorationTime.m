function fmr1CA2_estMeans_explorationTime
% function fmr1CA2_estMeans_explorationTime
%
% PURPOSE:
%   Hard code and plot the estimated means from SPSS for exploration time for WT only and WT and FXS
%   data.
% 
% MMD
% 09/2024
% Colgin Lab

%% WT ONLY

figtitle = 'explorationTime_WT_estMeans_crop';
figure('Name', figtitle, 'Position', [460 321 997 645])

condns = [1 4 2 5];
cols = {'Silver', 'DarkCyan', 'Gold', 'Crimson', 'DarkOrange', 'DarkOrchid', 'Navy'}; %from Emma
condnNames = {'empty', 'familiar', 'toy', 'odor', 'mirror', 'famodor' 'hexyl'};
reCols = cols(condns);

%session A
subplot(1,2,1)

meanData = [17.076 16.65 NaN 13.414 17.437 12.550 11.849];
lowCI = [9.994 8.694 NaN 5.944 9.636 4.543 3.209];
highCI = [24.157 23.636 NaN 20.884 25.238 20.557 20.489];

for cInd = 1:length(condns)
c = condns(cInd);
    xData = match(c,condns);
    yData = meanData(c);
    lowErr = yData - lowCI(c);
    highErr = highCI(c) - yData;

    hold on
    er = errorbar(xData, yData, lowErr, highErr, 'o', 'Color', rgb(reCols{cInd}));
    er.CapSize = 0;

end %condn

axis square
xlim([0.5 4.5])
xticks(1:length(condns))
xticklabels(condnNames(condns))
title('Session A')
ylabel('Exploration time (s)')

%session B
subplot(1,2,2)

meanData = [13.391 36.130 NaN 33.093 37.561 29.645 22.958];
lowCI = [3.139 24.372 NaN 21.335 24.685 16.246 7.481];
highCI = [23.644 47.889 NaN 44.851 50.437 43.044 38.435];

for cInd = 1:length(condns)

   c = condns(cInd);
    xData = match(c,condns);
    yData = meanData(c);
    lowErr = yData - lowCI(c);
    highErr = highCI(c) - yData;

    hold on
    er = errorbar(xData, yData, lowErr, highErr, 'o', 'Color', rgb(reCols{cInd}));
    er.CapSize = 0;

end %condn

axis square
xlim([0.5 4.5])
xticks(1:length(condns))
xticklabels(condnNames(condns))
title('Session B')
ylabel('Exploration time (s)')
same_axes;

cd('C:\Users\mdonahue\Box\Donahue Dissertation\Defense\Part 1 figures')
saveas(gcf, figtitle, 'png')
saveas(gcf, figtitle, 'fig')
set(gcf,'renderer','Painters')
saveas(gcf, figtitle, 'epsc')

%% WT AND FXS

figtitle = 'explorationTime_WTxFXS_estMeans';
figure('Name', figtitle, 'Position', [460 321 997 645])

condns = [1 4 6];
cols = {'Silver', 'DarkCyan', 'Gold', 'Green', 'DarkOrange', 'Yellow', 'Navy'}; %from Emma
reCols = cols(condns);
% rgbCols = cellfun(@rgb, reCols, 'UniformOutput', false)';
gCols = {'Blue', 'Red'};
condnNames = {'empty', 'familiar', 'toy', 'odor', 'mirror', 'famodor' 'hexyl'};

%session A
subplot(1,2,1)

meanData = [16.806 13.085 12.195; 14.056 14.895 18.306];
lowCI = [10.887 6.657 5.047; 6.866 7.863 9.965];
highCI = [22.725 19.513 19.344; 21.245 21.928 26.647];

for c = 1:3
    for g = 1:2
        hold on
        xData = (c-1) + g*0.33;
        yData = meanData(g, c);

        lowErr = yData - lowCI(g,c);
        highErr = highCI(g,c) - yData;

        er = errorbar(xData, yData, lowErr, highErr, 'o', 'Color', rgb(gCols{g}));
        er.CapSize = 0;
    end %group
    xP = [(c-1) (c-1) c c];
yP = [0 50 50 0];
    tmpPatch = patch(xP, yP, rgb(reCols{c}), 'FaceAlpha', 0.1);
end %condn


ylabel('Exploration time (s)')
xticks(0.5:1:length(condns))
xticklabels(condnNames(condns))
axis square
title('Session A')

%session B
subplot(1,2,2)

meanData = [13.121 32.764 29.290; 8.966 31.692 31.004];
lowCI = [5.454 23.991 19.241;0 21.724 18.686];
highCI = [20.789 41.536 39.340; 19.045 41.659 43.402];

for c = 1:3
    for g = 1:2
        hold on
        xData = (c-1) + g*0.33;
        yData = meanData(g, c);

        lowErr = yData - lowCI(g,c);
        highErr = highCI(g,c) - yData;

        er = errorbar(xData, yData, lowErr, highErr, 'o', 'Color', rgb(gCols{g}));
        er.CapSize = 0;
    end %group
    xP = [(c-1) (c-1) c c];
yP = [0 50 50 0];
    tmpPatch = patch(xP, yP, rgb(reCols{c}), 'FaceAlpha', 0.1);
end %condn


ylabel('Exploration time (s)')
xticks(0.5:1:length(condns))
xticklabels(condnNames(condns))
axis square
title('Session B')

cd('C:\Users\mdonahue\Box\Donahue Dissertation\Defense\Part 2 figures')
saveas(gcf, figtitle, 'png')
saveas(gcf, figtitle, 'fig')
set(gcf,'renderer','Painters')
saveas(gcf, figtitle, 'epsc')




end %function