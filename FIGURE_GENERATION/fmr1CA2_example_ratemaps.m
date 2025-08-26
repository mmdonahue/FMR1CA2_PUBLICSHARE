function fmr1CA2_x_example_ratemaps(Data)
% function CA2remap_x_example_ratemaps(Data)
%
% PURPOSE:
%   Make example ratemaps plots by condition that are all stored in one place and as both .png and
%   .eps files to be used in the Donahue/Robson paper.
%
% MMD
% Colgin Lab
% 04/2024

saveDir = 'E:\FMR1_BIGSQUARE\RESULTS\FMR1_PAPER\EXAMPLE_RATEMAPS';

useRegs = [3 4];
condns = [1 4 6];
condnNames = {'empty', 'familiar', 'toy', 'odor', 'mirror', 'famodor' 'hexyl'};

spOpts = [1:4; 5:8; 9:12; 13:16; 17:20; 21:24]; %subplot options
colMap = [rgb('White'); jet(length(-0.01:0.01:1))]; %jet with white nan option

maxCell = 6; %per plot

%check for and if needed make dirs
for g = 1:2
    if ~isfolder([saveDir '\' Data(g).name])
        mkdir(saveDir, Data(g).name);
    end
    
    for c = condns
        if ~isfolder([saveDir '\' Data(g).name '\' condnNames{c}])
            mkdir([saveDir '\' Data(g).name], condnNames{c});
        end %make if need
    end %check for folders
end %group

for g = 1:2
        for r = 1:length(Data(g).rat)
        tmpCondns = intersect(condns, 1:length(Data(g).rat(r).cond));
        for c = tmpCondns
            mapStack = [];
            dayNames = {};
            ttNames = {};
            for d = 1:length(Data(g).rat(r).cond(c).day)

                tmpMaps = horzcat(Data(g).rat(r).cond(c).day(d).region(useRegs).ratemap)';
                if isempty(tmpMaps) || size(tmpMaps,1) == 1
                    continue
                end

                uIDs = cell2mat(cellfun(@get_unit_ID, vertcat(Data(g).rat(r).cond(c).day(d).region(useRegs).TT), 'UniformOutput', false));
                tetNums = unique(uIDs(:,1));

                for tt = 1:length(tetNums)
                    uTets = find(uIDs(:,1)==tetNums(tt));
                    numFigs = ceil(length(uTets)/maxCell);

                    uCntr = 0;
                    for f = 1:numFigs

                        if numFigs == 1
                            figtitle = [Data(g).name '_' Data(g).rat(r).name '_day' num2str(d) '_TT' num2str(tetNums(tt))];
                        else
                            figtitle = [Data(g).name '_' Data(g).rat(r).name '_day' num2str(d) '_TT' num2str(tetNums(tt)) '_' num2str(f) 'of' (num2str(numFigs))];
                        end %how many figs

                        figU = length(uTets)-uCntr; %units for this figure
                        if figU > maxCell
                            figU = maxCell - figU;
                        end

                        figure ('Position', [680 63 832 915], 'Name', figtitle);
                        [ha, pos] = tight_subplot(6, 4, [.01 .01], [.01 .01], [.1 .01]);

                        for figUCntr = 1:maxCell

                            uCntr = uCntr + 1;
                            if uCntr > length(uTets)
                                break
                            end %all units done


                            unitRms = tmpMaps(uTets(uCntr),:);
                            unitRms = reshape(cell2mat(unitRms), [25, 25, 4]);
                            maxFr = max(unitRms(:));

                            uName = ['TT' num2str(uIDs(uTets(uCntr),1)) '\_' num2str(uIDs(uTets(uCntr),2))];

                            for b = 1:4
                                %                     subplot(6,4, spOpts(figUCntr,b))
                                axes(ha(spOpts(figUCntr,b)));

                                plotMap = unitRms(:,:,b) ./ maxFr;
                                plotMap(isnan(plotMap)) = -0.01;

                                rmHndl = imagesc(plotMap);
                                axis square
                                axis xy %put cage on bottom
                                colormap(colMap)
                                caxis([-0.01 1])

                                if b == 1
                                    try
                                        ylabel({[uName]; ['Max = ' num2str(round(maxFr)) ' Hz']});
                                    catch; keyboard; end
                                end %if first begin window
                                set(gca, 'FontSize', 8)
                                xticks('')
                                yticks('')
                                %                     if figUCntr == 1
                                %                         title(['Begin ' num2str(b)]);
                                %                     end %if first unit

                            end %begin
                        end %fig unit cntr

                        saveas(gcf, [saveDir '\' Data(g).name '\' condnNames{c} '\' figtitle], 'png')  %save png of this fig in folder
                        saveas(gcf, [saveDir '\' Data(g).name '\' condnNames{c} '\' figtitle], 'epsc')  %save png of this fig in folder

                    end %figs
                end %tt
                close all
            end %day

        end %condns
    end %rat
end %group




end %function