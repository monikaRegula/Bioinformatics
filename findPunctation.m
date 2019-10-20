function score = findPunctation(punctationMatrix,help,help2)
%Funkcja zwraca wartoœæ punktacji dla podanych liter z sekwencji na
%podstawie pliku punctation.txt
[x,y] = size(punctationMatrix);
index = 0;
index2 = 0;

index = findIndexInPunctationMatrix(punctationMatrix,help,x);
index2 = findIndexInPunctationMatrix(punctationMatrix,help2,y);


if(index == 0 || index2 == 0)
    error('punctation.txt didnt recognise such element');
end

score = str2double(punctationMatrix(index,index2));
end

