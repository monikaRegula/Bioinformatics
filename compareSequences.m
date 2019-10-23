function comparison = compareSequences(seq1,seq2)
%Function compares sequences.
%It returns logical matrix
%If value of the cell is 1 then both element of sequences are equals
% if value of the cell is 0 then both element of sequences are not equals
n = length(seq1);
m = length(seq2);

for i = 1:n
    for j = 1:m
       comparison(i,j) = (seq1(i)==seq2(j))*1; 
    end
end
