function fastaContent = getByKeyboard()
%Function reads sequences in fasta format from given input
fastaContent = ['>',input('Identifier:','s'),newline,input('Sequence:','s')];
end

