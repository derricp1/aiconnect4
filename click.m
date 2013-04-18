%Patrick D'Errico
%Coded for CSC 380, AI.
%This function lets us click on an area to make a move in that area, in which
%AI moves after. Mostly provided for us, adjusted code is noted.

function [ output_args ] = click(src,evt)

global ax;
global board;
global whoseturn;

point=get(ax,'currentpoint');
point=point(1,1:2);
[r,c]=size(board);

winner = wincheck(board);

    if winner == 0 && point(1)>0 & point(1)<c & point(2)>0 & point(2)<r, %Will only allow click input if the game is still going
        point=floor(point)+1;
        whoseturn=1;
        if board(1,point(1))~=0
            result=0;
            return
        end

        %Find where to put the next piece

        for j=1:size(board,1),
            if board(j,point(1))~=0
                j=j-1; 
                break;
            end
        end
        board(j,point(1))=whoseturn;
        %addpeice_noanim;
        addpeice;
        
        disp('My turn.');
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%% You have made your move %%%%%%
        %%%% Now let the computer move %%%%
        %%%% Add code here             %%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        winner = wincheck(board); %Sees if a player has won
        if winner == 0
            computermove;
            %addpeice_noanim;
            addpeice;
            winner = wincheck(board); %Rechecks board state after each move
        end
        
        switch winner %Prints out CPU response to a move or the results of a game.
            case 0
                disp('Your turn.');
            case 1
                disp('P1 Wins!');
            case 2
                disp('P2 Wins!');
            case 3
                disp('Tie');

        end

    end

end

