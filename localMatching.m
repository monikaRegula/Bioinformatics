function scoredMatrix = localMatching(seq1,seq2,gap,punctationMatrix)
%Funkcja dla podanych sekwencji generuje macierz koszt�w dopasowania
%lokalnego (algorytm Simtha- Watermana)
s1 = length(seq1);
s2 = length(seq2);

scoredMatrix = zeros(s1+1,s2+1);
scoredMatrix(1,2:end) = 0;
scoredMatrix(2:end,1) = 0;

for i = 2:s1+1 %iteracja po wierszach
    for j = 2:s2+1 %iteracja po kolumnach    
        score = findPunctation(punctationMatrix,seq1(i-1),seq2(j-1));
        
        %PRZEKATNA
        diagonal = scoredMatrix(i-1,j-1) + score;
        %POZIOM
        left = scoredMatrix(i-1,j) + gap;
        %PION
        up = scoredMatrix(i,j-1) + gap;
        
        %wybranie maksimum z 4 opcji score: diagonal,left,up,zero
        %maksimum to odleg�o�� edycyjna pomi�dzy seq1 a seq2
        maxScore = max([diagonal left up 0]);
        scoredMatrix(i,j)= maxScore;
        
    end
end

end

