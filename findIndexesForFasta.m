function [indexes] = findIndexesForFasta(optimalPaths)
%Funkcja szuka w optymalnych œcie¿kach indeksy komórek odpowiadaj¹cyh
%pocz¹tkowi i koñcowi optymalnej œcie¿ki. Indeksy potrzebne do formatu
%FASTA
indexes = cell(1,1);
m = size(optimalPaths,2);

for k = 1:m
    [a,b] = find(optimalPaths{k},1,'last');
    [c,d] = find(optimalPaths{k},1,'first');
    navigator = [[c-1,d-1];[a-1,b-1]];
    indexes{k} = navigator;
end

end

