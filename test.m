%TEST
fasta = readFromFileFasta('Rhino.txt');
[identifier1,sequence1] = parseFasta(fasta);

fasta =  readFromFileFasta('Human.txt');
[identifier2,sequence2] = parseFasta(fasta);

comparison = compareSequences(sequence1,sequence2);
window = 11;
mistake = 4;

dotPlot = createDotPlot(comparison,window,mistake);
drawPlot(dotPlot,length(sequence1), length(sequence2))




