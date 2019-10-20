function[punctationMatrix]=readPunctation(punctationFile)
%Funkcja wczytuje macierz punktacji z pliku tekstowego punctation.txt
punctationMatrix = table2cell(readtable(punctationFile,'ReadVariableNames',false));
end
