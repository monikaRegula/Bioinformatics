function [localPaths,optimalPaths] = traceback(scoredMatrix,seq1,seq2,gap,punctationMatrix)
%Funkcja generuje dla znalezionych wartoœci maksymalnych w macierzy kosztów
%scoredMatrix œcie¿ki optymalne dopasowania lokalnego

%wymiary macierzy:
m = size(scoredMatrix,1);
n = size(scoredMatrix,2);
%szukam maximum w macierzy punktacji
maximumScore = max(scoredMatrix(:));
%prealokacja tabeli dla optymalnej œcie¿ki
optimalPath = zeros(m,n);
%komórek zawier¹cych wartoœæ równ¹ maximumScore mo¿e byæ wiêcej, dlatego
%zapamiêtujê lokalizacjê wszystkich mo¿liwych
allMaxes = (scoredMatrix(:) == maximumScore);
%w miejscu maksima wstawiam 1
optimalPath(allMaxes) = 1;
%x zwraca numery komórek z maksimami
x = find(optimalPath == 1);
%memorise to pewnego rodzaju nawigacja; tu gromadzone s¹ wspó³rzêdne, gdzie:
%- Columns - zapamiêtuje nr kolumn, w których znajdujê siê maximumScore
%- Rows - zapamiêtuje nr wierszy, w których znajdujê siê maximumScore
[Rows,Columns] = find(optimalPath == 1);
howManyMaxes = length(x);
memorise = [Rows,Columns];
%pêtla jest wykonywana tyle razy ile jest mo¿liwych maksimów w macierzy
%punktacji (scoredMatrix)
for i = 1: length(x)
    %currentMax pobiera aktualny nr komórki maksima
    currentMax = x(i);
    path = zeros(m,n);
    %steps to mapa kroków
    steps = [];
    
    row = Rows(i);
    column = Columns(i);
    
    while scoredMatrix(currentMax)>0
        navigator = scoredMatrix(currentMax);
        score = findPunctation(punctationMatrix,seq1(row -1),seq2(column -1));
        
        if scoredMatrix(currentMax - 1) == navigator - gap
            path(currentMax) = 1;
            currentMax = currentMax - 1;
            row = row -1;
            steps = [steps,3];
            
        elseif scoredMatrix(currentMax - m) == navigator - gap
            path(currentMax) = 1;
            currentMax = currentMax - m;
            column = column -1;
            steps = [steps,1];
            
        elseif scoredMatrix(currentMax - m -1) == navigator - score
            path(currentMax ) = 1;
            currentMax = currentMax - m - 1;
            row = row -1;
            column = column -1;
            steps = [steps,2];
        end
    end
    localPaths{i} = steps;
    optimalPaths{i}= path;
    
end

end




