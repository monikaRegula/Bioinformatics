function [identifier, sequence] = parseFasta(fastaContent)
%Function splits given input (fastaContent) into :
%- identifier
%- sequence
sequence = "";
fastaFile = splitlines(fastaContent);
identifier = fastaFile(1);

for i = 2:length(fastaFile)
    sequence = sequence + fastaFile(i);
end

sequence = char(sequence);
end

