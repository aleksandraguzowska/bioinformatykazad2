clc;
clear all;

fprintf('Script search global match of two sequences using gap, match and missmatch punctation\n\n');

%SEQUENCE1
while 1
  fprintf('Choose the way to input first sequence \nmanual - manual\nfile - from FASTA format file\nncbi - from NCBI database\n\n');
  way = input('','s');
  if strcmp(way,'manual') | strcmp(way,'file') | strcmp(way,'ncbi')
      break;
  end
end

if strcmp(way,'manual')
    FastaSet1 = loadFasta(way);    
elseif strcmp(way,'file')
    filename = input('filename: ','s');
    FastaSet1 = loadFasta(way, filename); 
elseif strcmp(way,'ncbi')
    identifier = input('identifier: ','s');
    FastaSet1 = loadFasta(way, identifier); 
end

seq1 = char(FastaSet1(1,2));
seq1ID = char(FastaSet1(1,1));
fprintf('First sequence import succesfully\n\n');

%SEQUENCE2
while 1
  fprintf('Choose the way to input second sequence \nmanual - manual\nfile - from FASTA format file\nncbi - from NCBI database\n');
  way = input('','s');
  if strcmp(way,'manual') | strcmp(way,'file') | strcmp(way,'ncbi')
      break;
  end
end

if strcmp(way,'manual')
    FastaSet2 = loadFasta(way);    
elseif strcmp(way,'file')
    filename = input('filename: ','s');
    FastaSet2 = loadFasta(way, filename); 
elseif strcmp(way,'ncbi')
    identifier = input('identifier: ','s');
    FastaSet2 = loadFasta(way, identifier); 
end

seq2 = char(FastaSet2(1,2));
seq2ID = char(FastaSet2(1,1));
fprintf('Second sequence import succesfully\n\n');

fprintf('Insert match punctation\n');
matchString = input('','s');
match = str2double(matchString);

fprintf('Insert missmatch punctation\n');
mismatchString = input('','s');
mismatch = str2double(mismatchString);
  
fprintf('Insert gap punctation\n');
gapString = input('','s');
gap = str2double(gapString);

result = pathFind(seq1,seq2,match, mismatch, gap);

h = figure;
imagesc(result)
title('Œcie¿ka optymalnego dopasowania')
xlabel(seq2ID);
ylabel(seq1ID);
colorbar

print(h, '-dpng', 'dopasowanieGlobalne.png');
  
  
