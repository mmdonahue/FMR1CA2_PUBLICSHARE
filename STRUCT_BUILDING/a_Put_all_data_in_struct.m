function Data = a_Put_all_data_in_struct(dataDir)
% function Data = Put_all_data_in_struct(dataDir)
% 
% PURPOSE:
%   Inititalize the Data struct, to be used for generating figures for the FXS CA2 social paper.
% 
% INPUT: 
%   dataDir = directory where all of the raw data is stored.
% 
% NOTE:
%   This function is based on the '"Put_data_in_struct_[year]' function created by Alex for
%   iteratively adding rats to the Data struct. This is a function that will create the complete
%   struct from scratch, if necessary. I did not originally write that code and am only modifying
%   this one for convenience. I highly recommend using the completed struct located at:
%        /corral/utexas/ColginLab/Meg/Projects/FMR1_BIGSQUARE/STRUCTS/FMR1_14_TPB.mat
% 
% MMD
% 04/2025
% Colgin Lab


%% INITIALIZE RAT GENOTYPES, NAMES, CONDITIONS, AND DATES

Data(1).name = 'WT';

% RAT 1 = RAT 117
Data(1).rat(1).name = 'rat117';
Data(1).rat(1).cond(1).name = 'empty';
Data(1).rat(1).cond(1).day(1).name = '2017-04-02';
Data(1).rat(1).cond(1).day(2).name = '2017-04-05';
Data(1).rat(1).cond(1).day(3).name = '2017-04-08';
Data(1).rat(1).cond(1).day(4).name = '2017-04-11';
Data(1).rat(1).cond(1).day(5).name = '2017-04-15';
Data(1).rat(1).cond(1).day(6).name = '2017-04-19';

Data(1).rat(1).cond(2).name = 'familiar';
Data(1).rat(1).cond(2).day(1).name = '2017-04-04';
Data(1).rat(1).cond(2).day(2).name = '2017-04-09';
Data(1).rat(1).cond(2).day(3).name = '2017-04-13';
Data(1).rat(1).cond(2).day(4).name = '2017-04-16';

Data(1).rat(1).cond(3).name = 'toy';
Data(1).rat(1).cond(3).day(1).name = '2017-04-03';
Data(1).rat(1).cond(3).day(2).name = '2017-04-06';

Data(1).rat(1).cond(4).name = 'odor';
Data(1).rat(1).cond(4).day(1).name = '2017-04-07';
Data(1).rat(1).cond(4).day(2).name = '2017-04-12';
Data(1).rat(1).cond(4).day(3).name = '2017-04-18';

Data(1).rat(1).cond(5).name = 'mirror';
Data(1).rat(1).cond(5).day(1).name = '2017-04-14';
Data(1).rat(1).cond(5).day(2).name = '2017-04-17';


% RAT 2 = RAT 122
Data(1).rat(2).name = 'rat122';

Data(1).rat(2).cond(1).name = 'empty';
Data(1).rat(2).cond(1).day(1).name = '2017-01-30';
Data(1).rat(2).cond(1).day(2).name = '2017-02-02';
Data(1).rat(2).cond(1).day(3).name = '2017-02-06';
Data(1).rat(2).cond(1).day(4).name = '2017-02-10';

Data(1).rat(2).cond(2).name = 'familiar';
Data(1).rat(2).cond(2).day(1).name = '2017-01-28';
Data(1).rat(2).cond(2).day(2).name = '2017-02-03';
Data(1).rat(2).cond(2).day(3).name = '2017-02-08';

Data(1).rat(2).cond(3).name = 'toy';
Data(1).rat(2).cond(3).day(1).name = '2017-01-29';
Data(1).rat(2).cond(3).day(2).name = '2017-02-05';
Data(1).rat(2).cond(3).day(3).name = '2017-02-09';

Data(1).rat(2).cond(4).name = 'odor';
Data(1).rat(2).cond(4).day(1).name = '2017-01-31';
Data(1).rat(2).cond(4).day(2).name = '2017-02-07';

Data(1).rat(2).cond(5).name = 'mirror';
Data(1).rat(2).cond(5).day(1).name = '2017-02-01';
Data(1).rat(2).cond(5).day(2).name = '2017-02-04';
Data(1).rat(2).cond(5).day(3).name = '2017-02-11';

% RAT 3 = RAT 165G
Data(1).rat(3).name = 'rat165';
Data(1).rat(3).cond(1).name = 'empty';
Data(1).rat(3).cond(1).day(1).name = '2017-07-20';
Data(1).rat(3).cond(1).day(2).name = '2017-07-23';
Data(1).rat(3).cond(1).day(3).name = '2017-07-28';
Data(1).rat(3).cond(1).day(4).name = '2017-08-02';


Data(1).rat(3).cond(2).name = 'familiar';
Data(1).rat(3).cond(2).day(1).name = '2017-07-21';
Data(1).rat(3).cond(2).day(2).name = '2017-07-27';
Data(1).rat(3).cond(2).day(3).name = '2017-07-31';

Data(1).rat(3).cond(3).name = 'toy';
Data(1).rat(3).cond(3).day(1).name = '2017-07-19';
Data(1).rat(3).cond(3).day(2).name = '2017-07-24';
Data(1).rat(3).cond(3).day(3).name = '2017-07-30';

Data(1).rat(3).cond(4).name = 'odor';
Data(1).rat(3).cond(4).day(1).name = '2017-07-25';
Data(1).rat(3).cond(4).day(2).name = '2017-07-29';
Data(1).rat(3).cond(4).day(3).name = '2017-08-03';

