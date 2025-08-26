function fmr1CA2_placeCellProperties(Data)
% function CA2remap_placeCellProperties(Data)
% 
% PURPOSE:
%   Plot CA2 place cell properties across conditions, sessions, and genotypes.
% 
% MMD
% 09/2024
% Colgin Lab

%% OPTIONS

saveOrNot = 0;

useRegs = [3 4];
condns = [1 4 6]; %which conditions to make plots for

%% INITIALIZE


spatInfo = cell(length(condns),4,2);
spatInfo(:) = {cell(12,1)}; %for every rat, will delete the empty ones later

spatSpar = cell(length(condns),4,2);
spatSpar(:) = {cell(12,1)}; %for every rat, will delete the empty ones later

pkFr = cell(length(condns),4,2);
pkFr(:) = {cell(12,1)}; %for every rat, will delete the empty ones later

meanFr = cell(length(condns),4,2);
meanFr(:) = {cell(12,1)}; %for every rat, will delete the empty ones later

pfSize = cell(length(condns),4,2);
pfSize(:) = {cell(12,1)}; %for every rat, will delete the empty ones later

numFields = cell(length(condns),4,2);
numFields(:) = {cell(12,1)}; %for every rat, will delete the empty ones later

oofFr = cell(length(condns),4,2); %out of field firing rate for Laura
oofFr(:) = {cell(12,1)}; %for every rat, will delete the empty ones later

frRatio = cell(length(condns),4,2); %in-field / out-of-field firing rate ratio for Laura
frRatio(:) = {cell(12,1)}; %for every rat, will delete the empty ones later

propPf = cell(length(condns),1);

spatBinSz = 4;
xBnds = [-50 50];
yBnds = [-50 50];
plotOrNot = 0;
velFilt = 1;
durCrit = 0;

minPkFr = 1;
minPfArea = 10;
percThresh = 50;

cols = {'Silver', 'DarkCyan', 'Gold', 'Green', 'DarkOrange', 'Yellow', 'Navy'}; %from Emma
reCols = cols(condns);
% rgbCols = cellfun(@rgb, reCols, 'UniformOutput', false)';
gCols = {'Blue', 'Red'};
condnNames = {'empty', 'familiar', 'toy', 'odor', 'mirror', 'famodor' 'hexyl'};

ratMrkrs = {'o', 'diamond', 'square', 'x', '^', 'o'};
CA2rats = {'rat117', 'rat122', 'rat165', 'rat256', 'rat391', 'rat418', 'rat120', 'rat125', 'rat330', 'rat395', 'rat445', 'rat442'};

saveDir = 'E:\FMR1_BIGSQUARE\RESULTS\FMR1_PAPER\FMR1_PLACECELLS';

nboot = 1000;

uIndGuide = 0;
ratCntr = 0;
statCell = []; %initialize
statField = [];
statAll = [];

%% GET DATA

