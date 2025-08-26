function fmr1CA2_olfactoryTests(OlfTest)
% function fmr1CA2_olfactoryTests(OlfTest)
% 
% PURPOSE:
%   Plot results from the olfactory test data.
% 
% MMD
% 9/2024
% Colgin Lab

%% OPTIONS

saveOrNot = 1;

%% INIALIZE

gCols = {'Blue', 'Red'};
xLabs = {'N1', 'N2', 'N3', 'H1', 'H2', 'H3', 'H4', 'D'}; %null, habituation, dishabituation

nboot = 1000;

saveDir = 'E:\FMR1_BIGSQUARE\RESULTS\FMR1_PAPER\OLFACTORY_TESTS';
cd(saveDir)
keyboard
%% FIGURE - NEUTRAL ODOR

figtitle = 'NeutralOdor_norm_all';
figure('Name', figtitle)

meanData = zeros(8,2);
normData = cell(2,1);
for g = 1:2
    normFactor = mean(OlfTest(g).neutral(:,1));

    normData{g} = OlfTest(g).neutral ./ normFactor;
    meanData(:,g) = nanmean(normData{g});
end %group


bgraph = bar(meanData, 'FaceColor', 'flat');
    hold on
ngroups = size(meanData, 1);
    nbars = size(meanData, 2);

      % Calculating the width for each bar group
    groupwidth = min(0.8, nbars/(nbars + 1.5));

for g = 1:2
    bgraph(g).CData = repmat(rgb(gCols{g}), 8, 1);

    x = (1:ngroups) - groupwidth/2 + (2*g-1) * groupwidth / (2*nbars);
    for t = 1:8
        plot(repmat(x(t), length(normData{g}(:,t)), 1), normData{g}(:,t), 'o', 'MarkerFaceColor', rgb(gCols{g}), 'MarkerEdgeColor', rgb('White'))
    end %trials
end %group

ylabel('Time (normalized)')
xticklabels(xLabs)

if saveOrNot == 1
    saveas(gcf, figtitle, 'png')
    saveas(gcf, figtitle, 'fig')
    set(gcf,'renderer','Painters')
    saveas(gcf, figtitle, 'epsc')
end %save option

figtitle = 'NeutralOdor_norm_CI';
figure('Name', figtitle)

bgraph = bar(meanData, 'FaceColor', 'flat');
hold on
ngroups = size(meanData, 1);
nbars = size(meanData, 2);

% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));