Data(1).rat(3).cond(5).name = 'mirror';
Data(1).rat(3).cond(5).day(1).name = '2017-07-22';
Data(1).rat(3).cond(5).day(2).name = '2017-07-26';
Data(1).rat(3).cond(5).day(3).name = '2017-08-01';

Data(1).rat(3).cond(6).name = 'famodor';
Data(1).rat(3).cond(6).day(1).name = '2017-08-04';

Data(1).rat(3).cond(7).name = 'hexyl';

% RAT 4 = RAT 196Q
Data(1).rat(4).name = 'rat196';
Data(1).rat(4).cond(1).name = 'empty';
Data(1).rat(4).cond(1).day(1).name = '2018-10-21';
Data(1).rat(4).cond(1).day(2).name = '2018-10-25';
Data(1).rat(4).cond(1).day(3).name = '2018-10-30';
Data(1).rat(4).cond(1).day(4).name = '2018-11-03';
Data(1).rat(4).cond(1).day(5).name = '2018-11-08';
Data(1).rat(4).cond(1).day(6).name = '2018-11-13';
Data(1).rat(4).cond(1).day(7).name = '2018-11-17';

Data(1).rat(4).cond(2).name = 'familiar';
Data(1).rat(4).cond(2).day(1).name = '2018-10-27';
Data(1).rat(4).cond(2).day(2).name = '2018-11-05';
Data(1).rat(4).cond(2).day(3).name = '2018-11-10';
Data(1).rat(4).cond(2).day(4).name = '2018-11-15';

Data(1).rat(4).cond(3).name = 'toy';
Data(1).rat(4).cond(3).day(1).name = '2018-10-29';
Data(1).rat(4).cond(3).day(2).name = '2018-11-09';
Data(1).rat(4).cond(3).day(3).name = '2018-11-12';

Data(1).rat(4).cond(4).name = 'odor';
Data(1).rat(4).cond(4).day(1).name = '2018-10-20';
Data(1).rat(4).cond(4).day(2).name = '2018-10-26';
Data(1).rat(4).cond(4).day(3).name = '2018-11-01';
Data(1).rat(4).cond(4).day(4).name = '2018-11-07';

Data(1).rat(4).cond(5).name = 'mirror';
Data(1).rat(4).cond(5).day(1).name = '2018-10-23';
Data(1).rat(4).cond(5).day(2).name = '2018-11-04';
Data(1).rat(4).cond(5).day(3).name = '2018-11-11';
Data(1).rat(4).cond(5).day(4).name = '2018-11-16';

Data(1).rat(4).cond(6).name = 'famodor';
Data(1).rat(4).cond(6).day(1).name = '2018-10-19';
Data(1).rat(4).cond(6).day(2).name = '2018-10-24';
Data(1).rat(4).cond(6).day(3).name = '2018-10-31';
Data(1).rat(4).cond(6).day(4).name = '2018-11-06';

Data(1).rat(4).cond(7).name = 'hexyl';
Data(1).rat(4).cond(7).day(1).name = '2018-10-22';
Data(1).rat(4).cond(7).day(2).name = '2018-10-28';
Data(1).rat(4).cond(7).day(3).name = '2018-11-02';
Data(1).rat(4).cond(7).day(4).name = '2018-11-14';

%RAT 5 = RAT 256V
Data(1).rat(5).name = 'rat256';
Data(1).rat(5).cond(1).name = 'empty';
Data(1).rat(5).cond(1).day(1).name = '2019-10-04';
Data(1).rat(5).cond(1).day(2).name = '2019-10-07';
Data(1).rat(5).cond(1).day(3).name = '2019-10-12';
Data(1).rat(5).cond(1).day(4).name = '2019-10-16';
Data(1).rat(5).cond(1).day(5).name = '2019-10-30';
Data(1).rat(5).cond(1).day(6).name = '2019-11-06';
Data(1).rat(5).cond(1).day(7).name = '2019-11-12';
Data(1).rat(5).cond(1).day(8).name = '2019-11-18';
Data(1).rat(5).cond(1).day(9).name = '2019-11-25';
Data(1).rat(5).cond(1).day(10).name = '2019-12-01';

Data(1).rat(5).cond(2).name = 'familiar';
Data(1).rat(5).cond(2).day(1).name = '2019-10-06';
Data(1).rat(5).cond(2).day(2).name = '2019-10-25';
Data(1).rat(5).cond(2).day(3).name = '2019-11-09';
Data(1).rat(5).cond(2).day(4).name = '2019-11-16';
Data(1).rat(5).cond(2).day(5).name = '2019-11-26';
Data(1).rat(5).cond(2).day(6).name = '2019-12-04';

Data(1).rat(5).cond(3).name = 'toy';
Data(1).rat(5).cond(3).day(1).name = '2019-10-05';
Data(1).rat(5).cond(3).day(2).name = '2019-10-14';
Data(1).rat(5).cond(3).day(3).name = '2019-11-02';
Data(1).rat(5).cond(3).day(4).name = '2019-11-17';
Data(1).rat(5).cond(3).day(5).name = '2019-11-24';
Data(1).rat(5).cond(3).day(6).name = '2019-12-06';

Data(1).rat(5).cond(4).name = 'odor';
Data(1).rat(5).cond(4).day(1).name = '2019-10-09';
Data(1).rat(5).cond(4).day(2).name = '2019-10-18';
Data(1).rat(5).cond(4).day(3).name = '2019-11-04';
Data(1).rat(5).cond(4).day(4).name = '2019-11-15';
Data(1).rat(5).cond(4).day(4).name = '2019-11-23';
Data(1).rat(5).cond(4).day(5).name = '2019-11-30';

