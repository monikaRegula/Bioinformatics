function [localPaths,optimalPaths] = traceback(scoredMatrix,seq1,seq2,gap,punctationMatrix)
%Funkcja generuje dla znalezionych warto�ci maksymalnych w macierzy koszt�w
%scoredMatrix �cie�ki optymalne dopasowania lokalnego

%wymiary macierzy:
m = size(scoredMatrix,1);
n = size(scoredMatrix,2);
%szukam maximum w macierzy punktacji
maximumScore = max(scoredMatrix(:));
%prealokacja tabeli dla optymalnej �cie�ki
optimalPath = zeros(m,n);
%kom�rek zawier�cych warto�� r�wn� maximumScore mo�e by� wi�cej, dlatego
%zapami�tuj� lokalizacj� wszystkich mo�liwych
allMaxes = (scoredMatrix(:) == maximumScore);
%w miejscu maksima wstawiam 1
optimalPath(allMaxes) = 1;
%x zwraca numery kom�rek z maksimami
x = find(optimalPath == 1);
%memorise to pewnego rodzaju nawigacja; tu gromadzone s� wsp�rz�dne, gdzie:
%- Columns - zapami�tuje nr kolumn, w kt�rych znajduj� si� maximumScore
%- Rows - zapami�tuje nr wierszy, w kt�rych znajduj� si� maximumScore
[Rows,Columns] = find(optimalPath == 1);
howManyMaxes = length(x);
memorise = [Rows,Columns];
%p�tla jest wykonywana tyle razy ile jest mo�liwych maksim�w w macierzy
%punktacji (scoredMatrix)
for i = 1: length(x)
    %currentMax pobiera aktualny nr kom�rki maksima
    currentMax = x(i);
    path = zeros(m,n);
    %steps to mapa krok�w
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




