%Patrick D'Errico
%Coded for CSC 380, AI.
%This function takes a board state and a column and reutrns the row the
%move would correspond to.

function loc = location(inmat, incol) %gets the column of a row result given by a move picking function
	j = 6;
	while j > 0 %check each row, moving up, to see the first available one
		if inmat(j,incol) == 0
			loc = j; %return the row, exit the loop
			j = 0;
		end
		j = j - 1;
	end
end