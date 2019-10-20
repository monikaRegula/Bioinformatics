function stringWithoutSpaces  = readFromFileFasta(fileName)
%Function reads sequence from file that is in fasta format
fastaContent = fileread(fileName);%using build function from Matlab
stringWithoutSpaces = fastaContent(fastaContent ~= ' ');
end

