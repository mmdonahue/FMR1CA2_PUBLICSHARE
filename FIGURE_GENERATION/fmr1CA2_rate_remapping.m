function fmr1CA2_rate_remapping(Data)
% function CA2remap_rate_remapping(Data)
% 
% PURPOSE:
%   Plot rate overlap values across conditions, genotypes, and session pairs.
% 
% MMD
% 09/2024
% Colgin Lab

%% OPTIONS

saveOrNot = 1;

useRegs = [3 4];
condns = [1 4 6]; %which conditions to make plots for

%% INITIALIZE

combos = [1 2; 1 3; 3 4; 1 4; 2 3];
combosTxt = {'1-2', '1-3', '3-4', '1-4', '2-3'};

avgRateRemap = cell(length(condns), length(combos), 2);
avgRateRemap(:) = {cell(11,1)}; %for every rat, will delete the empty ones later

pkRateRemap = cell(length(condns), length(combos), 2);
pkRateRemap(:) = {cell(11,1)}; %for every rat, will delete the empty ones later

spatBinSz = 4;
minPkFr = 1;
minPfArea = 10;
percThresh = 50;

cols = {'Silver', 'DarkCyan', 'Gold', 'Green', 'DarkOrange', 'Yellow', 'Navy'}; %from Emma
reCols = cols(condns);
% rgbCols = cellfun(@rgb, reCols, 'UniformOutput', false)';
gCols = {'Blue', 'Red'};
condnNames = {'empty', 'familiar', 'toy', 'odor', 'mirror', 'famodor' 'hexyl'};

fCols = zeros(6,3,2);
eCols = zeros(6,3,2);

g = 1;
fCols(:,:,g) = cat(1, [1 1 1], rgb(gCols{g}), [1 1 1], [1 1 1], [1 1 1], rgb(gCols{g}));
eCols(:,:,g) = cat(1, rgb(gCols{g}), [1 1 1], rgb(gCols{g}), rgb(gCols{g}), rgb(gCols{g}), [1 1 1]);

g = 2;
fCols(:,:,g) = cat(1, [1 1 1], rgb(gCols{g}), [1 1 1], [1 1 1], rgb(gCols{g}), rgb(gCols{g}));
eCols(:,:,g) = cat(1, rgb(gCols{g}), [1 1 1], rgb(gCols{g}), rgb(gCols{g}), [1 1 1], [1 1 1]);

ratMrkrs = {'o', 'diamond', 'square', 'x', '^', 'o'};
CA2rats = {'rat117', 'rat122', 'rat165', 'rat256', 'rat391', 'rat418', 'rat120', 'rat125', 'rat330', 'rat395', 'rat445', 'rat442'};

saveDir = 'E:\FMR1_BIGSQUARE\RESULTS\FMR1_PAPER\RATE_REMAP';

nboot = 1000;

ratCntr = 0;
statAll = [];

%% GET DATA

