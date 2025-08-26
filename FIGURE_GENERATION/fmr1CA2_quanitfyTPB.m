function fmr1CA2_x_quanitfyTPB(Data)
% function fmr1CA2_x_quanitfyTPB(Data)
% 
% PURPOSE:
%   Quantify the time spent around the stimulus cage across conditions, sessions, and genotypes.
% 
% MMD
% 09/2024
% Colgin Lab

%% INITIALIZE

saveOrNot = 1;

spatBinSz = 4;
closeDist = 12; %cm - 10 in Chenguang's paper, but 3 bins around the cage for how the TPB code is

saveDir = 'E:\FMR1_BIGSQUARE\RESULTS\FMR1_PAPER\TPB';

useRegs = [3 4];
condns = [1 4 6]; %which conditions to make plots for

cageDim = [26.5 48]; %cage dimensions, in cm

exTime = cell(1,2); %initialize for all conditions x begin x rat
timeCI = cell(2,2);

cols = {'Silver', 'DarkCyan', 'Gold', 'Green', 'DarkOrange', 'Yellow', 'Navy'}; %from Emma
reCols = cols(condns);
gCols = {'Blue', 'Red'};
condnNames = {'empty', 'familiar', 'toy', 'odor', 'mirror', 'famodor' 'hexyl'};

CA2rats = {'rat117', 'rat122', 'rat165', 'rat256', 'rat391', 'rat418', 'rat120', 'rat125', 'rat330', 'rat395', 'rat445', 'rat442'};

cd(saveDir)
% load('E:\FMR1_BIGSQUARE\STRUCTS\from_Emma\FMR1_UPDATE_13.7_TPB.mat')

nboot = 1000;

