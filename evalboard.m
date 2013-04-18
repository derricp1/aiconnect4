%Patrick D'Errico
%Coded for CSC 380, AI.
%This function is used by the depth limited minimax to derive a socre for an unfinished
%board at the depth limit. It is determined by the value of the unblocked combos
%the first player has. Adapted from provided code.

function score = evalboard(board)

		score = 0; %the subscore to return
		[r,c]=find(board==1); %only checks player 1 - the min wants a minimum player score, the max wants to maximize its score
		horz_step=[-1 0 1 1 1 0 -1 -1];
		vert_step=[1 1 1 0 -1 -1 -1 0];
		w=0;
		ind=[];
		for j=1:length(r), %for every of player 1's pieces, if there are 3 availible spots in every direction, check the group
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
					for m=1:4, %in this group of 4 spots, find each piece
						group(m)=board(checkrows(m),checkcols(m));
                    end
                    
                    %Makes sure there are no 2s. If there are, this combination is blocked from player 1
                    mat = size(find(group==2));
                    
                    if mat(2) == 0 %if no 2s, count the number of 1s.
						count = 0;
						for q=1:4
							if group(q) == 1
								count = count + 1;
							end
                        end
                        switch count %score 1 point for 1 in a row, 10 for 2 in a row, and 100 for 3 in a row, each unblocked
							case 1
								score = min(10000,(score + 1));
							case 2
								score = min(10000,(score + 10));
							case 3
								score = min(10000,(score + 100));
							case 4 %if we win, this take priority.
								score = 10000;
								
                        end
                    end
				end
			end
		end
		
end