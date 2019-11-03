%PROGRAM
clc
clear all
%Get first sequence form user:
disp('Reading method: 1 (keyboard), 2 (file name), 3 (ID URL), 4 (go to folder)');
methodName = input('Pick method: ');
fasta =  getFastaFromUser(methodName);
[identifier1,sequence1] = parseFasta(fasta);
%Get second sequence from user:
disp('Reading method: 1 (keyboard), 2 (file name), 3 (ID URL), 4 (go to folder)');
methodName = input('Pick method: ');
fasta = getFastaFromUser(methodName);
[identifier2,sequence2] = parseFasta(fasta);
comparison = compareSequences(sequence1,sequence2);
%Get parameters needed to create dot plot
window = input('Enter number of window size:');
validateData(window);
mistake = input('Enter number of mistake threshold:');
validateData(mistake);

dotPlot = createDotPlot(comparison,window,mistake);
drawPlot(dotPlot,length(sequence1), length(sequence2))




