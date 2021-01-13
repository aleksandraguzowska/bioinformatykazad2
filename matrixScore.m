function [ mNW, dir, i, j] = matrixScore(seq1, seq2, match, mismatch, gap)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N1 = length(seq1);
N2 = length(seq2);

mNW = zeros(N1+1, N2+1); %macierz punktacji
dir = zeros(N1+1, N2+1); %macierz z kierunkami 0-skos 1-bok 2-góra

mNW(1,1) = 0;
dir (1,1) = 3;

for i=2:N1+1

    mNW(i,1) = mNW(i-1,1) - 1;
    dir (i,1) = 2;
    
end

for j=2:N2+1

    mNW(1,j) = mNW(1,j-1) - 1;
    dir (1,j) = 1; 
    
end

for i=2:N2+1
    for j=2:N1+1

        %PUNKTACJA
        if (seq1(j-1)== seq2(i-1))
            m = match;
        else
            m = mismatch;
        end
    
        dir0 = mNW(j-1,i-1) + m;
        dir1 = mNW(j,i-1) + gap;
        dir2 = mNW(j-1,i) + gap;
        
        A = [dir0 dir1 dir2];
        maxA = max(A);
        mNW(j,i) = maxA;
        
        %KIERUNEK
        if (dir0 == maxA) 
            dir(j,i)=0;
        end
        if (dir1 == maxA)
            dir(j,i)=1;
        end
        if (dir2 == maxA)
            dir(j,i)=2;
        end
        
    
    end
end

end