Data(1).rat(5).cond(5).name = 'mirror';
Data(1).rat(5).cond(5).day(1).name = '2019-10-13';
Data(1).rat(5).cond(5).day(2).name = '2019-11-01';
Data(1).rat(5).cond(5).day(3).name = '2019-11-10';
Data(1).rat(5).cond(5).day(4).name = '2019-11-19';
Data(1).rat(5).cond(5).day(5).name = '2019-11-29';

Data(1).rat(5).cond(6).name = 'famodor';
Data(1).rat(5).cond(6).day(1).name = '2019-10-08';
Data(1).rat(5).cond(6).day(2).name = '2019-10-15';
Data(1).rat(5).cond(6).day(3).name = '2019-11-03';
Data(1).rat(5).cond(6).day(4).name = '2019-11-13';
Data(1).rat(5).cond(6).day(5).name = '2019-11-22';
Data(1).rat(5).cond(6).day(6).name = '2019-12-02';

Data(1).rat(5).cond(7).name = 'hexyl';
Data(1).rat(5).cond(7).day(1).name = '2019-10-11';
Data(1).rat(5).cond(7).day(2).name = '2019-10-26';
Data(1).rat(5).cond(7).day(3).name = '2019-11-05';
Data(1).rat(5).cond(7).day(4).name = '2019-11-11';
Data(1).rat(5).cond(7).day(5).name = '2019-11-20';
Data(1).rat(5).cond(7).day(6).name = '2019-11-27';
Data(1).rat(5).cond(7).day(7).name = '2019-12-05';

% RAT 6 = RAT 326

Data(1).rat(6).name = 'rat326';
Data(1).rat(6).cond(1).name = 'empty';
Data(1).rat(6).cond(1).day(1).name = '2021-06-18';
Data(1).rat(6).cond(1).day(1).name = '2021-06-24';

Data(1).rat(6).cond(2).name = 'familiar';
Data(1).rat(6).cond(2).day(1).name = '2021-06-20';

Data(1).rat(6).cond(3).name = 'toy';
Data(1).rat(6).cond(3).day(1).name = '2021-06-19';

Data(1).rat(6).cond(4).name = 'odor';
Data(1).rat(6).cond(4).day(1).name = '2021-06-16';

Data(1).rat(6).cond(5).name = 'mirror';
Data(1).rat(6).cond(5).day(1).name = '2021-06-21';

Data(1).rat(6).cond(6).name = 'famodor';
Data(1).rat(6).cond(6).day(1).name = '2021-06-15';
Data(1).rat(6).cond(6).day(2).name = '2021-06-23';

Data(1).rat(6).cond(7).name = 'hexyl';
Data(1).rat(6).cond(7).day(1).name = '2021-06-17';
Data(1).rat(6).cond(7).day(2).name = '2021-06-22';

% RAT 7 = RAT 334

Data(1).rat(7).name = 'rat334';

Data(1).rat(7).cond(1).name = 'empty';
Data(1).rat(7).cond(1).day(1).name = '2021-11-16';

Data(1).rat(7).cond(2).name = 'familiar';

Data(1).rat(7).cond(3).name = 'toy';

Data(1).rat(7).cond(4).name = 'odor';

Data(1).rat(7).cond(5).name = 'mirror';

Data(1).rat(7).cond(6).name = 'famodor';
Data(1).rat(7).cond(6).day(1).name = '2021-11-17';

Data(1).rat(7).cond(7).name = 'hexyl';

% RAT 8 = RAT 335

Data(1).rat(8).name = 'rat335';

Data(1).rat(8).cond(1).name = 'empty';
Data(1).rat(8).cond(1).day(1).name = '2022-03-14';
Data(1).rat(8).cond(1).day(2).name = '2022-03-15';

Data(1).rat(8).cond(2).name = 'familiar';

Data(1).rat(8).cond(3).name = 'toy';

Data(1).rat(8).cond(4).name = 'odor';

Data(1).rat(8).cond(5).name = 'mirror';

Data(1).rat(8).cond(6).name = 'famodor';
Data(1).rat(8).cond(6).day(1).name = '2022-03-16';

Data(1).rat(8).cond(7).name = 'hexyl';

%RAT 9 = RAT 391

 Data(1).rat(9).name = 'rat391';

Data(1).rat(9).cond(1).name = 'empty';
Data(1).rat(9).cond(1).day(1).name = '2022-08-12';
Data(1).rat(9).cond(1).day(2).name = '2022-08-18';
Data(1).rat(9).cond(1).day(3).name = '2022-08-29';

Data(1).rat(9).cond(2).name = 'familiar';
Data(1).rat(9).cond(2).day(1).name = '2022-08-19';

Data(1).rat(9).cond(3).name = 'toy';
Data(1).rat(9).cond(3).day(1).name = '2022-08-15';

Data(1).rat(9).cond(4).name = 'odor';
Data(1).rat(9).cond(4).day(1).name = '2022-08-17';

Data(1).rat(9).cond(5).name = 'mirror';
Data(1).rat(9).cond(5).day(1).name = '2022-08-21';

Data(1).rat(9).cond(6).name = 'famodor';
Data(1).rat(9).cond(6).day(1).name = '2022-08-14';
Data(1).rat(9).cond(6).day(2).name = '2022-08-26';

Data(1).rat(9).cond(7).name = 'hexyl';
Data(1).rat(9).cond(7).day(1).name = '2022-08-13';
Data(1).rat(9).cond(7).day(2).name = '2022-08-30';
%
% RAT 10 = RAT 392
Data(1).rat(10).name = 'rat392';

