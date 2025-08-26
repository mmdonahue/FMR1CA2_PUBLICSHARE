function Data = g_add_exploration_time(Data)

Type = [{'WT' 'KO'}];
cond = [{'empty' 'familiar' 'toy' 'odor' 'mirror' 'famodor' 'hexyl'}];
region = [{'CA1' 'CA1_2' 'CA2' 'CA2_3' 'CA3'}];
spkTms = [];
xBnds = [-50 50];
yBnds = [-50 50];
spatBinSz = 4;
plotOrNot=0;
velFilt = 0;
durCrit = 0;

% add time per bin into the struct -
for t=1:2
    for r=1:length(Data(t).rat)
        for c = 1:length(Data(t).rat(r).cond)
            for d = 1:length(Data(t).rat(r).cond(c).day)
                
                for b=1:4
                    
                    tmpCoords{1,b} = Data(t).rat(r).cond(c).day(d).coords{1, b}(1:9000,:); %change for length of time (i.e. first 2 mins)
                    
                    Data(t).rat(r).cond(c).day(d).timePerBin_5min{b} = {};
                    
                    [rateMap, spkCnt,timePerBin] = get_2d_ratemap(spkTms, tmpCoords{1,b}, xBnds, yBnds, spatBinSz, plotOrNot, velFilt, durCrit);
                    
                    Data(t).rat(r).cond(c).day(d).timePerBin_5min{b} = timePerBin;
                    
                end
            end
        end
    end
end
%% get average time per bin across all begin sessions and plot

Type = [{'WT' 'KO'}];
cond = [{'empty' 'familiar' 'toy' 'odor' 'mirror' 'famodor' 'hexyl'}];
region = [{'CA1' 'CA1_2' 'CA2' 'CA2_3' 'CA3'}];
begins = {'b1' 'b2' 'b3' 'b4'};
duration = {'timePerBin_2min' 'timePerBin_5min' 'timePerBin_20min' };
% boxSize = '12';
ratcntr = 0;
dd=1; %change for duration (first 2 or first 5 mins)

avgtpb.b1 = [];
avgtpb.b2 = [];
avgtpb.b3 = [];
avgtpb.b4 = [];
avgtpb = [];
tpbStack = [];

CA2rats = [1 2 3 5 9 11; 1 3 7 9 10 11];

for t=1:2
    
    
    for r=CA2rats(t,:) %rats with CA2
        %         :length(Data(t).rat)
        ratcntr = ratcntr+1;
        for c = 1:length(Data(t).rat(r).cond)
            
            for b=1:4
                tpbStack{1,b} = [];
                
                for d = 1:length(Data(t).rat(r).cond(c).day)
                    
                    
                    tpbStack{1,b}= cat(3,tpbStack{1,b}, [Data(t).rat(r).cond(c).day(d).(duration{dd}){b}]); %stacks time per bin across days
                    
                end
                avgtpb.(begins{b}){ratcntr,c} = mean(tpbStack{b},3); %average time per bin across days for each cond. in each rat.
            end
            
            
            
            %                 tpbStack = [];
        end
        
    end
end

%make struct
for c = 1:7
    for b=1:4
        
        allRat.(cond{c}).(begins{b}) = [];
        avgCrossRat.(cond{c}).(begins{b}) =[];
    end
end

%add avg time per bin to struct
for c=1:7
    for b=1:4
        for r=1:6
            
            if isempty(avgtpb.(begins{b}){r,c}) == 0
                
                allRat.(cond{c}).(begins{b}) = cat(3,allRat.(cond{c}).(begins{b}), avgtpb.(begins{b}){r,c}); %stack time per bin by rats (25x25xrat)
                
            end
        end
        avgCrossRat.(cond{c}).(begins{b}) = mean(allRat.(cond{c}).(begins{b}),3); %average time per bin for each condition across all rats
    end
end
%% plot exploration time heat map all begins, by rat

