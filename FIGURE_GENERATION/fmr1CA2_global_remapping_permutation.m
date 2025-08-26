function fmr1CA2_global_remapping_permutation

load('spatialCorrelation_MATLABdata.mat')

statWT = statAll(statAll(:,1)==1,:); %pull out WT data
statFXS = statAll(statAll(:,1)==2,:); %pull out WT data
nShuff = 1000; %more than we need but fine
statDs = cell(nShuff,1);


% for ff = 1:nShuff
%     c = 1; %empty
%     statEmpty = statWT(statWT(:,3)==c,:);
%     s = RandStream('mt19937ar', 'Seed', ff);
%
%     dsRat = sort(randsample(s, 6, 5, false)); %which rats to use - we have 6, are down-sampling to 5
%     % [~, pullInds] = intersect(statWT(:,2), dsRat);
%
%     pullInds = find(ismember(statEmpty(:,2), dsRat));
%     pullCells = unique(statEmpty(pullInds,4));
%     if length(pullCells) > 72
%     dsCell = sort(randsample(s, length(pullCells), 72, false)); %which cells to use - we have length(pullCells), are down-sampling to 72 for empty
%     else
%         dsCell = 1:length(pullCells);
%     end %whether we need to further down-sample
%     useCell = pullCells(dsCell);
%
%     statDs{ff} = statEmpty(find(ismember(statEmpty(:,4), useCell)),:); %store the empty down-sampled population
%
%     c = 6; %famodor/ visual + odor condition
%     statFam = statWT(statWT(:,3)==c,:);
%     %don't have to down-sample rats - we only have 4 in each group already
%     pullCells = unique(statFam(:,4));
%     dsCell = sort(randsample(s, length(pullCells), 40, false)); %which cells to use - we have length(pullCells), are down-sampling to 72 for empty
%     useCell = pullCells(dsCell);
%
%     statDs{ff} = cat(1, statDs{ff}, statFam(find(ismember(statFam(:,4), useCell)),:)); %store the empty down-sampled population
%
% end %shuffles
%
% save('E:\FMR1_BIGSQUARE\STATS\CA2_FXS\spatialCorrelation_downsample_MATLABdata.mat', 'statDs')

statDs = cell(nShuff,1);

% for ff = 1:nShuff
%     s = RandStream('mt19937ar', 'Seed', ff);
% 
%     %empty
%     c = 1;
%     statEmpty = statWT(statWT(:,3)==c,:);
% 
% %     dsRat = sort(randsample(s, 6, 5, false)); %which rats to use - we have 6, are down-sampling to 5
% 
%     pullInds = find(ismember(statEmpty(:,2), dsRat));
%     pullCells = unique(statEmpty(pullInds,4));
%     if length(pullCells) > 72
%         dsCell = sort(randsample(s, length(pullCells), 72, false)); %which cells to use - we have length(pullCells), are down-sampling to 72 for empty
%     else
%         dsCell = 1:length(pullCells);
%     end %whether we need to further down-sample
%     useCell = pullCells(dsCell);
% 
%     statDs{ff} = statEmpty(find(ismember(statEmpty(:,4), useCell)),:); %store the empty down-sampled population
% 
%     %odor
%     c = 4;
%     statOdor = statWT(statWT(:,3)==c,:);
%     %don't have to down-sample rats - we only have 5 in each group already
%     pullCells = unique(statOdor(:,4));
%     dsCell = sort(randsample(s, length(pullCells), 60, false)); %which cells to use - we have length(pullCells), are down-sampling to 72 for empty
%     useCell = pullCells(dsCell);
% 
%     statDs{ff} = cat(1, statDs{ff}, statOdor(find(ismember(statOdor(:,4), useCell)),:)); %store the famodor down-sampled population
% 
%     %famodor/ visual + odor condition
%     c = 6;
%     statFam = statWT(statWT(:,3)==c,:);
%     %don't have to down-sample rats - we only have 4 in each group already
%     pullCells = unique(statFam(:,4));
%     dsCell = sort(randsample(s, length(pullCells), 40, false)); %which cells to use - we have length(pullCells), are down-sampling to 72 for empty
%     useCell = pullCells(dsCell);
% 
%     statDs{ff} = cat(1, statDs{ff}, statFam(find(ismember(statFam(:,4), useCell)),:)); %store the famodor down-sampled population
% 
%     statDs{ff} = cat(1, statDs{ff}, statFXS); %add the FXS data
% end %shuffles

