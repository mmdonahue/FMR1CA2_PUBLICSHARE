function Remapping = f_CombineCA2_CA2_3remappingStruct(Remapping)
% function Remapping = f_CombineCA2_CA2_3remappingStruct(Remapping)

rat={'rat117', 'rat122', 'rat165', 'rat196', 'rat256', 'rat326', 'rat334', 'rat335', 'rat391', 'rat392', 'rat418', 'rat416'...
    'rat120', 'rat124', 'rat125', 'rat168', 'rat316', 'rat328', 'rat330', 'rat328', 'rat330', 'rat394', 'rat395', 'rat445', 'rat442'};
Struct=[{'PFCorr' 'RateOverlap' 'PVCrossCorr'}];
cond = [{'empty' 'familiar' 'toy' 'odor' 'mirror' 'famodor' 'hexyl'}];
region = [{'CA1' 'CA1_2' 'CA2' 'CA2_3' 'CA3'}];
session =  [{'B1B2' 'B1B3' 'B1B4' 'B2B3' 'B2B4' 'B3B4'}];
Type =  [{'WT' 'KO'}];

for s=1:length(Struct)
    for r=1:length(rat)
        for c=1:length(cond)
            for b=1:length(session)
                
                Remapping.(Struct{s}).(rat{r}).(cond{c}).CA2_CA2_3.(session{b}) = []
                
                Remapping.(Struct{s}).(rat{r}).(cond{c}).CA2_CA2_3.(session{b}) = [Remapping.(Struct{s}).(rat{r}).(cond{c}).CA2.(session{b}) Remapping.(Struct{s}).(rat{r}).(cond{c}).CA2_3.(session{b})]
                
            end
        end
    end
end


for s=1:length(Struct)
    for t=1:length(Type)
        for c=1:length(cond)
            for b=1:length(session)
                
                Remapping.(Struct{s}).(Type{t}).(cond{c}).CA2_CA2_3.(session{b}) = []
                
                Remapping.(Struct{s}).(Type{t}).(cond{c}).CA2_CA2_3.(session{b}) = [Remapping.(Struct{s}).(Type{t}).(cond{c}).CA2.(session{b}) Remapping.(Struct{s}).(Type{t}).(cond{c}).CA2_3.(session{b})]
                
            end
        end
    end
end

rNums={'rat117', 'rat122', 'rat165', 'rat196', 'rat256', 'rat326', 'rat334', 'rat335', 'rat391', 'rat392', 'rat418', 'rat416'...
    'rat120', 'rat124', 'rat125', 'rat168', 'rat316', 'rat328', 'rat330', 'rat328', 'rat330', 'rat394', 'rat395', 'rat445', 'rat442'};

cond = [{'empty' 'familiar' 'toy' 'odor' 'mirror' 'famodor' 'hexyl'}];
region = [{'CA1' 'CA1_2' 'CA2' 'CA2_3' 'CA3'}];
rep = [{'d1' 'd2' 'd3' 'd4' 'd5' 'd6' 'd7' 'd8' 'd9' 'd10'}];


for rr= 1:length(region)
    for c=1:length(cond)
        for r = 1:length(rNums)
            for ii=1:length(rep)
                
                PFCorr.CA2_CA2_3.(cond{c}).(rNums{r}).(rep{ii})=[];
                PFCorr.CA2_CA2_3.(cond{c}).(rNums{r}).(rep{ii})=  [PFCorr.CA2.(cond{c}).(rNums{r}).(rep{ii}) PFCorr.CA2_3.(cond{c}).(rNums{r}).(rep{ii})];
                
            end
        end
    end
end