for t=1:2
    %     :2;
    %       cntr=0
    for c= 1:7
        for r=1:6
            figure ( 'Position', [ 1802         599        1116         213]);
            
            for b=1:4
                %         cntr=cntr+1;
                subplot(1,4,b);
                if isempty (avgtpb.(begins{b}){r,c}) == 0
                    
                    smMap = smooth_2d_ratemap(  avgtpb.(begins{b}){r,c}, spatBinSz);
                    h = plot_ratemap(smMap, spatBinSz);
                    %             imagesc(avgtpb);
                    colormap (flip(hot));
                    colorbar;
                    xlabel('Position (cm)');
                    %         if cntr ==1 | 3
                    %             ylabel('Position (cm)');
                    %         else
                    %             ylabel('');
                    %         end
                    %             title('Time Per Bin');
                    set(gca, 'FontSize', 14);
                    %             axis square;
                    title(begins{b});
                    h = colorbar;
                    ylabel(h, 'Exploration time (s)')
                    yticks(0:50: 100);
                    xticks(0:50: 100);
                    
                    caxis([ 0 2]); %change for duration
                end
            end
            sgtitle(['rat ' num2str(r),' - ' ,cond{c},' - ', duration{dd}]);
            
%             cd(['E:\PROJECTS\BIG_SQUARE\RAW_DATA\UPDATE_13\ExplorationTime_CA2rats\41724\byRat\first5min\']);
%             save_fig = strcat('E:\PROJECTS\BIG_SQUARE\RAW_DATA\UPDATE_13\ExplorationTime_CA2rats\41724\byRat\first5min\');
%             % SAVE FIGS
%             cd(save_fig);
%             epsImage = sprintf('%s%s%s%s',strcat((Type{t}),'_ExplorationTime_2mins_b1-4',strcat((cond{c}),'_',(duration{dd}),'rat ', num2str(r),'.eps')));
%             figImage = sprintf('%s%s%s%s',strcat((Type{t}),'_ExplorationTime_2mins_b1-4',strcat((cond{c}),'_',(duration{dd}),'rat ', num2str(r),'.fig')));
%             bmpImage = sprintf('%s%s%s%s',strcat((Type{t}),'_ExplorationTime_2mins_b1-4',strcat((cond{c}),'_',(duration{dd}),'rat ', num2str(r),'.bmp')));
%             
%             f = getframe(gcf);
%             [pic, cmap] = frame2im(f);
%             imwrite(pic,bmpImage,'bmp');
%             saveas(1,epsImage,'epsc');
%             saveas(1,figImage,'fig');
%             close all
        end %rat
        
    end
end



%% plot exploration time heat map all begins - avg across rat
for t=1:2
    %     :2;
    %       cntr=0
    for c= 1:7
        figure ( 'Position', [486 583 1116 213]);
        
        for b=1:4
            %         cntr=cntr+1;
            subplot(1,4,b);
            
            smMap = smooth_2d_ratemap( avgCrossRat.(cond{c}).(begins{b}), spatBinSz);
            %             smooth_2d_ratemap(rateMap, rmBinSz, gWinSz, gWinStd)
            h = plot_ratemap(smMap, spatBinSz);
            %             imagesc(avgtpb);
            axis xy
            colormap (flip(hot));
            colorbar;
            xlabel('Position (cm)');
            %         if cntr ==1 | 3
            %             ylabel('Position (cm)');
            %         else
            %             ylabel('');
            %         end
            %             title('Time Per Bin');
            set(gca, 'FontSize', 14);
                        axis square;
            title(begins{b});
            if b==4
                h = colorbar;
                ylabel(h, 'Exploration time (s)')
            end
            
            yticks(0:50: 100);
            xticks(0:50: 100);
            
            caxis([ 0 1]); %change for duration
            
        end
        sgtitle([cond{c},' - ', duration{dd}]);
        %                 cd(['E:\PROJECTS\BIG_SQUARE\RAW_DATA\UPDATE_13\ExplorationTime_CA2rats\41724\avgAcrossRat\first5min\']);
        %                 save_fig = strcat('E:\PROJECTS\BIG_SQUARE\RAW_DATA\UPDATE_13\ExplorationTime_CA2rats\41724\avgAcrossRat\first5min\');
        %                 % SAVE FIGS
        %                 cd(save_fig);
        %                 epsImage = sprintf('%s%s%s%s',strcat((Type{t}),'ExplorationTime_b1-4',strcat((cond{c}),'_',(duration{dd}),'.eps')));
        %                 figImage = sprintf('%s%s%s%s',strcat((Type{t}),'ExplorationTime_b1-4',strcat((cond{c}),'_',(duration{dd}),'.fig')));
        %                 bmpImage = sprintf('%s%s%s%s',strcat((Type{t}),'ExplorationTime_b1-4',strcat((cond{c}),'_',(duration{dd}),'.bmp')));
        %
        %                 f = getframe(gcf);
        %                 [pic, cmap] = frame2im(f);
        %                 imwrite(pic,bmpImage,'bmp');
        %                 saveas(1,epsImage,'epsc');
        %                 saveas(1,figImage,'fig');
%         cd('E:\FMR1_BIGSQUARE\RESULTS\FMR1_PAPER\TPB');
% figtitle = ['FXS' cond{c} 'tpb_avgByrat'];
%     saveas(gcf, figtitle, 'epsc');
%     saveas(gcf, figtitle, 'fig');
%     saveas(gcf, figtitle, 'png');
        %
    end
end
%%

% avgallRat= [];
% avgCrossRat = [];
% for c=1:7
%     for r=1:10
%
%         avgallRat = cat(3,avgallRat, avgtpb{r,c});
%
%     end
%
%     avgCrossRat{c} = mean(avgallRat,3);
%
% end
%% plot exploration time heat map all cond in one plot - (not sure if this is working)
% spOpts = [1:4; 5:8; 9:12; 13:16; 17:20]; %subplot options
% 
% % for t=1
% figure ( 'Position', [ 1802          26        1116         786]);
% for c= [1 4 2 6 5]
%     
%     
%     for b=1:4
%         %         cntr=cntr+1;
%         subplot(5,4,spOpts(c,b));
%         
%         smMap = smooth_2d_ratemap( avgCrossRat.(cond{c}).(begins{b}), spatBinSz);
%         %             smooth_2d_ratemap(rateMap, rmBinSz, gWinSz, gWinStd)
%         h = plot_ratemap(smMap, spatBinSz);
%         %             imagesc(avgtpb);
%         colormap (flip(hot));
%         
%         %             axis square;
%         title(begins{b});
%         if b==1
%             yticks(0:50: 100);
%             
%         else
%             set(gca,'YTickLabel',[]);
%         end
%         
%         if b==4
%             h = colorbar;
%             colorbar;
%             set(gca, 'FontSize', 14);
%             
%             ylabel(h, 'Exploration time (s)')
%         end
%         
%         if c==5
%             xticks(0:50: 100);
%             xlabel('Position (cm)');
%             
%             
%         else
%             set(gca,'XTickLabel',[]);
%             caxis([ 0 2]); %change for duration
%             
%         end
%         sgtitle([cond{c},' - ', duration{dd}]);
%         %                 cd(['E:\PROJECTS\BIG_SQUARE\RAW_DATA\UPDATE_13\ExplorationTime_CA2rats\41724\avgAcrossRat\first5min\']);
%         %                 save_fig = strcat('E:\PROJECTS\BIG_SQUARE\RAW_DATA\UPDATE_13\ExplorationTime_CA2rats\41724\avgAcrossRat\first5min\');
%         %                 % SAVE FIGS
%         %                 cd(save_fig);
%         %                 epsImage = sprintf('%s%s%s%s',strcat((Type{t}),'ExplorationTime_b1-4',strcat((cond{c}),'_',(duration{dd}),'.eps')));
%         %                 figImage = sprintf('%s%s%s%s',strcat((Type{t}),'ExplorationTime_b1-4',strcat((cond{c}),'_',(duration{dd}),'.fig')));
%         %                 bmpImage = sprintf('%s%s%s%s',strcat((Type{t}),'ExplorationTime_b1-4',strcat((cond{c}),'_',(duration{dd}),'.bmp')));
%         %
%         %                 f = getframe(gcf);
%         %                 [pic, cmap] = frame2im(f);
%         %                 imwrite(pic,bmpImage,'bmp');
%         %                 saveas(1,epsImage,'epsc');
%         %                 saveas(1,figImage,'fig');
%         %
%     end
% end
end %function