for ff = 850:nShuff
    s = RandStream('mt19937ar', 'Seed', ff);

    %empty
    c = 1;
    statEmpty = statWT(statWT(:,3)==c,:);

%     dsRat = sort(randsample(s, 6, 5, false)); %which rats to use - we have 6, are down-sampling to 5

%     pullInds = find(ismember(statEmpty(:,2), dsRat));
    pullCells = unique(statEmpty(:,4));
    if length(pullCells) > 72
        dsCell = sort(randsample(s, length(pullCells), 72, false)); %which cells to use - we have length(pullCells), are down-sampling to 72 for empty
    else
        dsCell = 1:length(pullCells);
    end %whether we need to further down-sample
    useCell = pullCells(dsCell);

    statDs{ff} = statEmpty(find(ismember(statEmpty(:,4), useCell)),:); %store the empty down-sampled population

    %odor
    c = 4;
    statOdor = statWT(statWT(:,3)==c,:);
    %don't have to down-sample rats - we only have 5 in each group already
    pullCells = unique(statOdor(:,4));
    dsCell = sort(randsample(s, length(pullCells), 60, false)); %which cells to use - we have length(pullCells), are down-sampling to 72 for empty
    useCell = pullCells(dsCell);

    statDs{ff} = cat(1, statDs{ff}, statOdor(find(ismember(statOdor(:,4), useCell)),:)); %store the famodor down-sampled population

    %famodor/ visual + odor condition
    c = 6;
    statFam = statWT(statWT(:,3)==c,:);
    %don't have to down-sample rats - we only have 4 in each group already
    pullCells = unique(statFam(:,4));
    dsCell = sort(randsample(s, length(pullCells), 40, false)); %which cells to use - we have length(pullCells), are down-sampling to 72 for empty
    useCell = pullCells(dsCell);

    statDs{ff} = cat(1, statDs{ff}, statFam(find(ismember(statFam(:,4), useCell)),:)); %store the famodor down-sampled population

    statDs{ff} = cat(1, statDs{ff}, statFXS); %add the FXS data
end %shuffles

save('E:\FMR1_BIGSQUARE\STATS\CA2_FXS\spatialCorrelation_downsample_MATLABdata_v3.mat', 'statDs')


% try permutation test
% [p, observeddifference, effectsize] = permutationTest(statWT(statWT(:,3)==6,6), statWT(statWT(:,3)==1,6), 1000, 'showprogress', 1, 'plotresult', 1);
% [p, observeddifference, effectsize] = permutationTest(statFXS(statFXS(:,3)==6,6), statFXS(statFXS(:,3)==1,6), 1000, 'showprogress', 1, 'plotresult', 1);

% other

load('E:\FMR1_BIGSQUARE\STATS\CA2_FXS\spatialCorrelation_downsample_MATLABdata_v3.mat', 'statDs')
wtStatDs = cell(nShuff,1);
for ff = 1:nShuff
wtStatDs{ff} = statDs{ff}(statDs{ff}(:,1)==1,:);

end %shuffles

save('E:\FMR1_BIGSQUARE\STATS\CA2_FXS\spatialCorrelation_downsample_WT_MATLABdata_v3.mat', 'statDs')

tmpPow = length(find(tmpP(:,1)<0.05 & tmpP(:,2)<0.05)) ./ length(tmpP);
fprintf('Odor condition power = %s\n', num2str(tmpPow))

tmpPow = length(find(tmpP(:,1)<0.05 & tmpP(:,3)<0.05)) ./ length(tmpP);
fprintf('Visual + Odor condition power = %s\n', num2str(tmpPow))




end %function