function scoredMatrix = localMatching(seq1,seq2,gap,punctationMatrix)
%Funkcja dla podanych sekwencji generuje macierz kosztów dopasowania
%lokalnego (algorytm Simtha- Watermana)
s1 = length(seq1);
s2 = length(seq2);

scoredMatrix = zeros(s1+1,s2+1);
scoredMatrix(1,2:end) = 0;
scoredMatrix(2:end,1) = 0;

for i = 2:s1+1 %iteracja po wierszach
    for j = 2:s2+1 %iteracja po kolumnach
        help = seq1(i-1);
        help2 = seq2(j-1);
        
        score = findPunctation(punctationMatrix,help,help2);
        
        if(help == help2)
            diagonal = scoredMatrix(i-1,j-1) + score;
        else
            diagonal = scoredMatrix(i-1,j-1) + score;
        end
        %POZIOM
        left = scoredMatrix(i-1,j) + gap;
        %PION
        up = scoredMatrix(i,j-1) + gap;
        
        %wybranie maksimum z 4 opcji score: diagonal,left,up,zero
        %maksimum to odleg³oœæ edycyjna pomiêdzy seq1 a seq2
        maxScore = max([diagonal left up 0]);
        scoredMatrix(i,j)= maxScore;
        
    end
end

end

