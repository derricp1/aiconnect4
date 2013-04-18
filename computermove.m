%Patrick D'Errico
%Coded for CSC 380, AI.
%This function allows the CPU to make a move. Mostly provided for us.

function computermove()
%COMPUTERMOVE This is where you make the computer move
%   Set the board position.  Make sure the computer gets a value of "2" in
%   the board
global board;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Please Read: For any of the methods below that return column, 
%col must be found by col = column{1,2}.
%Comment this line out if not required.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%col = reflex(board, 2); %reflex rule - fast, but poor playing
%column = connecttest(board, 2); %minimax with no optimization - too slow to work in a reasonable amount of time
%column = alphabeta(board, 2, -999, 999); %minimax with alphabeta - faster, but still too slow to work in a reasonable amount of time
column = depthlimited(board, 2, -999, 999, 1); %minimax with alphabeta and depth limiting - best solution

%Needed to run any but the reflex, as they return cells. Comment out if on
%reflex mode.
col = column{1,2};

row = location(board, col); %gets the proper row from column data

board(row, col) = 2; %places the move

%Prior win checking algorithms. Left for reference.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Code to check for a winner... will return winner 1 or 2 or
%%%%%%%%%% 0 if no win, 3 if tie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	function [w,ind] = check4win(b)

		[w,ind]=checkplayer(b,1);
		if w==0,[w,ind]=checkplayer(b,2); end
		if isempty(find(b==0)) & w==0,w=3; end

	end

	function [w,ind]=checkplayer(board,player)

		[r,c]=find(board==player);
		horz_step=[-1 0 1 1 1 0 -1 -1];
		vert_step=[1 1 1 0 -1 -1 -1 0];
		w=0;
		ind=[];
		for j=1:length(r),
			for k=1:8,
				if r(j)-3*vert_step(k)>0 & r(j)-3*vert_step(k)<=size(board,1) & c(j)+3*horz_step(k)>0 & c(j)+3*horz_step(k)<=size(board,2),
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
	
end
