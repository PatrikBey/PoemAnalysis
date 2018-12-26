function[text] = text_analysis()

%%%%%%%%%%%% 
%
% Longer Text analysis function for word distributions
% author: Bey, Patrik; beypatri@gmail.com
%
%%%%%%%%%%%%



%Load data
[datafile,Path,Filter] = uigetfile({'*.txt'}, 'Select file(s)', 'MultiSelect', 'on');	% .txt file containing the text

% loop over all files
% check if more than one file selected
if iscell(datafile)
	numFiles = length(datafile);
else
	numFiles = 1;
end


for f = 1:numFiles

%  load text file via:
	if numFiles <2 
		a = textread([Path '\' datafile] ,'%s','delimiter','\t');
		Title = datafile(1:length(datafile)-4)
	else 
		a = textread([Path '\' datafile{f}] ,'%s','delimiter','\t');
		Title = datafile{f}(1:length(datafile{f})-4)
	end

	for r = 1:length(a)
		temp =strsplit(a{r,:});
		nwords(r) = length(temp);

		%initialize sentence number
		s = 1;
		
		for w = 1:nwords(r)

			% check for sentence endíng via '.', '!', '?'
			if isempty(findstr('.',temp{w})) && isempty(findstr('!',temp{w}))  && isempty(findstr('?',temp{w}))
				s = s;
			else
				s = s + 1;
			end


			% defining word in output array
			T{w,1} = temp(w);
			% define text file
			T{w,2} = Title;
			% defining paragraph
			T{w,3} = r;
			%  define sentence
			T{w,4} = s;
			%define position in paragraph
			T{w,5} = w;
		end


		% combine output cell arrays
		if r == 1
			Out = T;
		else
			Out = [Out; T];
		end

		clear s
		clear T

	end

% save as tab seperated .txt file

% convert the resulting cell array into a table
	P = cell2table(Out,'VariableNames',{'Word','Text','Paragraph','Satz_im_Paragraph','Position_im_Satz'});
% save the results in a .txt file 
	writetable(P,[Path '\' Title '_analysis.txt'],'Delimiter','\t');

% clear variables
	clear P
	clear Out

% end loop for all files
end
%text = P;