Data(1).rat(10).cond(1).name = 'empty';
Data(1).rat(10).cond(1).day(1).name = '2023-03-17';
Data(1).rat(10).cond(1).day(2).name = '2023-03-25';
Data(1).rat(10).cond(1).day(3).name = '2023-04-04';

Data(1).rat(10).cond(2).name = 'familiar';
Data(1).rat(10).cond(2).day(1).name = '2023-03-30';

Data(1).rat(10).cond(3).name = 'toy';
Data(1).rat(10).cond(3).day(1).name = '2023-03-26';

Data(1).rat(10).cond(4).name = 'odor';
Data(1).rat(10).cond(4).day(1).name = '2023-03-22';
Data(1).rat(10).cond(4).day(1).name = '2023-03-22';

Data(1).rat(10).cond(5).name = 'mirror';
Data(1).rat(10).cond(5).day(1).name = '2023-04-01';

Data(1).rat(10).cond(6).name = 'famodor';
Data(1).rat(10).cond(6).day(1).name = '2023-03-20'; %CHECK THIS ONE, NO
CELLS OR NOT CUT
Data(1).rat(10).cond(6).day(2).name = '2023-03-29';

Data(1).rat(10).cond(7).name = 'hexyl';
Data(1).rat(10).cond(7).day(1).name = '2023-03-19';
Data(1).rat(10).cond(7).day(2).name = '2023-03-27';

% RAT 11 = RAT 418
Data(1).rat(11).name = 'rat418';

Data(1).rat(11).cond(1).name = 'empty';
Data(1).rat(11).cond(1).day(1).name = '2023-11-02';
Data(1).rat(11).cond(1).day(2).name = '2023-11-09';
Data(1).rat(11).cond(1).day(3).name = '2023-11-21';

Data(1).rat(11).cond(2).name = 'familiar';
Data(1).rat(11).cond(2).day(1).name = '2023-11-08';
Data(1).rat(11).cond(2).day(2).name = '2023-11-22';

Data(1).rat(11).cond(3).name = 'toy';

Data(1).rat(11).cond(4).name = 'odor';
Data(1).rat(11).cond(4).day(1).name = '2023-11-07';
Data(1).rat(11).cond(4).day(2).name = '2023-11-15';
Data(1).rat(11).cond(4).day(3).name = '2023-11-30';

Data(1).rat(11).cond(5).name = 'mirror';

Data(1).rat(11).cond(6).name = 'famodor';
Data(1).rat(11).cond(6).day(1).name = '2023-11-03'
Data(1).rat(11).cond(6).day(2).name = '2023-11-11';
Data(1).rat(11).cond(6).day(3).name = '2023-11-20';
Data(1).rat(11).cond(6).day(4).name = '2023-11-28';

Data(1).rat(11).cond(7).name = 'hexyl';
Data(1).rat(11).cond(7).day(1).name = '2023-11-05';
Data(1).rat(11).cond(7).day(2).name = '2023-11-10';

% RAT 12 = RAT 416
Data(1).rat(12).name = 'rat416';

Data(1).rat(12).cond(1).name = 'empty';
Data(1).rat(12).cond(1).day(1).name = '2023-10-24';
Data(1).rat(12).cond(1).day(2).name = '2023-11-03';

Data(1).rat(12).cond(2).name = 'familiar';
Data(1).rat(12).cond(2).day(1).name = '2023-11-02';

Data(1).rat(12).cond(3).name = 'toy';

Data(1).rat(12).cond(4).name = 'odor';
Data(1).rat(12).cond(4).day(1).name = '2023-11-01';

Data(1).rat(12).cond(5).name = 'mirror';

Data(1).rat(12).cond(6).name = 'famodor';
Data(1).rat(12).cond(6).day(1).name = '2023-10-31'

Data(1).rat(12).cond(7).name = 'hexyl';
Data(1).rat(12).cond(7).day(1).name = '2023-10-28';

% GENOTYPE 2 = KO/FXS
Data(2).name = 'KO';

% RAT 1 = RAT 120
Data(2).rat(1).name = 'rat120';
Data(2).rat(1).cond(1).name = 'empty';
Data(2).rat(1).cond(1).day(1).name = '2016-12-08';
Data(2).rat(1).cond(1).day(2).name = '2016-12-11';
Data(2).rat(1).cond(1).day(3).name = '2016-12-14';
Data(2).rat(1).cond(1).day(4).name = '2016-12-17';
Data(2).rat(1).cond(1).day(5).name = '2016-12-18';

Data(2).rat(1).cond(2).name = 'familiar';
Data(2).rat(1).cond(2).day(1).name = '2016-12-10';
Data(2).rat(1).cond(2).day(2).name = '2016-12-15';

Data(2).rat(1).cond(3).name = 'toy';
Data(2).rat(1).cond(3).day(1).name = '2016-12-09';
Data(2).rat(1).cond(3).day(2).name = '2016-12-16';

Data(2).rat(1).cond(4).name = 'odor';
Data(2).rat(1).cond(4).day(1).name = '2016-12-12';
Data(2).rat(1).cond(4).day(2).name = '2016-12-19';

Data(2).rat(1).cond(5).name = 'mirror';
Data(2).rat(1).cond(5).day(1).name = '2016-12-13';
Data(2).rat(1).cond(5).day(2).name = '2016-12-20';

