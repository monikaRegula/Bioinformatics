function fasta = getFastaFromUser(methodName)
%Function gives user posibility to choose type of getting sequence.
%There are 3 types:
%1 - reading by keyboard
%2 - reading from fasta file by giving filename
%3 - reading from NCBI database
%4 - reading from file on computer user interaction

if methodName == 1
    fasta = getByKeyboard();
elseif methodName == 2
    fileName = input('Enter file name:','s');
    fasta = readFromFileFasta(fileName);
elseif methodName == 3
    URLIdentifier= input('Enter URL Indentifier:','s');
    fasta = getFromNCBI(URLIdentifier);
elseif methodName == 4
    fasta = getFromFile();
else
    error('Incorrect method')
end

end

