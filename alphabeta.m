%Patrick D'Errico
%Coded for CSC 380, AI.
%This function performs an alpha-beta minimax to determine
%a good move to select for a game of Connect 4.

function results = alphabeta(inmat, inplayer, alpha, beta)
	
    %returns score, column
	%input should be inmat inplayer -999 999
	data = [];
	score = check4win(inmat);
	
	if score == 9 %look for a move if game has not ended (score == 9)
	
		if inmat(1,1) == 0 %check top of this column for valid move
			temp = inmat;
			i = 6;
			while i > 0 %search for where the deepest empty spot is
                if inmat(i,1) == 0
					temp(i,1) = inplayer;
					i = 0;
                end
                i = i - 1;
			end
			
            score = check4win(temp); %has this move ended the game?
            if score ~= 9 %if so return -1 for a loss, 0 for a tie, and 1 for a win
                data(1) = score;
            else
                x = int8(inplayer+1); %otherwise recur one level deeper
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = alphabeta(temp, q, alpha, beta);
                data(1) = s{1,1};
            end
			
			if inplayer == 1
				if data(1) >= beta %if looking at player 1 and the data is greater than the current minimum, prune
					results = {data(1), 1};
					return;
				else
					alpha = max(alpha,data(1)); %else update alpha
				end
			else
				if data(1) <= alpha
					results = {data(1), 1};
					return;
				else
					beta = min(beta,data(1)); %else update beta
				end			
			end
			
		else
			data(1) = 999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,2) == 0 %check top of this column for valid move
			temp = inmat;
			i = 6;
			while i > 0 %search for where the deepest empty spot is
                if inmat(i,2) == 0
					temp(i,2) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end
			
            score = check4win(temp); %has this move ended the game?
            if score ~= 9 %if so return -1 for a loss, 0 for a tie, and 1 for a win
                data(2) = score;
            else			
                x = int8(inplayer+1); %otherwise recur one level deeper
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = alphabeta(temp, q, alpha, beta);
                data(2) = s{1,1};
            end
			
			if inplayer == 1
				if data(2) >= beta %if looking at player 1 and the data is greater than the current minimum, prune
					results = {data(2), 2};
					return;
				else
					alpha = max(alpha,data(2)); %else update alpha
				end
			else
				if data(2) <= alpha
					results = {data(2), 2};
					return;
				else
					beta = min(beta,data(2)); %else update beta
				end			
			end
			
		else
			data(2) = 999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,3) == 0 %check top of this column for valid move
			temp = inmat;
			i = 6;
			while i > 0 %search for where the deepest empty spot is
                if inmat(i,3) == 0
					temp(i,3) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end
			
            score = check4win(temp); %has this move ended the game?
            if score ~= 9 %if so return -1 for a loss, 0 for a tie, and 1 for a win
                data(3) = score;
            else
                x = int8(inplayer+1); %otherwise recur one level deeper
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = alphabeta(temp, q, alpha, beta);
                data(3) = s{1,1};
            end
			
			if inplayer == 1
				if data(3) >= beta %if looking at player 1 and the data is greater than the current minimum, prune
					results = {data(3), 3};
					return;
				else
					alpha = max(alpha,data(3)); %else update alpha
				end
			else
				if data(3) <= alpha
					results = {data(3), 3};
					return;
				else
					beta = min(beta,data(3)); %else update beta
				end			
			end
			
		else
			data(3) = 999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,4) == 0 %check top of this column for valid move
			temp = inmat;
			i = 6;
			while i > 0 %search for where the deepest empty spot is
                if inmat(i,4) == 0
					temp(i,4) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end
			
            score = check4win(temp); %has this move ended the game?
            if score ~= 9 %if so return -1 for a loss, 0 for a tie, and 1 for a win
                data(4) = score;
            else			
                x = int8(inplayer+1); %otherwise recur one level deeper
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = alphabeta(temp, q, alpha, beta);
                data(4) = s{1,1};
            end
			
			if inplayer == 1
				if data(4) >= beta %if looking at player 1 and the data is greater than the current minimum, prune
					results = {data(4), 4};
					return;
				else
					alpha = max(alpha,data(4)); %else update alpha
				end
			else
				if data(4) <= alpha
					results = {data(4), 4};
					return;
				else
					beta = min(beta,data(4)); %else update beta
				end			
			end
			
		else
			data(4) = 999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,5) == 0 %check top of this column for valid move
			temp = inmat;
			i = 6;
			while i > 0 %search for where the deepest empty spot is
                if inmat(i,5) == 0
					temp(i,5) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end
			
            score = check4win(temp); %has this move ended the game?
            if score ~= 9 %if so return -1 for a loss, 0 for a tie, and 1 for a win
                data(5) = score;
            else
                x = int8(inplayer+1); %otherwise recur one level deeper
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = alphabeta(temp, q, alpha, beta);
                data(5) = s{1,1};
            end
			
			if inplayer == 1
				if data(5) >= beta %if looking at player 1 and the data is greater than the current minimum, prune
					results = {data(5), 5};
					return;
				else
					alpha = max(alpha,data(5)); %else update alpha
				end
			else
				if data(5) <= alpha
					results = {data(5), 5};
					return;
				else
					beta = min(beta,data(5)); %else update beta
				end			
			end
			
		else
			data(5) = 999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,6) == 0 %check top of this column for valid move
			temp = inmat;
			i = 6;
			while i > 0 %search for where the deepest empty spot is
                if inmat(i,6) == 0
					temp(i,6) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end
			
            score = check4win(temp); %has this move ended the game?
            if score ~= 9 %if so return -1 for a loss, 0 for a tie, and 1 for a win
                data(6) = score;
            else			
                x = int8(inplayer+1); %otherwise recur one level deeper
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = alphabeta(temp, q, alpha, beta);
                data(6) = s{1,1};
            end
			
			if inplayer == 1
				if data(6) >= beta %if looking at player 1 and the data is greater than the current minimum, prune
					results = {data(6), 6};
					return;
				else
					alpha = max(alpha,data(6)); %else update alpha
				end
			else
				if data(6) <= alpha
					results = {data(6), 6};
					return;
				else
					beta = min(beta,data(6)); %else update beta
				end			
			end
			
		else
			data(6) = 999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,7) == 0 %check top of this column for valid move
			temp = inmat;
			i = 6;
			while i > 0 %search for where the deepest empty spot is
                if inmat(i,7) == 0
					temp(i,7) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end
			
            score = check4win(temp); %has this move ended the game?
            if score ~= 9 %if so return -1 for a loss, 0 for a tie, and 1 for a win
                data(7) = score;
            else            
                x = int8(inplayer+1); %otherwise recur one level deeper
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = alphabeta(temp, q, alpha, beta);
                data(7) = s{1,1};
            end
			
			if inplayer == 1
				if data(7) >= beta %if looking at player 1 and the data is greater than the current minimum, prune
					results = {data(7), 7};
					return;
				else
					alpha = max(alpha,data(7)); %else update alpha
				end
			else
				if data(7) <= alpha
					results = {data(7), 7};
					return;
				else
					beta = min(beta,data(7)); %else update beta
				end			
			end
			
		else
			data(7) = 999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inplayer == 1 %set the illegal move weight to a value min or max would never pick
			for q=1:7
				if data(q) == 999
					data(q) = -999;
				end
			end
			[s, c] = max(data); %if we want max, find the highest scoring move
		else
			[s, c] = min(data); %else find the lowest scoring
		end
		results = {s c};
		%get the max or min of the availible moves
		
    else
        results = {score 0}; %return the score for this state
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