for g = 1:2
    bgraph(g).CData = repmat(rgb(gCols{g}), 8, 1);

    x = (1:ngroups) - groupwidth/2 + (2*g-1) * groupwidth / (2*nbars);
   
      CI = bootci(nboot, {@nanmean, normData{g}}, 'type', 'per');

        lowErr = meanData(:,g)' - CI(1,:);
            highErr = CI(2,:) - meanData(:,g)';

               hold on
            er = errorbar( x , meanData(:,g)', lowErr, highErr, 'Color', rgb('Black'));
            er.CapSize = 0;
            er.LineStyle = 'None';
end %group

ylabel('Time (normalized)')
xticklabels(xLabs)

if saveOrNot == 1
    saveas(gcf, figtitle, 'png')
    saveas(gcf, figtitle, 'fig')
    set(gcf,'renderer','Painters')
    saveas(gcf, figtitle, 'epsc')
end %save option


%% FIGURE - SOCIAL ODOR

statSocial = [];
figtitle = 'SocialOdor_norm_all';
figure('Name', figtitle)

meanData = zeros(8,2);
normData = cell(2,1);
ratCntr = 0;
for g = 1:2
    normFactor = mean(OlfTest(g).social(:,1));

    normData{g} = OlfTest(g).social ./ normFactor;
    meanData(:,g) = nanmean(normData{g});

    statData = normData{g}';
    statData = statData(:);
    statTrial = repmat([1:8]', size(normData{g},1), 1);
    statRat = repmat([ratCntr+1:ratCntr+size(normData{g},1)]', 1, 8)';
    statRat = statRat(:);
    statGen = repmat(g, length(statData), 1);
    tmpStat = cat(2, statGen, statRat, statTrial, statData);
    statSocial = [statSocial; tmpStat];
   ratCntr =  ratCntr+size(normData{g},1);
end %group

statSocial2 = statSocial(~isnan(statSocial(:,4)),:);

bgraph = bar(meanData, 'FaceColor', 'flat');
    hold on
ngroups = size(meanData, 1);
    nbars = size(meanData, 2);

      % Calculating the width for each bar group
    groupwidth = min(0.8, nbars/(nbars + 1.5));

for g = 1:2
    bgraph(g).CData = repmat(rgb(gCols{g}), 8, 1);

    x = (1:ngroups) - groupwidth/2 + (2*g-1) * groupwidth / (2*nbars);
    for t = 1:8
        plot(repmat(x(t), length(normData{g}(:,t)), 1), normData{g}(:,t), 'o', 'MarkerFaceColor', rgb(gCols{g}), 'MarkerEdgeColor', rgb('White'))
    end %trials
end %group

ylabel('Time (normalized)')
xticklabels(xLabs)

if saveOrNot == 1
    saveas(gcf, figtitle, 'png')
    saveas(gcf, figtitle, 'fig')
    set(gcf,'renderer','Painters')
    saveas(gcf, figtitle, 'epsc')
end %save option

figtitle = 'SocialOdor_norm_CI';
figure('Name', figtitle)

bgraph = bar(meanData, 'FaceColor', 'flat');
hold on
ngroups = size(meanData, 1);
nbars = size(meanData, 2);

% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));

for g = 1:2
    bgraph(g).CData = repmat(rgb(gCols{g}), 8, 1);

    x = (1:ngroups) - groupwidth/2 + (2*g-1) * groupwidth / (2*nbars);

    CI = bootci(nboot, {@nanmean, normData{g}}, 'type', 'per');

    lowErr = meanData(:,g)' - CI(1,:);
    highErr = CI(2,:) - meanData(:,g)';

    hold on
    er = errorbar( x , meanData(:,g)', lowErr, highErr, 'Color', rgb('Black'));
    er.CapSize = 0;
    er.LineStyle = 'None';
end %group

ylabel('Time (normalized)')
xticklabels(xLabs)

if saveOrNot == 1
    saveas(gcf, figtitle, 'png')
    saveas(gcf, figtitle, 'fig')
    set(gcf,'renderer','Painters')
    saveas(gcf, figtitle, 'epsc')
end %save option



%% FIGURE - SOCIAL ODOR NEW NORMALIZES

statSocial = [];
figtitle = 'SocialOdor_normDiff_all';
figure('Name', figtitle)

meanData = zeros(8,2);
normData = cell(2,1);
ratCntr = 0;
for g = 1:2
    normFactor = OlfTest(g).social(:,1);

    normData{g} = (OlfTest(g).social - normFactor) ./ (OlfTest(g).social + normFactor);
    meanData(:,g) = nanmean(normData{g});

    statData = normData{g}';
    statData = statData(:);
    statTrial = repmat([1:8]', size(normData{g},1), 1);
    statRat = repmat([ratCntr+1:ratCntr+size(normData{g},1)]', 1, 8)';
    statRat = statRat(:);
    statGen = repmat(g, length(statData), 1);
    tmpStat = cat(2, statGen, statRat, statTrial, statData);
    statSocial = [statSocial; tmpStat];
   ratCntr =  ratCntr+size(normData{g},1);
end %group

statSocial2 = statSocial(~isnan(statSocial(:,4)),:);

bgraph = bar(meanData, 'FaceColor', 'flat');
    hold on
ngroups = size(meanData, 1);
    nbars = size(meanData, 2);

      % Calculating the width for each bar group
    groupwidth = min(0.8, nbars/(nbars + 1.5));

for g = 1:2
    bgraph(g).CData = repmat(rgb(gCols{g}), 8, 1);

    x = (1:ngroups) - groupwidth/2 + (2*g-1) * groupwidth / (2*nbars);
    for t = 1:8
        plot(repmat(x(t), length(normData{g}(:,t)), 1), normData{g}(:,t), 'o', 'MarkerFaceColor', rgb(gCols{g}), 'MarkerEdgeColor', rgb('White'))
    end %trials
end %group

ylabel('Time (normalized)')
xticklabels(xLabs)

if saveOrNot == 1
    saveas(gcf, figtitle, 'png')
    saveas(gcf, figtitle, 'fig')
    set(gcf,'renderer','Painters')
    saveas(gcf, figtitle, 'epsc')
end %save option

figtitle = 'SocialOdor_normDiff_CI';
figure('Name', figtitle)

bgraph = bar(meanData, 'FaceColor', 'flat');
hold on
ngroups = size(meanData, 1);
nbars = size(meanData, 2);

% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));

for g = 1:2
    bgraph(g).CData = repmat(rgb(gCols{g}), 8, 1);

    x = (1:ngroups) - groupwidth/2 + (2*g-1) * groupwidth / (2*nbars);

    CI = bootci(nboot, {@nanmean, normData{g}}, 'type', 'per');

    lowErr = meanData(:,g)' - CI(1,:);
    highErr = CI(2,:) - meanData(:,g)';

    hold on
    er = errorbar( x , meanData(:,g)', lowErr, highErr, 'Color', rgb('Black'));
    er.CapSize = 0;
    er.LineStyle = 'None';
end %group

ylabel('Time (normalized)')
xticklabels(xLabs)

if saveOrNot == 1
    saveas(gcf, figtitle, 'png')
    saveas(gcf, figtitle, 'fig')
    set(gcf,'renderer','Painters')
    saveas(gcf, figtitle, 'epsc')
end %save option





end %function