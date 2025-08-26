function fmr1CA2_estMeans_remapping
% function fmr1CA2_estMeans_remapping
%
% PURPOSE:
%   Hard code and plot the estimated means from SPSS for spatial correlation and rate overlap across
%   conditions.

condns = [1 4 6];

cols = {'Silver', 'DarkCyan', 'Gold', 'Green', 'DarkOrange', 'Yellow', 'Navy'}; %from Emma
reCols = cols(condns);
% rgbCols = cellfun(@rgb, reCols, 'UniformOutput', false)';
gCols = {'Blue', 'Red'};
condnNames = {'empty', 'familiar', 'toy', 'odor', 'mirror', 'famodor' 'hexyl'};

saveOrNot = 1;

saveDir = 'E:\FMR1_BIGSQUARE\RESULTS\FMR1_PAPER\ESTIMATED MEANS';
cd(saveDir)

%% SPAT CORR

scMean = [.700 .600 .572; .701 .676 .683];
scLow = [.644 .542 .511; .636 .609 .612];
scHigh = [.757 .658 .633; .766 .742 .754];

figtitle = 'spatCorr_estimatedMeans_genotypexcondn';
figure('Name', figtitle)

for c = 1:3
    for g = 1:2
        hold on
        xData = (c-1) + g*0.33;
        yData = scMean(g, c);

        lowErr = yData - scLow(g,c);
        highErr = scHigh(g,c) - yData;

        er = errorbar(xData, yData, lowErr, highErr, 'o', 'Color', rgb(gCols{g}));
        er.CapSize = 0;
    end %group
    xP = [(c-1) (c-1) c c];
yP = [0 0.8 0.8 0];
    tmpPatch = patch(xP, yP, rgb(reCols{c}), 'FaceAlpha', 0.1);
end %condn

ylabel('Estimated spatial correlation')
xticks(0.5:1:length(condns))
xticklabels(condnNames(condns))
axis square

if saveOrNot == 1
    saveas(gcf, figtitle, 'png')
    saveas(gcf, figtitle, 'fig')
    set(gcf,'renderer','Painters')
    saveas(gcf, figtitle, 'epsc')
end %save option

%% RATE OVERLAP

roMean = [.741 .711 .715; .723 .720 .717];
roLow = [.713 .682 .681; .687 .682 .675];
roHigh = [.770 .741 .749; .759 .758 .760];


figtitle = 'rateOverlap_estimatedMeans_genotypexcondn';
% figure('Name', figtitle, 'Position', [680 558 404 420]);
figure('Name', figtitle)

for c = 1:3
    for g = 1:2
        hold on
        xData = (c-1) + g*0.33;
        yData = roMean(g, c);

        lowErr = yData - roLow(g,c);
        highErr = roHigh(g,c) - yData;

        er = errorbar(xData, yData, lowErr, highErr, 'o', 'Color', rgb(gCols{g}));
        er.CapSize = 0;
    end %group
    xP = [(c-1) (c-1) c c];
    yP = [0 0.8 0.8 0];
    tmpPatch = patch(xP, yP, rgb(reCols{c}), 'FaceAlpha', 0.1);
end %condn

ylabel('Estimated rate overlap')
xticks(0.5:1:length(condns))
xticklabels(condnNames(condns))
axis square

if saveOrNot == 1
    saveas(gcf, figtitle, 'png')
    saveas(gcf, figtitle, 'fig')
    set(gcf,'renderer','Painters')
    saveas(gcf, figtitle, 'epsc')
end %save option


end %functino