% RAT 2 = RAT 124
Data(2).rat(2).name = 'rat124';
Data(2).rat(2).cond(1).name = 'empty';
Data(2).rat(2).cond(1).day(1).name = '2017-04-14';
Data(2).rat(2).cond(1).day(2).name = '2017-04-20';
Data(2).rat(2).cond(1).day(3).name = '2017-04-24';

Data(2).rat(2).cond(2).name = 'familiar';
Data(2).rat(2).cond(2).day(1).name = '2017-04-13';
Data(2).rat(2).cond(2).day(2).name = '2017-04-19';
Data(2).rat(2).cond(2).day(3).name = '2017-04-23';

Data(2).rat(2).cond(3).name = 'toy';
Data(2).rat(2).cond(3).day(1).name = '2017-04-12';
Data(2).rat(2).cond(3).day(2).name = '2017-04-16';
Data(2).rat(2).cond(3).day(3).name = '2017-04-22';

Data(2).rat(2).cond(4).name = 'odor';
Data(2).rat(2).cond(4).day(1).name = '2017-04-18';
Data(2).rat(2).cond(4).day(2).name = '2017-04-25';

Data(2).rat(2).cond(5).name = 'mirror';
Data(2).rat(2).cond(5).day(1).name = '2017-04-15';
Data(2).rat(2).cond(5).day(2).name = '2017-04-21';


% RAT 3 = RAT 125
Data(2).rat(3).name = 'rat125';
Data(2).rat(3).cond(1).name = 'empty';
Data(2).rat(3).cond(1).day(1).name = '2017-02-23';
Data(2).rat(3).cond(1).day(2).name = '2017-03-05';
Data(2).rat(3).cond(1).day(3).name = '2017-03-09';

Data(2).rat(3).cond(2).name = 'familiar';
Data(2).rat(3).cond(2).day(1).name = '2017-02-21';
Data(2).rat(3).cond(2).day(2).name = '2017-03-04';
Data(2).rat(3).cond(2).day(3).name = '2017-03-08';
Data(2).rat(3).cond(2).day(4).name = '2017-03-14';

Data(2).rat(3).cond(3).name = 'toy';
Data(2).rat(3).cond(3).day(1).name = '2017-02-20';
Data(2).rat(3).cond(3).day(2).name = '2017-03-01';
Data(2).rat(3).cond(3).day(3).name = '2017-03-07';
Data(2).rat(3).cond(3).day(4).name = '2017-03-12';

Data(2).rat(3).cond(4).name = 'odor';
Data(2).rat(3).cond(4).day(1).name = '2017-02-24';
Data(2).rat(3).cond(4).day(2).name = '2017-03-03';
Data(2).rat(3).cond(4).day(3).name = '2017-03-10';

Data(2).rat(3).cond(5).name = 'mirror';
Data(2).rat(3).cond(5).day(1).name = '2017-02-22';
Data(2).rat(3).cond(5).day(2).name = '2017-02-25';
Data(2).rat(3).cond(5).day(3).name = '2017-03-06';
Data(2).rat(3).cond(5).day(4).name = '2017-03-11';

% RAT 4 = RAT 168H
Data(2).rat(4).name = 'rat168';
Data(2).rat(4).cond(1).name = 'empty';
Data(2).rat(4).cond(1).day(1).name = '2017-10-17';
Data(2).rat(4).cond(1).day(2).name = '2017-10-21';
Data(2).rat(4).cond(1).day(3).name = '2017-10-25';
Data(2).rat(4).cond(1).day(4).name = '2017-10-30';
Data(2).rat(4).cond(1).day(5).name = '2017-11-05';

Data(2).rat(4).cond(2).name = 'familiar';
Data(2).rat(4).cond(2).day(1).name = '2017-10-16';
Data(2).rat(4).cond(2).day(2).name = '2017-10-23';
Data(2).rat(4).cond(2).day(3).name = '2017-11-04';

Data(2).rat(4).cond(3).name = 'toy';
Data(2).rat(4).cond(3).day(1).name = '2017-10-15';
Data(2).rat(4).cond(3).day(2).name = '2017-10-24';
Data(2).rat(4).cond(3).day(3).name = '2017-11-01';

Data(2).rat(4).cond(4).name = 'odor';
Data(2).rat(4).cond(4).day(1).name = '2017-10-20';
Data(2).rat(4).cond(4).day(2).name = '2017-10-26';
Data(2).rat(4).cond(4).day(3).name = '2017-11-03';

Data(2).rat(4).cond(5).name = 'mirror';
Data(2).rat(4).cond(5).day(1).name = '2017-10-18';
Data(2).rat(4).cond(5).day(2).name = '2017-10-28';
Data(2).rat(4).cond(5).day(3).name = '2017-10-31';

Data(2).rat(4).cond(6).name = 'famodor';
Data(2).rat(4).cond(6). day(1).name = '2017-10-19';
Data(2).rat(4).cond(6). day(2).name = '2017-10-27';
Data(2).rat(4).cond(6). day(3).name = '2017-11-02';

Data(2).rat(4).cond(7).name = 'hexyl';
Data(2).rat(4).cond(7). day(1).name = '2017-10-22';
Data(2).rat(4).cond(7). day(2).name = '2017-10-29';

% RAT 5 = RAT 316Y
Data(2).rat(5).name = 'rat316';
Data(2).rat(5).cond(1).name = 'empty';
Data(2).rat(5).cond(1).day(2).name = '2020-11-29';

Data(2).rat(5).cond(2).name = 'familiar';
Data(2).rat(5).cond(2).day(1).name = '2020-11-14';
Data(2).rat(5).cond(2).day(2).name = '2020-11-25';
Data(2).rat(5).cond(2).day(3).name = '2020-12-02';

