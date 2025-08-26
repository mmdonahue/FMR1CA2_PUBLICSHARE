function c_Check_arena_coverage(Data)


%% Use Struct to direct to correct folder and pull Stacks

for t = 1:2
    %     if t < 2
    %         rNums = {'rat117' 'rat122' 'rat165' 'rat196' 'rat256', 'rat326', 'rat334', 'rat335', 'rat391', 'rat392', 'rat418', 'rat416'};
    %     else
    %         rNums = {'rat120' 'rat124' 'rat125' 'rat168' 'rat316' 'rat328' 'rat330', 'rat328', 'rat330', 'rat394', 'rat395', 'rat445', 'tay442'};
    %     end

    for r = 1:length(Data(t).rat)
        fprintf('%s\n', Data(t).rat(r).name)
        Rat=(Data(t).rat(r).name);

        for c = 1:length(Data(t).rat(r).cond)

            for d = 1:length(Data(t).rat(r).cond(c).day)

                checked = 0; %day hasn' been checked yet
                covByBeg = NaN(1,4);
                while checked == 0
                    for rr=1:length(Data(t).rat(r).cond(c).day(d).region)

                        %                     cd([ dataDir '\' num2str(numType{t}),'\',num2str(rNums{r}),'\',num2str(Data(t).rat(r).cond(c).day(d).name)])

                        if isempty((Data(t).rat(r).cond(c).day(d).region(rr).TT))==0
                            %% CALCULATE AMOUNT OF THE ARENA THE RAT HAS ENTERED

                            for ii=1:4

                                nonVisBins = length(find(isnan(Data(t).rat(r).cond(c).day(d).region(rr).ratemap{ii,1}))); %non visited bins

                                covByBeg(ii) = (625 - nonVisBins)/625; %this would need to be changed if not 25x25 bins anymore


                            end % ii means begin
                            checked = 1;
                        end %if there are cells
                        if checked == 0 && rr == 5
                            checked = 1;
                        end %no cells in any region that day
                    end %region
                end %while

                if min(covByBeg) < 0.4
                    fprintf('\t%s does not meed min coverage threshold\n', Data(t).rat(r).cond(c).day(d).name)
                end %doesn't meet min
            end
        end
    end
end

