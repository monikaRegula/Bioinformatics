function [toFile,save] = createAlignments(optimalPaths,seq1,seq2,indexes,optimalPath)
%Funkcja generuje dopasowania dla sekwencji na podstawie optymalnych
%�cie�ek wygenerowanych wcze�niej; generuje r�wnie�

%p�tla wykonuje si� tyle razy co ilo�� optymalnych �cie�ek
howManyTimesLoop = size(optimalPaths,2);
for k = 1:howManyTimesLoop
    %ka�da p�tla generuje parametry dla konkretnej �cie�ki
    alignment1 = '';
    alignment2 = '';
    aligner = '';
    currentPath = optimalPaths{k};
    [s1,s2] = size(currentPath);
    identity = 0;
    gaps = 0;
    
    x = size(optimalPath{k},2);
    temporarySteps = optimalPath{k};
    
    for n = 2:s1
        for m = 2:s2
            
            %gdy ko�cz� si� temporarySteps ko�czy si� jedna ze �cie�ek dopasowania
            %lokalnego
            if(x>0)
                if(currentPath(n,m) == 1)
                    if((alignment1 == "") && (alignment2 == ""))
                        alignment1 = strcat(alignment1,seq1(n-1));
                        alignment2 = strcat(alignment2,seq2(m-1));
                        if(seq1(n-1) == seq2(m-1) &&temporarySteps(1,x) == 2 )
                            aligner = strcat(aligner,'|');
                            identity = identity + 1;
                            x = x-1;
                        else
                            aligner = strcat(aligner," ");
                        end
                    end
                    
                    if((m<s2) && temporarySteps(1,x) == 1 )
                        %disp('1 PION')
                        alignment1 = strcat(alignment1,'-');
                        alignment2 = strcat(alignment2,seq2(m));
                        gaps = gaps+1;
                        aligner = strcat(aligner," ");
                        x = x-1;
                        
                    elseif((n<s1) && temporarySteps(1,x) == 3)
                        x = x-1;
                        alignment1 = strcat(alignment1,seq1(n));
                        alignment2 = strcat(alignment2,'-');
                        gaps = gaps + 1;
                        aligner = strcat(aligner," ");
                        
                    elseif((m<s2 && n<s1)&& temporarySteps(1,x) == 2  )
                        x = x-1;
                        alignment1 = strcat(alignment1,seq1(n));
                        alignment2 = strcat(alignment2,seq2(m));
                        if(seq1(n) == seq2(m))
                            aligner = strcat(aligner,'|');
                            identity = identity + 1;
                        else
                            aligner = strcat(aligner," ");
                        end
                    end
                    
                end
            end
        end
    end
    
    index =[];
    lengthOf = length(alignment1);
    alignmnent = [alignment1;aligner;alignment2];
    identetityPercent = round((identity/lengthOf),2)*100;
    gapsPercent =  round((gaps/lengthOf),2)*100;
    identityToFile = strcat(num2str(identity),'/',num2str(lengthOf)," ",num2str(identetityPercent),'%');
    gapsToFile = strcat(num2str(gaps),'/',num2str(lengthOf)," ",num2str(gapsPercent),'%');
    
    %format FASTA:
    index = [index; indexes{1}];
    
    
    first = strcat('>Sequence1'," ", num2str(index(1,1)),'-',num2str(index(2,1)))
    second = strcat('>Sequence2'," ", num2str(index(1,2)), '-', num2str(index(2,2)))
    
    save{k,1} = [first; alignment1; second; alignment2;""] ;
    %zapis do pliku fasta:
    fid = fopen('file1.fasta', 'wt');
    fprintf(fid,'%s\n', save{:});
    fclose(fid);
    
    toFile{k,1} = [lengthOf];
    toFile{k,2} = [gapsToFile];
    toFile{k,3} = [identityToFile];
    toFile{k,4} = [alignment1];
    toFile{k,5} = [aligner];
    toFile{k,6} = [alignment2];
    
    
end
end

