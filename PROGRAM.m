%PROGRAM
clc
clear all
%Get first sequence from user:
disp('Reading method: 1 (keyboard), 2 (file name), 3 (ID URL), 4 (go to folder)');
methodName = input('Pick method: ');
fasta = getFastaFromUser(methodName);
[identifier1,sequence1] = parseFasta(fasta);

%Get second sequence from user:
disp('Reading method: 1 (keyboard), 2 (file name), 3 (ID URL), 4 (go to folder)');
methodName = input('Pick method: ');
fasta = getFastaFromUser(methodName);
[identifier2,sequence2] = parseFasta(fasta);

%Reading punctation of match/mismatch from text file
punctationMatrix = readPunctation('punctation.txt');

%Get value of gap punctation form user:
gap = input('Enter punctation for gap: ');

%Smith Waterman algorithm
scoredMatrix = localMatching(sequence1,sequence2,gap,punctationMatrix);
[optimalPath,optimalPaths] = traceback(scoredMatrix,sequence1,sequence2,gap,punctationMatrix);

%Plot visualisation
plotScoreMatrix(scoredMatrix , optimalPaths, sequence1, sequence2);

%Saving for file
[indexes] = findIndexesForFasta(optimalPaths);
[toFile,save] = createAlignments(optimalPaths,sequence1,sequence2,indexes,optimalPath);
statisticFile(toFile,sequence1,sequence2,gap);





