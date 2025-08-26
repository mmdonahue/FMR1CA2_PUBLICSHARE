function fmr1CA2_estMeans_OXTR2
% function fmr1CA2_estMeans_OXTR2
% 
% PURPOSE:
%   Hard code and plot the estimated means from SPSS for OXTR-2 expression across
%   genotypes and subregions.


gCols = {'Blue', 'Red'};
gNames = {'WT', 'FXS'};
regNames = {'CA1', 'CA2', 'CA3'};

saveOrNot = 1;

%% OXTR2 EXPRESSION

exMean = [5.886 7.663 1.989; 2.525 6.506 -1.723;];
exLow = [5.295 7.071 1.397; 2.148 6.129 -2.009];
exHigh = [6.478 8.254 2.581; 2.901 6.884 -1.346];

figtitle = 'oxtr2_estimatedMeans_genotypexsubregion';
figure('Name', figtitle)

bgraph = bar(exMean', 'FaceColor', 'flat');
hold on
ngroups = size(exMean', 1);
    nbars = size(exMean', 2);

      % Calculating the width for each bar group
    groupwidth = min(0.8, nbars/(nbars + 1.5));
for g = 1:2
bgraph(g).CData = rgb(gCols{g});
  x = (1:ngroups) - groupwidth/2 + (2*g-1) * groupwidth / (2*nbars);
errorbar(x, exMean(g,:), exMean(g,:) - exLow(g,:), exHigh(g,:) - exMean(g,:),...
    'Color', 'k', 'LineStyle', 'None', 'CapSize', 0)
end %group

xticks(1:3)
xticklabels(regNames)
ylabel('Estimated mean corrected fluorescence')

if saveOrNot == 1
    saveas(gcf, figtitle, 'png')
    saveas(gcf, figtitle, 'fig')
    saveas(gcf, figtitle, 'epsc')
end %save option



end %function