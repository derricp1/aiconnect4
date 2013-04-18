%Patrick D'Errico
%Coded for CSC 380, AI.
%This function is a copy of the provided checking code to see if a state is a win,
%loss, tie, or incomplete game. It is explained in other functions in which it occurs.

function [w,ind] = wincheck(b)

		[w,ind]=checkplayer(b,1);
		if w==0,[w,ind]=checkplayer(b,2); end
		if isempty(find(b==0)) && w==0,w=3; end

	end

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

