%%%%%%%%%%%%
%
% Poem analysis script
% author: Bey, Patrik; beypatri@gmail.com
%
%%%%%%%%%%%%

% adjust poem filename
	Name = 'poem_1.txt';

%  load poem via:
	a = textread(Name,'%s','delimiter','\n');

% perform analysis with given function
	p_analysis = PoemWords(a);

% save as tab seperated .txt file

P = cell2table(p_analysis,'VariableNames',{'Word','Poem','Line','Position'});
writetable(P,[Name(1:end-4) '_analysis.txt'],'Delimiter','\t')