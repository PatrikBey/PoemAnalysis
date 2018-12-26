function[poem] = PoemWords(a)
%%%%%%%%%%%%
%
% Poem analysis function
%
% author: Bey, Patrik; beypatri@gmail.com
%
%
%%%%%%%%%%%%

dim = size(a);

% initialize cell array containing word information
p = cell(1,4);
% initialize interim index
imterim(1) = 0;

for l = 1:dim(1)-1

	% split resepctive line of poem into seperate strings
	temp = strsplit(a{l+1});
	% define number of words in line
	[row,words] = size(temp);

	%interim word index
	interim(l+1) = words;

	for w = 1:words

		% defining word in output array
		p{sum(interim(1:l))+w,1} = temp{w};
		% defining title of poem
		p{sum(interim(1:l))+w,2} = str2double(a{1});
		%defining of line within poem
		p{sum(interim(1:l))+w,3} = l;
		%defining position of word within line
		p{sum(interim(1:l))+w,4} = w;
	end
end

poem = p;
