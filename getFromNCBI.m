function fastaContent = getFromNCBI(identifier)
%Function returns sequence. It connects with NCBI National Center for Biotechnology Information database with given
%input identifier.
URL = 'https://www.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi';
fastaContent = urlread(URL,'get',{'db','nucleotide','rettype','fasta','id',identifier});
end