for g = 1:2
    for r = 1:length(Data(g).rat)
        fprintf('%s\n', Data(g).rat(r).name)

        ratCntr = ratCntr + 1;
        tmpCondns = intersect(condns, 1:length(Data(g).rat(r).cond));
        uCntr = 0; %for stats
        for c = tmpCondns
            fprintf('\t%s\n', Data(g).rat(r).cond(c).name)
            fprintf('\t\tGetting place cells...Day ')
            for d = 1:length(Data(g).rat(r).cond(c).day)
                fprintf(' %d ', d)

                tmpMaps = horzcat(Data(g).rat(r).cond(c).day(d).region(useRegs).ratemap);

                if isempty(tmpMaps)
                    continue %to next day
                end %no cells

                tmpFunc = @(x)(get_2d_pfs_v2(x, spatBinSz, percThresh, minPkFr, minPfArea));
                allPfs = cellfun(tmpFunc, tmpMaps, 'UniformOutput', false);

                for u = 1:size(tmpMaps,2)
                    uCntr = uCntr + 1;
                    for com = 1:size(combos,1)
                        if ~isempty(allPfs{combos(com,1),u})
                            inds1 = vertcat(allPfs{combos(com,1),u}(:).inds);
                        else
                            inds = [];
                        end
                        av1 = mean(tmpMaps{combos(com,1),u}(inds1));

                        if ~isempty(allPfs{combos(com,2),u})
                            inds2 = vertcat(allPfs{combos(com,2),u}(:).inds);
                        else
                            inds2 = [];
                        end
                        av2 = mean(tmpMaps{combos(com,2),u}(inds2));

                        tmpAOL = min([av1 av2]) ./ max([av1 av2]); %tmp overlap
                        avgRateRemap{match(c,condns),com,g}{r} = [avgRateRemap{match(c,condns),com,g}{r}; tmpAOL];

                        pk1 =max(max(tmpMaps{combos(com,1),u}));
                        pk2 = max(max(tmpMaps{combos(com,2),u}));

                        tmpPOL = min([pk1 pk2]) ./ max([pk1 pk2]); %tmp overlap
                        pkRateRemap{match(c,condns),com,g}{r} = [pkRateRemap{match(c,condns),com,g}{r}; tmpPOL];

                        tmpStat = [g ratCntr c uCntr com tmpAOL tmpPOL];
                        statAll = [statAll; tmpStat];
                    end %combos
                end %unit
            end %day
            fprintf('\n')
        end %condn
    end %rat
end %group

statPk = statAll(:,[1:6 7]);
statAvg = statAll(~isnan(statAll(:,6)),1:6);
clear statAll
cd(saveDir)
keyboard

%% FIGS - AVG IN-FIELD

lh = zeros(length(CA2rats),1);

for com = 1:size(combos,1)
    figtitle = ['rateRemap_avgFieldFr_' combosTxt{com}];
    figure('Name', figtitle, 'Position',  [796 429 505 342])

    tmpJit = 0.4;
  
    mPMap = reshape(0.5:1:length(condns)*2-0.5, 2, length(condns))';

      lh = NaN(1, length(CA2rats));
c=1;
hold on
    % get the marker for each rat for legend off the axis
    for g = 1:2
        for r = 1:length(avgRateRemap{c,com,g})
            if isempty(strmatch(Data(g).rat(r).name, CA2rats))
                continue
            end %rat
            rInd = strmatch(Data(g).rat(r).name, CA2rats) - (g-1)*6;
            lh(strmatch(Data(g).rat(r).name, CA2rats)) = plot(-1, 1, 'Color', rgb(gCols{g}), 'Marker', ratMrkrs{rInd}, 'LineStyle', 'None',...
                'MarkerFaceColor', fCols(rInd,:,g), 'MarkerEdgeColor', eCols(rInd,:,g));
        end %rat
    end %group

    for c = 1:length(condns)
        for g = 1:2

            hold on
            for r = 1:length(avgRateRemap{c,com,g})
                if isempty(strmatch(Data(g).rat(r).name, CA2rats))
                    continue
                end %rat

                rInd = strmatch(Data(g).rat(r).name, CA2rats) - (g-1)*6;
                %             cInd = match(c, condns);

                midP = mPMap(c,g);
                xData = rescale(randn(length(avgRateRemap{c,com,g}{r}),1), midP-tmpJit, midP+tmpJit);
                plot(xData, avgRateRemap{c,com,g}{r}, 'Color', rgb(gCols{g}), 'Marker', ratMrkrs{rInd}, 'LineStyle', 'None',...
                    'MarkerFaceColor', fCols(rInd,:,g), 'MarkerEdgeColor', eCols(rInd,:,g));
            end %rat
            %             line([c+0.5 c+0.5], [-1 1.5], 'Color', 'Black')
        end %group

        xP = [mPMap(c,1)-0.5 mPMap(c,1)-0.5 mPMap(c,2)+0.5 mPMap(c,2)+0.5];
        yP = [0 1 1 0];
        tmpPatch = patch(xP, yP, rgb(reCols{c}), 'FaceAlpha', 0.1);
    end %condns

    title(combosTxt{com})
    xticks(1:2:length(condns)*2)
    xticklabels(condnNames(condns))
    xlim([-0 length(condns)*2])
    ylabel('Rate overlap')
    ylim([0 1])
    legend(lh, CA2rats, 'Location', 'eastoutside') %just for sizing purposes

   if saveOrNot == 1
            saveas(gcf, figtitle, 'png')
            saveas(gcf, figtitle, 'fig')
            set(gcf,'renderer','Painters')
             saveas(gcf, figtitle, 'epsc')
        end %save option
