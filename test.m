%TEST
fasta = readFromFileFasta('Rhino.txt');
[identifier1,sequence1] = parseFasta(fasta);
fasta =readFromFileFasta('Human.txt');
[identifier2,sequence2] = parseFasta(fasta);
punctationMatrix = readPunctation('punctation.txt');
gap = -1;


scoredMatrix = localMatching(sequence1,sequence2,gap,punctationMatrix);
[optimalPath,optimalPaths] = traceback(scoredMatrix,sequence1,sequence2,gap,punctationMatrix);
figure = imagesc(scoredMatrix);
saveas(gcf,'scoredMatrix.png');
plotScoreMatrix(scoredMatrix , optimalPaths, sequence1, sequence2);
[indexes] = findIndexesForFasta(optimalPaths);
[toFile,save] = createAlignments(optimalPaths,sequence1,sequence2,indexes,optimalPath);
statisticFile(toFile,sequence1,sequence2,gap);




