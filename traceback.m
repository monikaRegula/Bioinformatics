function [stepsForAllPaths,optimalPaths,toFile,save] = traceback(scoredMatrix,seq1,seq2,gap,punctationMatrix)
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
for i = 1:howManyMaxes
    %currentCell pobiera aktualny nr komórki maksima
    currentCell = x(i);
    path = zeros(m,n);
    %steps to mapa kroków
    steps = [];
    alignment1 = '';
    alignment2 = '';
    aligner = '';
    identity = 0;
    gaps = 0;
    
    row = Rows(i);
    column = Columns(i);
    
    while scoredMatrix(currentCell)>0
        navigator = scoredMatrix(currentCell);
        score = findPunctation(punctationMatrix,seq1(row -1),seq2(column -1));
        
        if scoredMatrix(currentCell - 1) == navigator - gap
            alignment1 = strcat(alignment1,seq1(row-1));
            alignment2 = strcat(alignment2,'-');
            aligner = strcat(aligner," ");
            path(currentCell) = 1;
            currentCell = currentCell - 1;
            row = row -1;
            steps = [steps,3];
            gaps = gaps + 1;
            
        elseif scoredMatrix(currentCell - m) == navigator - gap
            alignment1 = strcat(alignment1,'-');
            alignment2 = strcat(alignment2,seq2(column-1));
            aligner = strcat(aligner," ");
            path(currentCell) = 1;
            currentCell = currentCell - m;
            column = column -1;
            steps = [steps,1];
            gaps = gaps+1;
            
        elseif scoredMatrix(currentCell - m -1) == navigator - score
            alignment1 = strcat(alignment1,seq1(row-1));
            alignment2 = strcat(alignment2,seq2(column-1));
            if(seq2(column-1)== seq1(row-1))
                aligner =  strcat(aligner,'|');
                identity = identity + 1;
            else
                aligner =  strcat(aligner,' ');
            end
            path(currentCell ) = 1;
            currentCell = currentCell - m - 1;
            row = row -1;
            column = column -1;
            steps = [steps,2];
        end
    end
  
    align1 = fliplr(alignment1);
    alignerr = reverse(aligner);
    align2 = fliplr(alignment2);

    stepsForAllPaths{i} = steps;
    optimalPaths{i}= path;
    
    lengthOf = length(alignment1);
    alignmnent = [align1;alignerr;align2];
    identetityPercent = round((identity/lengthOf),2)*100;
    gapsPercent =  round((gaps/lengthOf),2)*100;
    identityToFile = strcat(num2str(identity),'/',num2str(lengthOf)," ",num2str(identetityPercent),'%');
    gapsToFile = strcat(num2str(gaps),'/',num2str(lengthOf)," ",num2str(gapsPercent),'%');

    save{i,1} = [align1;align2;""] ;
    %zapis do pliku fasta:
    fid = fopen('file1.fasta', 'wt');
    fprintf(fid,'%s\n', save{:});
    fclose(fid);
    
    toFile{i,1} = [lengthOf];
    toFile{i,2} = [gapsToFile];
    toFile{i,3} = [identityToFile];
    toFile{i,4} = [align1];
    toFile{i,5} = [alignerr];
    toFile{i,6} = [align2];
end

end




