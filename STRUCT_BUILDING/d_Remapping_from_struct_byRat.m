function Remapping = d_Remapping_from_struct_byRat(Data, dataDir)
% function Remapping = d_Remapping_from_struct_byRat(Data, dataDir)

%% CALL DRAWGRAPHS FUNCTION FOR REMAPPING

%% SET UP EMPTY STRUCT TO STORE RATEOVERLAP AND SPATIAL OVERLAP IN, AND WHERE TO SAVE IT
numType = [{'WT' 'KO'}];
cond = [{'empty' 'familiar' 'toy' 'odor' 'mirror' 'famodor' 'hexyl'}];
region = [{'CA1' 'CA1_2' 'CA2' 'CA2_3' 'CA3'}];

for t=1:length(numType)
    if t < 2
        rNums = {'rat117' 'rat122' 'rat165' 'rat196' 'rat256', 'rat326', 'rat334', 'rat335', 'rat391', 'rat392', 'rat418', 'rat416'};
    else
        rNums = {'rat120' 'rat124' 'rat125' 'rat168' 'rat316' 'rat328' 'rat330', 'rat328', 'rat330', 'rat394', 'rat395', 'rat445', 'rat442'};
    end
    
    for r = 1:length(rNums)
        for c=1:length(cond)
            for rr= 1:length(region)
                
                RateOverlap.(rNums{r}).(cond{c}).(region{rr}).B1B2=[];
                RateOverlap.(rNums{r}).(cond{c}).(region{rr}).B1B3=[];
                RateOverlap.(rNums{r}).(cond{c}).(region{rr}).B1B4=[];
                RateOverlap.(rNums{r}).(cond{c}).(region{rr}).B2B3=[];
                RateOverlap.(rNums{r}).(cond{c}).(region{rr}).B2B4=[];
                RateOverlap.(rNums{r}).(cond{c}).(region{rr}).B3B4=[];
                
                PVCrossCorr.(rNums{r}).(cond{c}).(region{rr}).B1B2=[];
                PVCrossCorr.(rNums{r}).(cond{c}).(region{rr}).B1B3=[];
                PVCrossCorr.(rNums{r}).(cond{c}).(region{rr}).B1B4=[];
                PVCrossCorr.(rNums{r}).(cond{c}).(region{rr}).B2B3=[];
                PVCrossCorr.(rNums{r}).(cond{c}).(region{rr}).B2B4=[];
                PVCrossCorr.(rNums{r}).(cond{c}).(region{rr}).B3B4=[];
                
                PFCorr.(rNums{r}).(cond{c}).(region{rr}).B1B2=[];
                PFCorr.(rNums{r}).(cond{c}).(region{rr}).B1B3=[];
                PFCorr.(rNums{r}).(cond{c}).(region{rr}).B1B4=[];
                PFCorr.(rNums{r}).(cond{c}).(region{rr}).B2B3=[];
                PFCorr.(rNums{r}).(cond{c}).(region{rr}).B2B4=[];
                PFCorr.(rNums{r}).(cond{c}).(region{rr}).B3B4=[];
            end
        end
    end
