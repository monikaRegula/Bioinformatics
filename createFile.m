function [save] = createFile(save,indexes)

for k = 1 : size(save,1)
    index = [];
    index = [index; indexes{k}(:)];
    first = strcat('>Sequence1'," ", num2str(index(1,1)),'-',num2str(index(2,1)));
    second = strcat('>Sequence2'," ", num2str(index(3,1)), '-', num2str(index(4,1)));
    save{k,1} = [first; save{k,1}(1,:); second; save{k,1}(2,:);""] ;
    %zapis do pliku fasta:
    fid = fopen('file1.fasta', 'wt');
    fprintf(fid,'%s\n', save{:});
    fclose(fid);
    
end
end

