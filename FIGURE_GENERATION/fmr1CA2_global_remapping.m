function fmr1CA2_global_remapping(Remapping, Data)
% function CA2remap_global_remapping(Data)
% 
% PURPOSE:
%   Plot the spatial correlation values across conditions and genotypes.
% 
% MMD
% 09/2024
% Colgin Lab

%% OPTIONS

saveOrNot = 1;

condns = [1 4 6]; %which conditions to make plots for

%% INITIALIZE

combos = [1 2; 1 3; 3 4; 1 4; 2 3];
useCombs  = {'B1B2', 'B1B3', 'B3B4', 'B1B4', 'B2B3'};
combosTxt = {'1-2', '1-3', '3-4', '1-4', '2-3'};

useReg = 'CA2_CA2_3';

pfCorr = cell(length(condns), length(combos), 2);
pfCorr(:) = {cell(12,1)}; %for every rat, will delete the empty ones later

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

saveDir = 'E:\FMR1_BIGSQUARE\RESULTS\FMR1_PAPER\SPAT_CORR';

ratCntr = 0;
statAll = [];

%% GET DATA

gFields = fieldnames(Remapping.PFCorr);
 uCntr = 1; %for stats

for g = 1:2
    rFields = fieldnames(Remapping.PFCorr.(gFields{g}));

    for r = 1:length(rFields)
        ratCntr = ratCntr + 1;
       
        for c = 1:length(condns)

            for com = 1:length(useCombs)
                try
                tmpData = Remapping.PFCorr.(gFields{g}).(rFields{r}).(condnNames{condns(c)}).(useReg).(useCombs{com})'; %pull out data for this combo and condn from the remapping struct
                catch; keyboard; end
                pfCorr{c,com,g}{r} = [pfCorr{c,com,g}{r}; tmpData];

                try
                tmpStat = cat(2, repmat(g,length(tmpData),1), repmat(ratCntr,length(tmpData),1), repmat(condns(c),length(tmpData),1), [uCntr:uCntr+length(tmpData)-1]', repmat(com,length(tmpData),1), tmpData);
                catch; keyboard; end
                statAll = [statAll; tmpStat];


            end %combo
            uCntr = uCntr + length(tmpData);
        end %condn
    end %rat
end %group

cd(saveDir)
keyboard


%% FIGS - SPATIAL CORRELATION

for com = 1:size(combos,1)
    figtitle = ['spatCorr_' combosTxt{com}];
    % figure('Name', figtitle, 'Position',  [   87   399   505   342])
    figure('Name', figtitle, 'Position',  [796 429 505 342])

    %     line([0.5 0.5], [-1 1.5], 'Color', 'Black')
    tmpJit = 0.4;

    mPMap = reshape(0.5:1:length(condns)*2-0.5, 2, length(condns))';

    lh = NaN(1, length(CA2rats));
    c=1;
    hold on
    % get the marker for each rat for legend off the axis
    for g = 1:2
        for r = 1:length(pfCorr{c,com,g})
            if r > length(Data(g).rat) || isempty(strmatch(Data(g).rat(r).name, CA2rats))
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
            for r = 1:length(pfCorr{c,com,g})
                if r > length(Data(g).rat) || isempty(strmatch(Data(g).rat(r).name, CA2rats))
                    continue
                end %rat

                rInd = strmatch(Data(g).rat(r).name, CA2rats) - (g-1)*6;
                %             cInd = match(c, condns);

                midP = mPMap(c,g);
                xData = rescale(randn(length(pfCorr{c,com,g}{r}),1), midP-tmpJit, midP+tmpJit);
                plot(xData, pfCorr{c,com,g}{r}, 'Color', rgb(gCols{g}), 'Marker', ratMrkrs{rInd}, 'LineStyle', 'None',...
                    'MarkerFaceColor', fCols(rInd,:,g), 'MarkerEdgeColor', eCols(rInd,:,g));
            end %rat
            %             line([c+0.5 c+0.5], [-1 1.5], 'Color', 'Black')
        end %group

        xP = [mPMap(c,1)-0.5 mPMap(c,1)-0.5 mPMap(c,2)+0.5 mPMap(c,2)+0.5];
        yP = [-0.5 1 1 -0.5];
        tmpPatch = patch(xP, yP, rgb(reCols{c}), 'FaceAlpha', 0.1);
    end %condns

    title(combosTxt{com})
    xticks(1:2:length(condns)*2)
    xticklabels(condnNames(condns))
    xlim([-0 length(condns)*2])
    ylabel('Spatial correlation')
    ylim([-0.5 1])
    legend(lh, CA2rats, 'Location', 'eastoutside') %just for sizing purposes

    if saveOrNot == 1
        saveas(gcf, figtitle, 'png')
        saveas(gcf, figtitle, 'fig')
        set(gcf,'renderer','Painters')
        saveas(gcf, figtitle, 'epsc')
    end %save option
end %combo

end %function