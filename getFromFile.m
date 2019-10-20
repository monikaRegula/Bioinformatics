function reading = getFromFile()
startingFolder = 'C:\Users\asus\Desktop\zad3 Monia\FASTA';
if ~exist(startingFolder, 'dir')
    %if this file doesn't exists, then searching by another folder
    startingFolder = pwd;
end
%Taking file name that user has chosen
defaultFileName = fullfile(startingFolder, '*.*');
[baseFileName, folder] = uigetfile(defaultFileName, 'Select a file');
if baseFileName == 0
    disp('File was not chosen!');
    %User clicked CANCEL
    return;
end
fullFileName = fullfile(folder, baseFileName);
%reads file with Fasta format; returns identifier and sequence
reading = fileread(fullFileName);
end