stats = [];
statsFS = [];
statAlt = [];
statCondn = repmat(condns', 4, 1);
statBeg = repmat(1:4, length(condns), 1);
statBeg = statBeg(:);
ratCntr = 0;
statRat = [];

%% GET DATA

for g = 1:2
    for r = 1:length(Data(g).rat)
        %     figtitle = ['ExploreDur_' Data(g).rat(r).name];
        %     figure('Name', figtitle, 'Position', [346 590 1124 273])
        ratCntr = ratCntr + 1;
        tmpCondns = intersect(condns, 1:length(Data(g).rat(r).cond));
        ratData = cell(length(condns),4); %initialize for all conditions x begin
        ratDataFS = cell(length(condns),4); %initialize for all conditions x begin
        ratDataAlt = cell(length(condns),1);
        ratDataAltFS = cell(length(condns),1);
        dayCntr = 0;
        for c = tmpCondns
            for d = 1:length(Data(g).rat(r).cond(c).day)
                try
                    tmpIDs = vertcat(Data(g).rat(r).cond(c).day(d).region(useRegs).TT); %only days that have CA2 cells included
                catch; keyboard; end
                if isempty(tmpIDs)
                    continue
                end
                dayCntr = dayCntr + 1;
                dayTpb = zeros(1,4); %intialize for all 4 begins
                dayTpbFS = zeros(1,4); %intialize for all 4 begins
                for b = 1:4
                    %% first 2 minutes
                    tpb = Data(g).rat(r).cond(c).day(d).timePerBin_2min{b}; %shorten name

                    pullTime1 = sum(sum(tpb(round((100-cageDim(1))/spatBinSz)+1:end,...
                        (100/spatBinSz-ceil(cageDim(2)/spatBinSz))-closeDist/spatBinSz+1:...
                        100/spatBinSz-ceil(cageDim(2)/spatBinSz)))); %pull along short end of cage

                    pullTime2 = sum(sum(tpb(round((100-cageDim(1))/spatBinSz)-closeDist/spatBinSz+1:...
                        round((100-cageDim(1))/spatBinSz), ...
                        100/spatBinSz-ceil(cageDim(2)/spatBinSz)+1:end))); %pull along long end

                    pullTime3 = sum([tpb(round((100-cageDim(1))/spatBinSz),100/spatBinSz-ceil(cageDim(2)/spatBinSz))...
                        tpb(round((100-cageDim(1))/spatBinSz)-1,100/spatBinSz-ceil(cageDim(2)/spatBinSz))...
                        tpb(round((100-cageDim(1))/spatBinSz),100/spatBinSz-ceil(cageDim(2)/spatBinSz)-1)]); %pull from diagonal

                    dayTpb(b) = sum([pullTime1 pullTime2 pullTime3]);

                    ratData{match(c,condns),b} = [ratData{match(c,condns),b}; sum([pullTime1 pullTime2 pullTime3])];

                    tmpStat = [g ratCntr c dayCntr b sum([pullTime1 pullTime2 pullTime3])];
                    stats = [stats; tmpStat];


                end %begin
                ratDataAlt{match(c,condns)} = [ratDataAlt{match(c,condns)}; dayTpb];
                ratDataAltFS{match(c,condns)} = [ratDataAltFS{match(c,condns)}; dayTpbFS];


                tmpStat = [r d c dayTpb];
                statAlt = [statAlt; tmpStat];
            end %day

        end %condn

        tmpData = cellfun_emptyCells(@mean, ratData);
        if sum(sum(~isnan(tmpData))) == 0
            close all
            continue
        end

        % first 2 minutes
        exTime{g} = cat(3, exTime{g}, tmpData);
%         if sum(sum(isnan(tmpData))) > 0
%             keyboard
%         end
        try
            tmpStat = cat(2, repmat(g, length(statCondn), 1), repmat(ratCntr, length(statCondn), 1), statCondn, statBeg, tmpData(:));
        catch; keyboard; end
        statRat = [statRat; tmpStat];

        checkFunc = @(x)(size(x,1)==1);
        badRows = logical(cellfun(@isempty, ratDataAlt) + cellfun(checkFunc, ratDataAlt));
        ratDataAlt(badRows) = {[0 0 0 0]}; %jsut fill in w 0s so code will run
        tmpFunc1 = @(x)(mean(x,1));
        tmpFunc2 = @(x)bootci(nboot, {tmpFunc1, x}, 'type', 'per');
        tmpCI = cellfun(tmpFunc2, ratDataAlt, 'UniformOutput', false);
        tmpCI(badRows) = {[NaN NaN NaN NaN; NaN NaN NaN NaN]};

        pullLow = @(x)(x(1,:));

        tmpLow = cell2mat(cellfun(pullLow, tmpCI, 'UniformOutput', false));
        timeCI{1,g} = cat(3, timeCI{1,g}, tmpLow);

        pulHigh = @(x)(x(2,:));
        tmpHigh = cell2mat(cellfun(pulHigh, tmpCI, 'UniformOutput', false));
        timeCI{2,g} = cat(3, timeCI{2,g}, tmpHigh);

    end %rat
end %group

statRat = statRat(~isnan(statRat(:,4)),:);
keyboard

%% PLOT DATA BY RAT CI

figtitle = 'ExploreDur_2min_byRat_CI';
figure('Name', figtitle, 'Position', [133 412 1714 475])

xRats = linspace(0, 1, length(CA2rats)+3)*10; %give some buffer room between conditions
useTicks = mean(xRats(1:length(CA2rats))); %center of the ticks that will be used for the xtick label


for b = 1:4
    subplot(1,4,b)
    for c = 1:size(exTime{g},1)
        rCntr = 0;
        for g = 1:2
            for r = 1:size(exTime{g},3)
                rCntr = rCntr + 1;
                xData = c*10 + xRats(rCntr+1);
                yData = exTime{g}(c,b,r);

                lowErr = yData - timeCI{1,g}(c,b,r);
                highErr = timeCI{2,g}(c,b,r) - yData;
                hold on
                er = errorbar(xData, yData, lowErr, highErr, 'o', 'Color', rgb(gCols{g}));
                er.CapSize = 0;

            end %rat
        end %group
    end %condn

    axis square
    xlim([10 (length(condns)+1)*10])
    xticks(10+useTicks:10:length(condns)*10+5)
    title(['Begin ' num2str(b)])
    ylabel('Exploration time (s)')
    xticklabels(condnNames(condns))

end %begin

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
end



end %function