Data(2).rat(5).cond(3).name = 'toy';
Data(2).rat(5).cond(3).day(1).name = '2020-11-12';

Data(2).rat(5).cond(4).name = 'odor';
Data(2).rat(5).cond(4).day(1).name = '2020-11-09';
Data(2).rat(5).cond(4).day(2).name = '2020-11-30';

Data(2).rat(5).cond(5).name = 'mirror';
Data(2).rat(5).cond(5).day(1).name = '2020-11-19';
Data(2).rat(5).cond(5).day(2).name = '2020-12-04';

Data(2).rat(5).cond(6).name = 'famodor';
Data(2).rat(5).cond(6).day(1).name = '2020-11-10';
Data(2).rat(5).cond(6).day(2).name = '2020-12-01';

Data(2).rat(5).cond(7).name = 'hexyl';
Data(2).rat(5).cond(7).day(1).name = '2020-11-13';


%RAT 6 = RAT 328AA
Data(2).rat(6).name = 'rat328';
Data(2).rat(6).cond(1).name = 'empty';
Data(2).rat(6).cond(1).day(1).name = '2021-08-20';
Data(2).rat(6).cond(1).day(2).name = '2021-08-25';
Data(2).rat(6).cond(1).day(3).name = '2021-09-12';

Data(2).rat(6).cond(2).name = 'familiar';
Data(2).rat(6).cond(2).day(1).name = '2021-08-16';
Data(2).rat(6).cond(2).day(2).name = '2021-08-27';
Data(2).rat(6).cond(2).day(3).name = '2021-09-05';
Data(2).rat(6).cond(2).day(4).name = '2021-09-13';

Data(2).rat(6).cond(3).name = 'toy';
Data(2).rat(6).cond(3).day(1).name = '2021-08-16';
Data(2).rat(6).cond(3).day(2).name = '2021-09-04';
Data(2).rat(6).cond(3).day(3).name = '2021-09-14';

Data(2).rat(6).cond(4).name = 'odor';
Data(2).rat(6).cond(4).day(1).name = '2021-09-01';
Data(2).rat(6).cond(4).day(2).name = '2021-09-09';


Data(2).rat(6).cond(5).name = 'mirror';
Data(2).rat(6).cond(5).day(1).name = '2021-08-29';
Data(2).rat(6).cond(5).day(2).name = '2021-09-06';

Data(2).rat(6).cond(6).name = 'famodor';
Data(2).rat(6).cond(6). day(1).name = '2021-08-17';
Data(2).rat(6).cond(6). day(2).name = '2021-08-23';
Data(2).rat(6).cond(6). day(3).name = '2021-08-31';
Data(2).rat(6).cond(6). day(4).name = '2021-09-08';

Data(2).rat(6).cond(7).name = 'hexyl';
Data(2).rat(6).cond(7). day(1).name = '2021-08-19';
Data(2).rat(6).cond(7). day(2).name = '2021-08-26';
Data(2).rat(6).cond(7). day(3).name = '2021-09-02';
Data(2).rat(6).cond(7). day(4).name = '2021-09-10';

% RAT 7 = RAT 330AA
Data(2).rat(7).name = 'rat330';
Data(2).rat(7).cond(1).name = 'empty';
Data(2).rat(7).cond(1).day(1).name = '2021-03-03';
Data(2).rat(7).cond(1).day(2).name = '2021-03-05';
Data(2).rat(7).cond(1).day(3).name = '2021-03-11';
Data(2).rat(7).cond(1).day(4).name = '2021-03-21';

Data(2).rat(7).cond(2).name = 'familiar';
Data(2).rat(7).cond(2).day(1).name = '2021-03-10';
Data(2).rat(7).cond(2).day(2).name = '2021-03-17';

Data(2).rat(7).cond(3).name = 'toy';
Data(2).rat(7).cond(3).day(1).name = '2021-03-12';

Data(2).rat(7).cond(4).name = 'odor';
Data(2).rat(7).cond(4).day(1).name = '2021-03-09';
Data(2).rat(7).cond(4).day(2).name = '2021-03-16';
Data(2).rat(7).cond(4).day(3).name = '2021-03-22';

Data(2).rat(7).cond(5).name = 'mirror';

Data(2).rat(7).cond(6).name = 'famodor';
Data(2).rat(7).cond(6). day(1).name = '2021-03-07';
Data(2).rat(7).cond(6). day(2).name = '2021-03-14';

Data(2).rat(7).cond(7).name = 'hexyl';
Data(2).rat(7).cond(7). day(1).name = '2021-03-06';
Data(2).rat(7).cond(7). day(2).name = '2021-03-13';


%RAT 8 = RAT 394EE
Data(2).rat(8).name =  'rat394';
Data(2).rat(8).cond(1).name = 'empty';
Data(2).rat(8).cond(1).day(1).name = '2022-10-14';

Data(2).rat(8).cond(2).name = 'familiar';
Data(2).rat(8).cond(2).day(1).name = '2022-10-28';

Data(2).rat(8).cond(3).name = 'toy';
Data(2).rat(8).cond(3).day(1).name = '2022-10-16';

Data(2).rat(8).cond(4).name = 'odor';
Data(2).rat(8).cond(4).day(1).name = '2022-10-18'; tracking issues on
this day - deleted

Data(2).rat(8).cond(5).name = 'mirror';

Data(2).rat(8).cond(6).name = 'famodor';
Data(2).rat(8).cond(6). day(1).name = '2022-10-11';
Data(2).rat(8).cond(6). day(2).name = '2022-10-17';
Data(2).rat(8).cond(6). day(3).name = '2022-10-24';

