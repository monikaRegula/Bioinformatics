%PROGRAM
clc
clear all
%Get first sequence form user:
disp('Reading method: 1 (keyboard), 2 (file name), 3 (ID URL), 4 (go to folder)');
methodName = input('Pick method: ');
[identifier1,sequence1] = getFastaFromUser(methodName);

%Get second sequence from user:
disp('Reading method: 1 (keyboard), 2 (file name), 3 (ID URL), 4 (go to folder)');
methodName = input('Pick method: ');
[identifier2,sequence2] = getFastaFromUser(methodName);

comparison = compareSequences(sequence1,sequence2);
%Get parameters needed to create dot plot
window = input('Enter number of window size:');
validateData(window);
mistake = input('Enter number of mistake threshold:');
validateData(mistake);

createDotPlot(comparison,window,mistake);