for g = 1:2
    fprintf('%s\n', Data(g).name)

    for r = 1:length(Data(g).rat)
        fprintf('%s\n', Data(g).rat(r).name)
        ratCntr = ratCntr + 1;

        tmpCondns = intersect(condns, 1:length(Data(g).rat(r).cond));
        for c = tmpCondns
            fprintf('\t%s\n', Data(g).rat(r).cond(c).name)
            tmpStack = cell(2,1); %initialize for this condn and this rat, by begin
            tmpProp = zeros(4,2);
            fprintf('\t\tGetting place cells...Day ')
            for d = 1:length(Data(g).rat(r).cond(c).day)
                fprintf(' %d ', d)
                tmpMaps = horzcat(Data(g).rat(r).cond(c).day(d).region(useRegs).ratemap);

                if isempty(tmpMaps)
                    continue %to next day
                end %no cells

                uInds = (1:size(tmpMaps,2)) + uIndGuide;

                tmpProp(:,2) = tmpProp(1,2) + size(tmpMaps,2);
                for b = 1:4
                    [~, ~, tpb] = get_2d_ratemap([], Data(g).rat(r).cond(c).day(d).coords{1, b},...
                        xBnds, yBnds, spatBinSz, plotOrNot, velFilt, durCrit);
                    numwFields = 0;
                    for u = 1:size(tmpMaps,2)

                        tmpSI = get_spatial_info(tmpMaps{b,u},  tpb);
                        
                        spatInfo{match(c,condns),b,g}{r} = [spatInfo{match(c,condns),b,g}{r}; tmpSI];

                        tmpSS = get_spatial_sparsity(tmpMaps{b,u},  tpb);
                        spatSpar{match(c,condns),b,g}{r} = [spatSpar{match(c,condns),b,g}{r}; tmpSS];

                        %                     tmpStat = [r c d b uInds(u) tmpSI tmpSS];
                        %                     statCell = [statCell; tmpStat];

                        pf = get_2d_pfs_v2(tmpMaps{b,u}, spatBinSz, percThresh, minPkFr, minPfArea);

                        tmpPk = max(max(tmpMaps{b,u}));
                        pkFr{match(c,condns),b,g}{r} = [pkFr{match(c,condns),b,g}{r}; tmpPk];

                        numFields{match(c,condns),b,g}{r} = [numFields{match(c,condns),b,g}{r}; length(pf)];

                        if ~isempty(pf)
                            numwFields = numwFields + 1;

                            tmpInds =  vertcat(pf(:).inds); %inds from all place fields
                            tmpMean = mean(tmpMaps{b,u}(tmpInds));
                            oofInds = setxor(1:625, tmpInds);
                            tmpOofMean = nanmean(tmpMaps{b,u}(oofInds));
                            tmpRatio = tmpMean ./ tmpOofMean;

                            tmpSize = mean(vertcat(pf(:).area));
                        else
                            tmpMean = NaN;
                            tmpSize = NaN;
                             tmpOofMean = NaN;
                            tmpRatio = NaN;
                        end

                        if isnan(tmpOofMean) && ~isnan(tmpMean)
                             tmpOofMean = tmpMean;
                            tmpRatio = 1;
                        end

                        pkFr{match(c,condns),b,g}{r} = [pkFr{match(c,condns),b,g}{r}; tmpPk];
                        meanFr{match(c,condns),b,g}{r} = [meanFr{match(c,condns),b,g}{r}; tmpMean];
                        pfSize{match(c,condns),b,g}{r} = [pfSize{match(c,condns),b,g}{r}; tmpSize];
                        oofFr{match(c,condns),b,g}{r} = [oofFr{match(c,condns),b,g}{r}; tmpOofMean];
                        frRatio{match(c,condns),b,g}{r} = [frRatio{match(c,condns),b,g}{r}; tmpRatio];

                        tmpStat = [g ratCntr c d b uInds(u) tmpSI tmpSS tmpPk tmpMean tmpSize length(pf) tmpOofMean tmpRatio];
                        statAll = [statAll; tmpStat];
   
                    end %unit

                    tmpProp(b,1) = tmpProp(b,1) + numwFields;
                end %begin

                uIndGuide = uInds(end);
            end %day
            fprintf('\n')

            if isempty(find(tmpProp>0))
                continue
            end
            tmpProp = tmpProp(:,1) ./ tmpProp(:,2);
            try
                propPf{match(c,condns)} = cat(2, propPf{match(c,condns)}, tmpProp);
            catch; keyboard; end
        end %condn

    end %rat
end %group

cd(saveDir)
keyboard
statCell = statAll(:,[1:8 12]);
statField = statAll(~isnan(statAll(:,10)),[1:6 9:11 13:14]);
clear statAll



%% FIGURE - SPATIAL INFORMATION_QUANT

figtitle = 'spatialInformation';
yLab = 'Spatial information (bits/spike)';
make_fig(figtitle, spatInfo, yLab)