Data(2).rat(8).cond(7).name = 'hexyl';
Data(2).rat(8).cond(7). day(1).name = '2022-10-09';
Data(2).rat(8).cond(7). day(2).name = '2022-10-13';
Data(2).rat(8).cond(7). day(3).name = '2022-10-23';

%RAT 9 = RAT 395EE
Data(2).rat(9).name =  'rat395';
Data(2).rat(9).cond(1).name = 'empty';
Data(2).rat(9).cond(1).day(1).name = '2023-03-09';
Data(2).rat(9).cond(1).day(2).name = '2023-03-16';
Data(2).rat(9).cond(1).day(3).name = '2023-03-26';

Data(2).rat(9).cond(2).name = 'familiar';
Data(2).rat(9).cond(2).day(1).name = '2023-03-22';
Data(2).rat(9).cond(2).day(2).name = '2023-04-06';

Data(2).rat(9).cond(3).name = 'toy';
Data(2).rat(9).cond(3).day(1).name = '2023-03-10';

Data(2).rat(9).cond(4).name = 'odor';
Data(2).rat(9).cond(4).day(1).name = '2023-03-15';
Data(2).rat(9).cond(4).day(2).name = '2023-04-03';
Data(2).rat(9).cond(4).day(3).name = '2023-04-14';

Data(2).rat(9).cond(5).name = 'mirror';
Data(2).rat(9).cond(5).day(1).name = '2023-04-07';

Data(2).rat(9).cond(6).name = 'famodor';
Data(2).rat(9).cond(6). day(1).name = '2023-03-13';
Data(2).rat(9).cond(6). day(2).name = '2023-03-20';
Data(2).rat(9).cond(6). day(3).name = '2023-03-31';
Data(2).rat(9).cond(6). day(4).name = '2023-04-12';

Data(2).rat(9).cond(7).name = 'hexyl';
Data(2).rat(9).cond(7). day(1).name = '2023-03-12';
Data(2).rat(9).cond(7). day(2).name = '2023-03-27';

%  RAT 10 = RAT 445
Data(2).rat(10).name =  'rat445';
Data(2).rat(10).cond(1).name = 'empty';
Data(2).rat(10).cond(1).day(1).name = '2024-04-12';
Data(2).rat(10).cond(1).day(2).name = '2024-04-20';

Data(2).rat(10).cond(2).name = 'familiar';
Data(2).rat(10).cond(2).day(1).name = '2024-04-17';

Data(2).rat(10).cond(3).name = 'toy';
Data(2).rat(10).cond(3).day(1).name = '2024-04-22';

Data(2).rat(10).cond(4).name = 'odor';
Data(2).rat(10).cond(4).day(1).name = '2024-04-15';
Data(2).rat(10).cond(4).day(2).name = '2024-04-27';

Data(2).rat(10).cond(5).name = 'mirror';
Data(2).rat(10).cond(5).day(1).name = 2024-04-21;

Data(2).rat(10).cond(6).name = 'famodor';
Data(2).rat(10).cond(6). day(1).name = '2024-04-19';

Data(2).rat(10).cond(7).name = 'hexyl';
Data(2).rat(10).cond(7). day(1).name = '2024-04-16';

% RAT 11 = RAT 442
Data(2).rat(11).name =  'rat442';
Data(2).rat(11).cond(1).name = 'empty';
Data(2).rat(11).cond(1).day(1).name = '2024-04-26';
Data(2).rat(11).cond(1).day(2).name = '2024-04-27';
Data(2).rat(11).cond(1).day(3).name = '2024-05-04';
Data(2).rat(11).cond(1).day(4).name = '2024-05-16';

Data(2).rat(11).cond(2).name = 'familiar';
Data(2).rat(11).cond(2).day(1).name = '2024-05-10';

Data(2).rat(11).cond(3).name = 'toy';

Data(2).rat(11).cond(4).name = 'odor';
Data(2).rat(11).cond(4).day(1).name = '2024-04-29';
Data(2).rat(11).cond(4).day(2).name = '2024-05-07';
Data(2).rat(11).cond(4).day(3).name = '2024-05-15';

Data(2).rat(11).cond(5).name = 'mirror';

Data(2).rat(11).cond(6).name = 'famodor';
Data(2).rat(11).cond(6). day(1).name = '2024-04-28';
Data(2).rat(11).cond(6). day(2).name = '2024-05-03';
Data(2).rat(11).cond(6). day(3).name = '2024-05-14';

Data(2).rat(11).cond(7).name = 'hexyl';
Data(2).rat(11).cond(7). day(1).name = '2024-05-01';
Data(2).rat(11).cond(7). day(2).name = '2024-05-08';
Data(2).rat(11).cond(7). day(3).name = '2024-05-17';

%% INITIALIZE FOR 3D ROOM RATS FIX
% The coords in the 3d room are flipped relative to the cage location. Initialize which rats were
% run in that room so that the read in coords can be flipped to match the otehr rats in the study.

flipRats = {'rat394', 'rat395', 'rat418', 'rat442'};


%% LOOP THROUGH RATS

