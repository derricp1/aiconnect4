%Patrick D'Errico
%Coded for CSC 380, AI.
%This function performs a reflex decision to determine a move in
%connect 4. It is used for comparison purposes and plays poorly.

function result = reflex(inmat, inplayer)

	result = 0; %which column to move in
	options = [9 9 9 9 9 9 9];
	
	for i=1:7 %populate the array of where each column's move would be, or a 9 if the move is invalid
		if inmat(1,i) == 0
			j = 6;
            while j > 0
                if inmat(j,i) == 0
					options(i) = j;
					j = 0;
                end
                j = j - 1;
            end
		end
	end
	
	for i=1:7 %Drop on a column if there is 3 in a row near there
		if options(i) < 4
			if (inmat(options(i)+1,i) == inmat(options(i)+2,i)) && (inmat(options(i)+1,i) == inmat(options(i)+3,i)) && inmat(options(i)+1,i) ~=0
				result = i;
				if inmat(options(i)+1,i) == inplayer
					return;
				end
			end
		end
	end
	
	for i=1:7 %Drop on a column if there is 3 in a row including there - prioritizes winning over blocking
		if options(i) ~= 9
			if i < 5 %check 3 to the right
				if (inmat(options(i),i+1) == inmat(options(i),i+2)) && (inmat(options(i),i+1) == inmat(options(i),i+3)) && inmat(options(i),i+1) ~= 0
					result = i;
					if inmat(options(i),i+1) == inplayer
						return;
					end
				end
			end
			
			if i > 1 && i < 6 %check 2 to the right and 1 to the left
				if (inmat(options(i),i-1) == inmat(options(i),i+1)) && (inmat(options(i),i-1) == inmat(options(i),i+2)) && inmat(options(i),i+1) ~= 0
					result = i;
					if inmat(options(i),i+1) == inplayer
						return;
					end
				end
			end
			
			if i > 2 && i < 7 %check 1 to the right and 2 to the left
				if (inmat(options(i),i-2) == inmat(options(i),i-1)) && (inmat(options(i),i-1) == inmat(options(i),i+1)) && inmat(options(i),i+1) ~= 0
					result = i;
					if inmat(options(i),i+1) == inplayer
						return;
					end
				end
			end
			
			if i > 3 %check 3 to the left
				if (inmat(options(i),i-1) == inmat(options(i),i-2)) && (inmat(options(i),i-1) == inmat(options(i),i-3)) && inmat(options(i),i-1) ~= 0
					result = i;
					if inmat(options(i),i+1) == inplayer
						return;
					end
				end
			end
			
		end
	end	

	if result == 0
		while result == 0 || options(result) == 9
			result = floor(rand*7) + 1;
		end
	end


end