end %combo


%% FIGS - PK FR

for com = 1:size(combos,1)
    figtitle = ['rateRemap_pkFieldFr_' combosTxt{com}];
    % figure('Name', figtitle, 'Position',  [   87   399   505   342])
    figure('Name', figtitle, 'Position',  [796 429 505 342])

    tmpJit = 0.4;
      lh = NaN(1, length(CA2rats));
c=1;
hold on
    % get the marker for each rat for legend off the axis
    for g = 1:2
        for r = 1:length(avgRateRemap{c,com,g})
            if isempty(strmatch(Data(g).rat(r).name, CA2rats))
                continue
            end %rat
            rInd = strmatch(Data(g).rat(r).name, CA2rats) - (g-1)*6;
            lh(strmatch(Data(g).rat(r).name, CA2rats)) = plot(-1, 1, 'Color', rgb(gCols{g}), 'Marker', ratMrkrs{rInd}, 'LineStyle', 'None',...
                'MarkerFaceColor', fCols(rInd,:,g), 'MarkerEdgeColor', eCols(rInd,:,g));
        end %rat
    end %group


    mPMap = reshape(0.5:1:length(condns)*2-0.5, 2, length(condns))';

    for c = 1:length(condns)
        for g = 1:2

            hold on
            for r = 1:length(pkRateRemap{c,com,g})
                if isempty(strmatch(Data(g).rat(r).name, CA2rats))
                    continue
                end %rat

                rInd = strmatch(Data(g).rat(r).name, CA2rats) - (g-1)*6;
                %             cInd = match(c, condns);

                midP = mPMap(c,g);
                xData = rescale(randn(length(pkRateRemap{c,com,g}{r}),1), midP-tmpJit, midP+tmpJit);
                plot(xData, pkRateRemap{c,com,g}{r}, 'Color', rgb(gCols{g}), 'Marker', ratMrkrs{rInd}, 'LineStyle', 'None',...
                    'MarkerFaceColor', fCols(rInd,:,g), 'MarkerEdgeColor', eCols(rInd,:,g));
            end %rat
            %             line([c+0.5 c+0.5], [-1 1.5], 'Color', 'Black')
        end %group

        xP = [mPMap(c,1)-0.5 mPMap(c,1)-0.5 mPMap(c,2)+0.5 mPMap(c,2)+0.5];
        yP = [0 1 1 0];
        tmpPatch = patch(xP, yP, rgb(reCols{c}), 'FaceAlpha', 0.1);
    end %condns

    title(combosTxt{com})
    xticks(1:2:length(condns)*2)
    xticklabels(condnNames(condns))
    xlim([-0 length(condns)*2])
    ylabel('Rate overlap')
    ylim([0 1])
    legend(lh, CA2rats, 'Location', 'eastoutside') %just for sizing purposes


     if saveOrNot == 1
            saveas(gcf, figtitle, 'png')
            saveas(gcf, figtitle, 'fig')
            set(gcf,'renderer','Painters')
             saveas(gcf, figtitle, 'epsc')
        end %save option
end %combo


end %function