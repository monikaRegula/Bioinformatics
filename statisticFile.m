function statisticFile(toFile,seq1,seq2,gap)
%Funkcja generuje plik z otrzymanych wyników dopasowania lokalnego.
fid = fopen('matching.txt', 'wt');
    for i = 1 : size(toFile,1)
    fprintf(fid, '#Seq1: %s\n#Seq2: %s\n#Length: %d\n#Gap: %d\n#Identity: %s\n#Gaps: %s\n%s\n%s\n%s\n\n', ...
        seq1,seq2,toFile{i,1},gap,toFile{i,3},toFile{i,2},toFile{i,4},toFile{i,5},toFile{i,6});
    end
fclose(fid);
end