numType = [{'WT' 'KO'}];
for t = 1:2 %type meaning genotype
    if t < 2
        rNums = [117 122 165 196 256 326 334 335 391 392 418 416]; %all WT rats
    else
        rNums = [120 124 125 168 316 328 330 394 395 445 442]; %all KO/FXS rats
    end

    for r = 1:length(rNums)
        for c = 1:length(Data(t).rat(r).cond)
            for d = 1:length(Data(t).rat(r).cond(c).day)

                clear CA1tetNums
                clear CA1_2tetNums
                clear CA2tetNums
                clear CA2_3tetNums
                clear CA3tetNums
                clear CA1List
                clear CA1_2List
                clear CA2List
                clear CA2_3List
                clear CA3List

                Data(t).rat(r).cond(c).day(d).region(1).name = 'CA1';
                Data(t).rat(r).cond(c).day(d).region(2).name = 'CA1_2';
                Data(t).rat(r).cond(c).day(d).region(3).name = 'CA2';
                Data(t).rat(r).cond(c).day(d).region(4).name = 'CA2_3';
                Data(t).rat(r).cond(c).day(d).region(5).name = 'CA3';

                %%GET TTs FOR REGIONS AND UNIQUE TTs


                for b = 1:4 %change for number of begin sessions


                    %%  GET COORDS
                    fprintf('\tRun Bout: %d/4\n', b);

                    destDir =([dataDir num2str(numType{t}),'\rat' num2str(rNums(r)),'\',num2str(Data(t).rat(r).cond(c).day(d).name)]);

                    TempDestDir = [destDir ,'\begin', num2str(b)];
                    cd (TempDestDir);
                    coordsFile = dir('*.nvt');
                    keyboard
                    coord = read_in_coords_box(coordsFile(1).name); % NOTE: 'read_in_coords' is now changed so you have to input the width (x) and height (y) of the arena as the 2nd and 3rd arguments
                    if ~isempty(strmatch(Data(t).rat(r).name, flipRats))
                        coord = fix_3d_coords(coord);
                    end %3d room rats, coords need to be flipped
                    Data(t).rat(r).cond(c).day(d).coords{b} = coord;

                    cd (destDir);

                    for rr=1:length(Data(t).rat(r).cond(c).day(d).region) %cycle through region
                        % Check if there is a "region" cellList for each regions (CA1,
                        % CA2, CA3), if there is then save the TTList and pull out the
                        % unique TTs for LFP later

                        if exist ([(Data(t).rat(r).cond(c).day(d).region(rr).name),'.txt']) ==2 %#ok<EXIST>

                            fid=fopen ([num2str(Data(t).rat(r).cond(c).day(d).region(rr).name),'.txt']);
                            TTList = textscan(fid,'%s', 'delimiter','\n');
                            fclose(fid);

                            for tt = 1:length(TTList{1})
                                unitLine = char(TTList{1}(tt));
                                if unitLine(4) == '_'
                                    tetNums(tt) = str2double(unitLine(3)); %#ok
                                else
                                    tetNums(tt) = str2double(unitLine(3:4));%#ok
                                end
                            end
                            Data(t).rat(r).cond(c).day(d).region(rr).TT = TTList{1,1};

                            TTtetNums = unique(tetNums);
                            tetNums=[];

                            cd(TempDestDir);

                            %% GET LFPs AND LOAD IN EEG


                            for tt = 1:length(TTtetNums)
                                lfpFn = ['CSC' num2str(TTtetNums(tt)) '.ncs'];
                                CSC_name=['CSC' num2str(TTtetNums(tt))];

                                Data(t).rat(r).cond(c).day(d).region(rr).bout(b).eegFns{tt} = lfpFn;

                                %Extract EEG
                                [samples,tsi,ts]=loadEeg8(lfpFn);
                                eeg.(CSC_name).data = samples;
                                eeg.(CSC_name).ts=ts;

                                %Apply relevant filters to EEG
                                samples=eeg.(CSC_name).data;
                                samples_t = fftbandpass(samples,2000,5,6,11,12)';
                                samples_sg = fftbandpass(samples,2000,20,25,55,60)';
                                samples_fg = fftbandpass(samples,2000,60,65,100,105)';
                                eeg.(CSC_name).data_t=samples_t;
                                eeg.(CSC_name).data_sg=samples_sg;
                                eeg.(CSC_name).data_fg=samples_fg;
                                %             eeg.fn {:,tt} = eeg_output.fn

                            end
                            %Save the EEG within the relevent 'begin' folder, and save a
                            %pointer to the location in the struct
                            try
                                save_at=[dataDir num2str(numType{t}),'\Rat' num2str(rNums(r)),'\',num2str(Data(t).rat(r).cond(c).day(d).name),'\begin',num2str(b)];
                                savefile = strcat(save_at,'\eeg');
                                save(savefile,'eeg');
                                Data(t).rat(r).cond(c).day(d).eegLoc{b} = (savefile);
                            catch;keyboard;
                            end

                            %% GET UNITS

                            tCntr=1;
                            for tt=1:length(TTList{1})
                                tFile=TTList{1}{tt};
                                if isempty(~strfind(tFile, '64'))
                                    try
                                        [spkTms] = loadSpikes_ajm(tFile);
                                        readCheck = 1;
                                    catch
                                        readCheck = 0;
                                    end

                                else
                                    spkTms = Readtfile(tFile, 'uint64');
                                    spkTms = spkTms / 10000;
                                end %some cells were cut with updated MClust and saved as .t64, as required by new neuralynx system

                                if readCheck == 1;
                                    %
                                    Data(t).rat(r).cond(c).day(d).region(rr).bout(b).pc(tCntr).ID = tFile;
                                    Data(t).rat(r).cond(c).day(d).region(rr).bout(b).pc(tCntr).spkTms = spkTms;
                                    %
                                    tCntr = tCntr + 1;
                                end
                            end


                            cd ..

                        end %if region exist

                    end%region

                end%begin




            end%day loop
            clear eeg


        end%condition loop
    end%rat loop
end%genotype loop

end %function


