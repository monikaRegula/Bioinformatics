function index = findIndexInPunctationMatrix(punctationMatrix,help,size)
%Funkcja dla podanej macierzy punktacji, jednego z rozmiarow macierzy
%punktacji oraz litery z sekwencji zwraca nr indeksu odpowiadaj¹cy literze
%z pliku tesktowego
for i = 1:size
    if(help == char(punctationMatrix(1,i)))
        index = i;
        break;
    end
end

end