end
%clear variable that are going to get assigned again later
clear c r t rr cond
%% LOAD STRUCT
% 
% struct = 'FMR1_UPDATE_9_RM--__.mat'; %change depending on struct name
% 
% cd(['E:\PROJECTS\BIG_SQUARE\DATA_STRUCTS\UPDATE_9\']);
% load(struct);

%% FEED IN ALL CONSTANT VARIABLES

repetitions=100; % number of shuffle times
cutoff = 0; % cutoff by peak rate (use cells with peak rate >= ??Hz), edit based on the peak rate of cells, if >cutoff in at least one session then leave in
nonzero = 0; % cutoff by firing rate (use cells with firing rate >= 0.5 Hz)

%% Save file name/location

% savefile_remapping = (['E:\PROJECTS\BIG_SQUARE\DATA_STRUCTS\UPDATE_9\REMAPPING_UPDATE9_BYRAT_WT--__']);


%% Use Struct to direct to correct folder and pull Stacks

numType = [{'WT' 'KO'}];
for t = 1:length(numType)
    fprintf('%s\n', Data(t).name);
    if t < 2
        rNums = {'rat117' 'rat122' 'rat165' 'rat196' 'rat256', 'rat326', 'rat334', 'rat335', 'rat391', 'rat392', 'rat418', 'rat416'};
    else
        rNums = {'rat120' 'rat124' 'rat125' 'rat168' 'rat316' 'rat328' 'rat330', 'rat328', 'rat330', 'rat394', 'rat395', 'rat445', 'rat442'};
    end
    
    for r = 1:length(rNums)
        fprintf('\tRat %d\n', r);
%         DATAdir=(['E:\PROJECTS\BIG_SQUARE\RAW_DATA\' num2str(numType{t}),'\',num2str(rNums{r}),'\']);
        Rat=[num2str(Data(t).rat(r).name)];
        
        for c = 1:length(Data(t).rat(r).cond)
            fprintf('\t\tCond %d\n', c);
            for d = 1:length(Data(t).rat(r).cond(c).day)
                fprintf('\t\t\tDay %d\n', d);
                
                for rr=1:length(Data(t).rat(r).cond(c).day(d).region)
                    fprintf('\t\t\t\tReg %d\n', rr);
                    cd([dataDir '\' num2str(numType{t}),'\',num2str(rNums{r}),'\',num2str(Data(t).rat(r).cond(c).day(d).name)])
                    
                    if isempty((Data(t).rat(r).cond(c).day(d).region(rr).TT))==0
                        areaname=([num2str(Data(t).rat(r).cond(c).day(d).region(rr).name)]);
                        cond=([num2str(Data(t).rat(r).cond(c).name)]);
                        rat=rNums{r};
                        load(strcat([num2str(Data(t).rat(r).cond(c).day(d).name)],'_',areaname,'.mat'));
                        
                        
                        
                        %% Load in stack and RC
                        Stack = {Stack_B1,Stack_B2,Stack_B3, Stack_B4};
                        RC = getactivebins(Stack,nonzero);
                        
                        
                        
                        %% CALCULATE REMAPPING
                        RateOverlap_B1_B2 = RM_RateOverlap_cz(PeakRate_B1,PeakRate_B2,repetitions,cutoff,nonzero);
                        RateOverlap_B1_B3 = RM_RateOverlap_cz(PeakRate_B1,PeakRate_B3,repetitions,cutoff,nonzero);
                        RateOverlap_B1_B4 = RM_RateOverlap_cz(PeakRate_B1,PeakRate_B4,repetitions,cutoff,nonzero);
                        RateOverlap_B2_B3 = RM_RateOverlap_cz(PeakRate_B2,PeakRate_B3,repetitions,cutoff,nonzero);
                        RateOverlap_B2_B4 = RM_RateOverlap_cz(PeakRate_B2,PeakRate_B4,repetitions,cutoff,nonzero);
                        RateOverlap_B3_B4 = RM_RateOverlap_cz(PeakRate_B3,PeakRate_B4,repetitions,cutoff,nonzero);
                        
                        [PFCorr_B1B2,stack1_active_B1B2,stack2_active_B1B2] = RM_SpatialCorr_cz_v2_ER(Stack_B1,Stack_B2,repetitions,cutoff,nonzero,RC);
                        [PFCorr_B1B3,stack1_active_B1B3,stack2_active_B1B3] = RM_SpatialCorr_cz_v2_ER(Stack_B1,Stack_B3,repetitions,cutoff,nonzero,RC);
                        [PFCorr_B1B4,stack1_active_B1B4,stack2_active_B1B4] = RM_SpatialCorr_cz_v2_ER(Stack_B1,Stack_B4,repetitions,cutoff,nonzero,RC);
                        [PFCorr_B2B3,stack1_active_B2B3,stack2_active_B2B3] = RM_SpatialCorr_cz_v2_ER(Stack_B2,Stack_B3,repetitions,cutoff,nonzero,RC);
                        [PFCorr_B2B4,stack1_active_B2B4,stack2_active_B2B4] = RM_SpatialCorr_cz_v2_ER(Stack_B2,Stack_B4,repetitions,cutoff,nonzero,RC);
                        [PFCorr_B3B4,stack1_active_B3B4,stack2_active_B3B4] = RM_SpatialCorr_cz_v2_ER(Stack_B3,Stack_B4,repetitions,cutoff,nonzero,RC);
                        
                        PVCrossCorr_B1B2 = RM_PVCorr_cz(Stack_B1,Stack_B2,repetitions,cutoff,nonzero);
                        PVCrossCorr_B1B3 = RM_PVCorr_cz(Stack_B1,Stack_B3,repetitions,cutoff,nonzero);
                        PVCrossCorr_B1B4 = RM_PVCorr_cz(Stack_B1,Stack_B4,repetitions,cutoff,nonzero);
                        PVCrossCorr_B2B3 = RM_PVCorr_cz(Stack_B2,Stack_B3,repetitions,cutoff,nonzero);
                        PVCrossCorr_B2B4 = RM_PVCorr_cz(Stack_B2,Stack_B4,repetitions,cutoff,nonzero);
                        PVCrossCorr_B3B4 = RM_PVCorr_cz(Stack_B3,Stack_B4,repetitions,cutoff,nonzero);
                        
                        %% ENTER INTO NEW STRUCT
                        
                        
                        RateOverlap.(rat).(cond).(areaname).B1B2=[RateOverlap.(rat).(cond).(areaname).B1B2 RateOverlap_B1_B2.RateRatio'];
                        RateOverlap.(rat).(cond).(areaname).B1B3=[RateOverlap.(rat).(cond).(areaname).B1B3 RateOverlap_B1_B3.RateRatio'];
                        RateOverlap.(rat).(cond).(areaname).B1B4=[RateOverlap.(rat).(cond).(areaname).B1B4 RateOverlap_B1_B4.RateRatio'];
                        RateOverlap.(rat).(cond).(areaname).B2B3=[RateOverlap.(rat).(cond).(areaname).B2B3 RateOverlap_B2_B3.RateRatio'];
                        RateOverlap.(rat).(cond).(areaname).B2B4=[RateOverlap.(rat).(cond).(areaname).B2B4 RateOverlap_B2_B4.RateRatio'];
                        RateOverlap.(rat).(cond).(areaname).B3B4=[RateOverlap.(rat).(cond).(areaname).B3B4 RateOverlap_B3_B4.RateRatio'];
                        
                        PFCorr.(rat).(cond).(areaname).B1B2=[PFCorr.(rat).(cond).(areaname).B1B2 PFCorr_B1B2.PFCorrActive];
                        PFCorr.(rat).(cond).(areaname).B1B3=[PFCorr.(rat).(cond).(areaname).B1B3 PFCorr_B1B3.PFCorrActive];
                        PFCorr.(rat).(cond).(areaname).B1B4=[PFCorr.(rat).(cond).(areaname).B1B4 PFCorr_B1B4.PFCorrActive];
                        PFCorr.(rat).(cond).(areaname).B2B3=[PFCorr.(rat).(cond).(areaname).B2B3 PFCorr_B2B3.PFCorrActive];
                        PFCorr.(rat).(cond).(areaname).B2B4=[PFCorr.(rat).(cond).(areaname).B2B4 PFCorr_B2B4.PFCorrActive];
                        PFCorr.(rat).(cond).(areaname).B3B4=[PFCorr.(rat).(cond).(areaname).B3B4 PFCorr_B3B4.PFCorrActive];
                        
                        PVCrossCorr.(rat).(cond).(areaname).B1B2=[PVCrossCorr.(rat).(cond).(areaname).B1B2 PVCrossCorr_B1B2.mean];
                        PVCrossCorr.(rat).(cond).(areaname).B1B3=[PVCrossCorr.(rat).(cond).(areaname).B1B3 PVCrossCorr_B1B2.mean];
                        PVCrossCorr.(rat).(cond).(areaname).B1B4=[PVCrossCorr.(rat).(cond).(areaname).B1B4 PVCrossCorr_B1B4.mean];
                        PVCrossCorr.(rat).(cond).(areaname).B2B3=[PVCrossCorr.(rat).(cond).(areaname).B2B3 PVCrossCorr_B2B3.mean];
                        PVCrossCorr.(rat).(cond).(areaname).B2B4=[PVCrossCorr.(rat).(cond).(areaname).B2B4 PVCrossCorr_B2B4.mean];
                        PVCrossCorr.(rat).(cond).(areaname).B3B4=[PVCrossCorr.(rat).(cond).(areaname).B3B4 PVCrossCorr_B3B4.mean];
                                     
                        matrix={PVCrossCorr_B1B2.PVCorr_matrix; PVCrossCorr_B1B4.PVCorr_matrix; PVCrossCorr_B2B3.PVCorr_matrix; PVCrossCorr_B3B4.PVCorr_matrix};
                        %
                        Data(t).rat(r).cond(c).day(d).region(rr).PVmatrix=matrix;
                    end
                end
            end
        end
        
    end
end

Remapping.RateOverlap = RateOverlap;
Remapping.PFCorr = PFCorr;
Remapping.PVCrossCorr = PVCrossCorr;
% save(savefile_remapping,'Remapping');