function Data = b_Loop_ratemap_stacks(Data, dataDir)


% %%LOOP THROUGH ALL DATA AND ADD RATEMAPS AND STACKS TO STRUCT
% %load relevant struct
% struct = 'FMR1_UPDATE_12.mat'; %change depending on struct name

% cd(['E:\PROJECTS\BIG_SQUARE\RAW_DATA\']);
% load(struct);

%save at end
% save_struct = ['F:\Rat418\BIG_SQUARE']; %filename to save as

%% INSERT ANY CONSTANT VARIABLES

plot_scale=1; %0: if you want each ratemap to be scales to it's own peak; 1: if you want the ratemaps to be scaled to the peak of the highest firing session
Session='Begin1Begin2Begin3Begin4';
session_sequence=[1,2,3,4]; %sequence you want the sessions runin
% rotate_para=0; %set to 0 if you don't need to rotate the ratemap.  - NO LONGER CONSTANT - 3D ROOM RATS NEED TO BE ROTATED

%% INITIALIZE 3D ROOM RATS
% The coords in the 3d room are flipped relative to the cage location. Initialize which rats were
% run in that room so that the read in coords can be flipped to match the otehr rats in the study.

flipRats = {'rat394', 'rat395', 'rat418', 'rat442'};

%% LOOP THROUGH GENOTYPE/RAT/CONDITION/DAY/REGION
numType = [{'WT' 'KO'}];
for t = 1:2
    fprintf('%s\n', Data(t).name);
    if t < 2
        rNums = [117 122 165 196 256 326 334 335 391 392 418 416]; %add rats as more are completed and adjust 'r' so only new rat gets added to struct
    else
        rNums = [120 124 125 168 316 328 330 394 395 445 442]; %add rats as more are completed and adjust 'r' so only new rat gets added to struct
    end

         for r = 1:length(rNums)
        fprintf('\tRat %d\n', r);
        ratDir=([dataDir '\' num2str(numType{t}),'\Rat' num2str(rNums(r)),'\']);

        Rat=[num2str(Data(t).rat(r).name)];

        for c = 1:length(Data(t).rat(r).cond)
            fprintf('\t\tCond %d\n', c);

            for d = 1:length(Data(t).rat(r).cond(c).day)
                fprintf('\t\t\tDay %d\n', d);


                %%
                for rr=1:length(Data(t).rat(r).cond(c).day(d).region)
                    fprintf('\t\t\t\tRegion %d\n', rr);

                    cd([dataDir '\' num2str(numType{t}),'\Rat' num2str(rNums(r)),'\',num2str(Data(t).rat(r).cond(c).day(d).name)])

                    if isempty((Data(t).rat(r).cond(c).day(d).region(rr).TT))==0

                        %make sure stack are clear
                        Stack_B1=[];
                        Stack_B2=[];
                        Stack_B3=[];
                        Stack_B4=[];
                        PeakRate_B1=[];
                        PeakRate_B2=[];
                        PeakRate_B3=[];
                        PeakRate_B4=[];



                        %set up changing variables
                        infile=[Data(t).rat(r).cond(c).day(d).region(rr).name,'_InFile2.txt'];
                        areaname=([num2str(Data(t).rat(r).cond(c).day(d).region(rr).name)]);
                        TTList=([areaname,'.txt']);
                        condname=([num2str(Data(t).rat(r).cond(c).name)]);
                        assemble_note=strcat(condname,'_',areaname,'_',Rat,'_',Session,'_',num2str(Data(t).rat(r).cond(c).day(d).name)); % just add some notes as part of figure name
                        %where to save data
                        path=[ratDir '\' num2str(Data(t).rat(r).cond(c).day(d).name)];
                        savefile=strcat([path '\' num2str(Data(t).rat(r).cond(c).day(d).name)],'_',areaname,'.mat');
                        save_fig=path;

                        %check if rats need to be flipped
                        if ~isempty(strmatch(Data(t).rat(r).name, flipRats))
                            rotate_para = 4;
                        else
                            rotate_para = 0;
                        end %3d room rats, coords need to be flipped

                        %call Chenguangs ratemap code (edited by Alex)
                        [ratemap0,ratemap0_mat,peakrate0]=ratemap_RM_group_area_cz_v2(path,infile,TTList,plot_scale,rotate_para,save_fig,assemble_note,session_sequence);

                        %compile stacks
                        Stack_B1=cat(3,Stack_B1,ratemap0_mat{1});
                        Stack_B2=cat(3,Stack_B2,ratemap0_mat{2});
                        Stack_B3=cat(3,Stack_B3,ratemap0_mat{3});
                        Stack_B4=cat(3,Stack_B4,ratemap0_mat{4});
                        PeakRate_B1=[PeakRate_B1;peakrate0(1,:)'];
                        PeakRate_B2=[PeakRate_B2;peakrate0(2,:)'];
                        PeakRate_B3=[PeakRate_B3;peakrate0(3,:)'];
                        PeakRate_B4=[PeakRate_B4;peakrate0(4,:)'];

                        save(savefile,'Stack_B1','Stack_B2','Stack_B3','Stack_B4','PeakRate_B1','PeakRate_B2','PeakRate_B3','PeakRate_B4');

                        Data(t).rat(r).cond(c).day(d).region(rr).ratemap=ratemap0;


                    end
                end
            end
        end
    end
    %     save(save_struct, 'Data');
end
% save(save_struct, 'Data');


