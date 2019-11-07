%TEST2
sequence1 = 'AGT';
sequence2 = 'ACTGGGACT';
%sequence1 = 'AGTCGAG';
%sequence2 = 'GGATCGGA';
punctationMatrix = readPunctation('punctation.txt');
gap = -1;

scoredMatrix = localMatching(sequence1,sequence2,gap,punctationMatrix);
[stepsForAllPaths,optimalPaths,toFile,save] = traceback(scoredMatrix,sequence1,sequence2,gap,punctationMatrix);
figure = imagesc(scoredMatrix);
saveas(gcf,'scoredMatrix.png');
plotScoreMatrix(scoredMatrix ,optimalPaths,sequence1,sequence2);
[indexes] = findIndexesForFasta(optimalPaths);
[save] = createFile(save,indexes);
statisticFile(toFile,sequence1,sequence2,gap);





