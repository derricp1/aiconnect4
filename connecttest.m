%Patrick D'Errico
%Coded for CSC 380, AI.
%This function performs a minimax check to determine an optimal Connect 4 move

function results = connecttest(inmat, inplayer)
	
    %returns score, column

	data = [];
	score = check4win(inmat); %Check the state of this board position
	
	if score == 9 %Has the postion been determined?
	
		if inmat(1,1) == 0 %Is this column a valid move?
			temp = inmat;
			i = 6;
            while i > 0 %Find the location a piece would be moved to 
                if inmat(i,1) == 0
					temp(i,1) = inplayer;
					i = 0;
                end
                i = i - 1;
            end
			
            score = check4win(temp); %Check the state of this board position
            if score ~= 9
                data(1) = score; %Return the score of this position if it is determined
            else
                x = int8(inplayer+1);
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = connecttest(temp, q); %Else recur
                data(1) = s{1,1};
            end
			
		else
			data(1) = 999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,2) == 0 %Is this column a valid move?
			temp = inmat;
			i = 6;
			while i > 0 %Find the location a piece would be moved to
                if inmat(i,2) == 0
					temp(i,2) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end

            score = check4win(temp); %Check the state of this board position
            if score ~= 9
                data(2) = score; %Return the score of this position if it is determined
            else			
                x = int8(inplayer+1);
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = connecttest(temp, q); %Else recur
                data(2) = s{1,1};
            end
			
		else
			data(2) = 999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,3) == 0 %Is this column a valid move?
			temp = inmat;
			i = 6;
			while i > 0 %Find the location a piece would be moved to
                if inmat(i,3) == 0
					temp(i,3) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end

            score = check4win(temp); %Check the state of this board position
            if score ~= 9
                data(3) = score;  %Return the score of this position if it is determined
            else
                x = int8(inplayer+1);
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = connecttest(temp, q); %Else recur
                data(3) = s{1,1};
            end
			
		else
			data(3) = 999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,4) == 0 %Is this column a valid move?
			temp = inmat;
			i = 6;
			while i > 0 %Find the location a piece would be moved to
                if inmat(i,4) == 0
					temp(i,4) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end

            score = check4win(temp); %Check the state of this board position
            if score ~= 9
                data(4) = score;  %Return the score of this position if it is determined
            else			
                x = int8(inplayer+1);
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = connecttest(temp, q); %Else recur
                data(4) = s{1,1};
            end
			
		else
			data(4) = 999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,5) == 0 %Is this column a valid move?
			temp = inmat;
			i = 6;
			while i > 0 %Find the location a piece would be moved to
                if inmat(i,5) == 0
					temp(i,5) = inplayer;
					i = 0;
                end
                i = i - 1;                
            end

            score = check4win(temp); %Check the state of this board position
            if score ~= 9
                data(5) = score;  %Return the score of this position if it is determined
            else
                x = int8(inplayer+1);
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = connecttest(temp, q); %Else recur
                data(5) = s{1,1};
            end
			
		else
			data(5) = 999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,6) == 0 %Is this column a valid move?
			temp = inmat;
			i = 6;
			while i > 0 %Find the location a piece would be moved to
                if inmat(i,6) == 0
					temp(i,6) = inplayer;
					i = 0;
                end
                i = i - 1;                
            end
            
            score = check4win(temp); %Check the state of this board position
            if score ~= 9
                data(6) = score; %Return the score of this position if it is determined
            else			
                x = int8(inplayer+1);
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = connecttest(temp, q); %Else recur
                data(6) = s{1,1};
            end
			
		else
			data(6) = 999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,7) == 0 %Is this column a valid move?
			temp = inmat;
			i = 6;
			while i > 0 %Find the location a piece would be moved to
                if inmat(i,7) == 0
					temp(i,7) = inplayer;
					i = 0;
                end
                i = i - 1;                
            end
            
            score = check4win(temp); %Check the state of this board position
            if score ~= 9  %Return the score of this position if it is determined
                data(7) = score;
            else            
                x = int8(inplayer+1); 
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = connecttest(temp, q); %Else recur
                data(7) = s{1,1};
            end
			
		else
			data(7) = 999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inplayer == 1 %change the illegal value scores to values that will never be picked
			for q=1:7
				if data(q) == 999
					data(q) = -999;
				end
			end
			[s, c] = max(data); %find best scoring branch if needed
		else
			[s, c] = min(data); %else find worst scoring branch
		end
		results = {s c};
		%get the max or min of the availible moves
		
    else
        results = {score 0}; %return this element's score
	end
	
end
	%checks for whether a player has won given a board state or there is a tie. Translates this value to appropriate scores for the algorithm
	function [w,ind] = check4win(b)

		[w,ind]=checkplayer(b,1);
		if w==0,[w,ind]=checkplayer(b,2); end
		if isempty(find(b==0)) && w==0,w=3; end
        
         switch w
			case 1
				w = 1;
			case 2
				w = -1;
            case 0
                w = 9;
			case 3
				w = 0;
                
         end

	end
	%checks the board for a combination of 4 chips in a row - provided for us
	function [w,ind]=checkplayer(board,player)

		[r,c]=find(board==player);
		horz_step=[-1 0 1 1 1 0 -1 -1];
		vert_step=[1 1 1 0 -1 -1 -1 0];
		w=0;
		ind=[];
		for j=1:length(r),
			for k=1:8,
				if r(j)-3*vert_step(k)>0 && r(j)-3*vert_step(k)<=size(board,1) && c(j)+3*horz_step(k)>0 && c(j)+3*horz_step(k)<=size(board,2),
					if vert_step(k)~=0,
						checkrows=r(j):-vert_step(k):r(j)-3*vert_step(k);
					else
						checkrows=r(j).*ones(1,4);
					end
					if horz_step(k)~=0,
						checkcols=c(j):horz_step(k):c(j)+3*horz_step(k);
					else
						checkcols=c(j).*ones(1,4);
					end
					for m=1:4,
						group(m)=board(checkrows(m),checkcols(m));
					end
					if sum(abs(group-player))==0,
						ind=[checkrows;checkcols];
						w=player;
						return
					end
				end
			end
		end
	end