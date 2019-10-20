function [] = plotScoreMatrix( scoredMatrix , optimalPaths, seq, seq2)

for n = 1:size(optimalPaths,2)
[s1,s2] = size(optimalPaths{n});
convert = @(x) strtrim(cellstr(num2str(x)));

A = [];
for j = 1:s2
  A = [A convert(scoredMatrix(:,j))];
end

idx = find(optimalPaths{n});
A(idx) = strcat('<html><table border=0 width=50 bgcolor=#FF69B4><TR><TD>', A(idx), '</TD></TR> </table>');

f = figure;
t = uitable(f,'Data',A, 'ColumnName', {'-',seq2(:)}, 'RowName', {'-',seq(:)});
t.Position(3:4) = t.Extent(3:4);
sizeW = [f.Position(1), f.Position(2), t.Position(3)*1.2, t.Position(4)*1.2];
set(f, 'Position', sizeW);

end

end

