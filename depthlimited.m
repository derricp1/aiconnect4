%Patrick D'Errico
%Coded for CSC 380, AI.
%This function performs a depth-limited alpha-beta minimax to determine
%a good move to select for a game of Connect 4.

function results = depthlimited(inmat, inplayer, alpha, beta, depth)
	
    %returns score, column
	%input should be inmat inplayer -99999 99999 1 (for the first one)
	data = []; %the current score for each possible move
	score = check4win(inmat); %sees if a win state
    maxdepth = 5;
    %maxmium depth of a node in the tree - should be greater than 2
    %(initial state is depth 1).
	
	if score == 9 && depth <= maxdepth %look for a move if game has not ended (score == 9) and we are allowed to delve further (via maxdepth)
	
		if inmat(1,1) == 0 %check this column for valid move
			temp = inmat;
			i = 6;
			while i > 0 %look for the place a dropped tile would go and save it
                if inmat(i,1) == 0
					temp(i,1) = inplayer;
					i = 0;
                end
                i = i - 1;
			end
			
            score = check4win(temp); %does this move end the game?
            if score ~= 9
                data(1) = score*10000; %if so, save the score of the state
            else %else DFS one layer down
                x = int8(inplayer+1);
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = depthlimited(temp, q, alpha, beta, (depth+1));
                data(1) = s{1,1}; %save this move's score
            end
			
			if inplayer == 1 %if looking for a max, check if score is greater or equal to than beta, if so, prune
				if data(1) >= beta
					results = {data(1), 1};
					return;
                else %otherwise alpha is now the max of alpha and this column's score
					alpha = max(alpha,data(1));
				end
			else
				if data(1) <= alpha %if looking for a max, check if score is less than or equal to alpha, if so, prune
					results = {data(1), 1};
					return;
                else %otherwise beta is now the min of beta and this column's score
					beta = min(beta,data(1));
				end			
			end
			
		else
			data(1) = 99999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,2) == 0 %check this column for valid move
			temp = inmat;
			i = 6;
			while i > 0 %look for the place a dropped tile would go and save it
                if inmat(i,2) == 0
					temp(i,2) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end
			
            score = check4win(temp); %does this move end the game?
            if score ~= 9
                data(2) = score*10000;
            else %else DFS one layer down			
                x = int8(inplayer+1);
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = depthlimited(temp, q, alpha, beta, (depth+1));
                data(2) = s{1,1}; %save this move's score
            end
			
			if inplayer == 1 %if looking for a max, check if score is greater or equal to than beta, if so, prune
				if data(2) >= beta
					results = {data(2), 2};
					return;
				else
					alpha = max(alpha,data(2)); %otherwise alpha is now the max of alpha and this column's score
				end
			else
				if data(2) <= alpha %if looking for a max, check if score is less than or equal to alpha, if so, prune
					results = {data(2), 2};
					return;
				else %otherwise beta is now the min of beta and this column's score
					beta = min(beta,data(2));
				end			
			end
			
		else
			data(2) = 99999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,3) == 0
			temp = inmat;
			i = 6;
			while i > 0 %look for the place a dropped tile would go and save it
                if inmat(i,3) == 0
					temp(i,3) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end
			
            score = check4win(temp); %does this move end the game?
            if score ~= 9
                data(3) = score*10000;
            else %else DFS one layer down
                x = int8(inplayer+1);
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = depthlimited(temp, q, alpha, beta, (depth+1));
                data(3) = s{1,1}; %save this move's score
            end
			
			if inplayer == 1 %if looking for a max, check if score is greater or equal to than beta, if so, prune
				if data(3) >= beta
					results = {data(3), 3};
					return;
				else
					alpha = max(alpha,data(3)); %otherwise alpha is now the max of alpha and this column's score
				end
			else
				if data(3) <= alpha %if looking for a max, check if score is less than or equal to alpha, if so, prune
					results = {data(3), 3};
					return;
				else %otherwise beta is now the min of beta and this column's score
					beta = min(beta,data(3));
				end			
			end
			
		else
			data(3) = 99999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,4) == 0
			temp = inmat;
			i = 6;
			while i > 0 %look for the place a dropped tile would go and save it
                if inmat(i,4) == 0
					temp(i,4) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end
			
            score = check4win(temp); %does this move end the game?
            if score ~= 9
                data(4) = score*10000;
            else %else DFS one layer down			
                x = int8(inplayer+1);
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = depthlimited(temp, q, alpha, beta, (depth+1));
                data(4) = s{1,1}; %save this move's score
            end
			
			if inplayer == 1 %if looking for a max, check if score is greater or equal to than beta, if so, prune
				if data(4) >= beta
					results = {data(4), 4};
					return;
				else %otherwise beta is now the min of beta and this column's score
					alpha = max(alpha,data(4)); %otherwise alpha is now the max of alpha and this column's score
				end
			else
				if data(4) <= alpha %if looking for a max, check if score is less than or equal to alpha, if so, prune
					results = {data(4), 4};
					return;
				else
					beta = min(beta,data(4));
				end			
			end
			
		else
			data(4) = 99999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,5) == 0
			temp = inmat;
			i = 6;
			while i > 0 %look for the place a dropped tile would go and save it
                if inmat(i,5) == 0
					temp(i,5) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end
			
            score = check4win(temp); %does this move end the game?
            if score ~= 9
                data(5) = score*10000;
            else %else DFS one layer down
                x = int8(inplayer+1);
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = depthlimited(temp, q, alpha, beta, (depth+1));
                data(5) = s{1,1}; %save this move's score
            end
			
			if inplayer == 1 %if looking for a max, check if score is greater or equal to than beta, if so, prune
				if data(5) >= beta
					results = {data(5), 5};
					return;
				else %otherwise beta is now the min of beta and this column's score
					alpha = max(alpha,data(5)); %otherwise alpha is now the max of alpha and this column's score
				end
			else
				if data(5) <= alpha %if looking for a max, check if score is less than or equal to alpha, if so, prune
					results = {data(5), 5};
					return;
				else
					beta = min(beta,data(5));
				end			
			end
			
		else
			data(5) = 99999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,6) == 0
			temp = inmat;
			i = 6;
			while i > 0 %look for the place a dropped tile would go and save it
                if inmat(i,6) == 0
					temp(i,6) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end
			
            score = check4win(temp); %does this move end the game?
            if score ~= 9
                data(6) = score*10000;
            else %else DFS one layer down			
                x = int8(inplayer+1);
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = depthlimited(temp, q, alpha, beta, (depth+1));
                data(6) = s{1,1}; %save this move's score
            end
			
			if inplayer == 1 %if looking for a max, check if score is greater or equal to than beta, if so, prune
				if data(6) >= beta
					results = {data(6), 6};
					return;
				else
					alpha = max(alpha,data(6)); %otherwise alpha is now the max of alpha and this column's score
				end
			else
				if data(6) <= alpha %if looking for a max, check if score is less than or equal to alpha, if so, prune
					results = {data(6), 6};
					return;
				else %otherwise beta is now the min of beta and this column's score
					beta = min(beta,data(6));
				end			
			end
			
		else
			data(6) = 99999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inmat(1,7) == 0
			temp = inmat;
			i = 6;
			while i > 0 %look for the place a dropped tile would go and save it
                if inmat(i,7) == 0
					temp(i,7) = inplayer;
					i = 0;
                end
                i = i - 1;                
			end
			
            score = check4win(temp); %does this move end the game?
            if score ~= 9
                data(7) = score*10000;
            else %else DFS one layer down           
                x = int8(inplayer+1);
                y = int8(2);
                q = double((2 - mod(x,y)));

                s = depthlimited(temp, q, alpha, beta, (depth+1));
                data(7) = s{1,1}; %save this move's score
            end
			
			if inplayer == 1 %if looking for a max, check if score is greater or equal to than beta, if so, prune
				if data(7) >= beta
					results = {data(7), 7};
					return;
				else
					alpha = max(alpha,data(7)); %otherwise alpha is now the max of alpha and this column's score
				end
			else
				if data(7) <= alpha %if looking for a max, check if score is less than or equal to alpha, if so, prune
					results = {data(7), 7};
					return;
				else %otherwise beta is now the min of beta and this column's score
					beta = min(beta,data(7));
				end			
			end
			
		else
			data(7) = 99999; %illegal move is given a special weight which is switched so that a player would never pick it (see later)
		end
		
		if inplayer == 1 %change illegal values to the worst possible - lowest for min, highest for max
			for q=1:7
				if data(q) == 99999
					data(q) = -99999;
				end
			end
			[s, c] = max(data); %if max, get the highest scoring move
		else
			[s, c] = min(data); %else get the lowest scoring
		end
		results = {s c};
		%get the max or min of the availible moves
		
    else
	
		if score ~= 9 %if a finsishing state has been reached, evaluate it in terms of values for the minimax
			switch score
				case 1
					score = 10000;
				case -1
					score = -10000;
				case 0
					score = 0;
					
			end
		else
			score = evalboard(inmat); %get the estimated value of this position
		end
        results = {score 0};
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