%% FIGURE - SPATIAL SPARSITY

figtitle = 'spatialSparsity';
yLab = 'Spatial sparsity';
make_fig(figtitle, spatSpar, yLab)


%% FIGURE - PEAK FIRING RATE

figtitle = 'peakFiringRate';
yLab = 'Peak firing rate (Hz)';
make_fig(figtitle, pkFr, yLab)

%% FIGURE - MEAN FIRING RATE

figtitle = 'meanFiringRate';
yLab = 'Mean in-field firing rate (Hz)';
make_fig(figtitle, meanFr, yLab)


%% FIGURE - PLACE FIELD SIZE

figtitle = 'pfSize';
yLab = 'Place field size (cm^s)';
make_fig(figtitle, pfSize, yLab)


%% FIGURE - FIELDS PER QUANT

figtitle = 'placeFieldsPerCell';
yLab = 'Place fields per cell';
make_fig(figtitle, numFields, yLab)

%% FIGURE - OOF FIRING RATE

figtitle = 'outOfFieldFr';
yLab = 'Out-of-field firing rate (Hz)';
make_fig(figtitle, oofFr, yLab)

%% FIGURE - FIRING RATE RATIO

figtitle = 'frRatio';
yLab = 'In-field / out-of-field firing rate';
make_fig(figtitle, frRatio, yLab)

%% HELPER FUNCTION - MAKE PLOT

    function make_fig(figtitle, data, yLab)
        figure('Name', figtitle, 'Position',  [87 399 1486 342])

        tmpFunc = @(x)(~isempty(x));
        xRats = linspace(0, 1, length(cellfun(tmpFunc, CA2rats(:)))+3)*10; %give some buffer room between conditions
        useTicks = mean(xRats(1:length(cellfun(tmpFunc, CA2rats(:))))); %center of the ticks that will be used for the xtick label

        for b = 1:4
            subplot(1,4,b)
            for c = 1:length(condns)
                for g = 1:2
                    for rInd = 1:length(Data(g).rat)
                        if isempty(data{c,b,g}{rInd})
                            continue
                        end %rat
                        r = strmatch(Data(g).rat(rInd).name, CA2rats);
                        %             cInd = match(c, condns);
                        xData = c*10 + xRats(r+1);

                        yData = nanmean(data{c,b,g}{rInd});
                        
                        if length(data{c,b,g}{rInd}) > 1
                            try
                            CI = bootci(nboot, {@nanmean, data{c,b,g}{rInd}}, 'type', 'per');
                            catch; keyboard; end
                        else
                            CI = [NaN; NaN];
                        end

                        lowErr = yData - min(CI);
                        highErr = max(CI) - yData;

                        hold on
                        er = errorbar(xData, yData, lowErr, highErr, 'o', 'Color', rgb(gCols{g}));
                        er.CapSize = 0;
                    end %rat
                end %genotype
            end %condns

            title(['Session ' num2str(b)])
            axis square
            xlim([10 (length(condns)+1)*10])
            xticks(10+useTicks:10:length(condns)*10+5)
            xticklabels(condnNames(condns))
            ylabel(yLab)
        end %begin

        ax = gca;
        ylim([0 ax.YLim(2)])
        same_axes;
        ax = gca;

        % add color patches to plot
        for b = 1:4
            subplot(1,4,b)
            for c = 1:length(condns)
                xP = [c*10 c*10 c*10+10 c*10+10];
                yP = [0 ax.YLim(2) ax.YLim(2) 0];
                tmpPatch = patch(xP, yP, rgb(reCols{c}), 'FaceAlpha', 0.1);

            end %condn
        end %begin


        if saveOrNot == 1
            saveas(gcf, figtitle, 'png')
            saveas(gcf, figtitle, 'fig')
            set(gcf,'renderer','Painters')
             saveas(gcf, figtitle, 'epsc')
        end %save option

    end %function

end %function

