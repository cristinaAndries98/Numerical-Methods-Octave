function R = proba(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  output_precision(6);
d=0.85;
eps=0.001;
  fid=fopen('graf1','r');
  N=fscanf(fid,'%d',[1 1]);            % citim numarul de noduri
  
  %fin=fopen(nume.out,'w');
  %fwrite(fin,N,1);
  for i = 1: N
    for j= 1 : N
      A (i,j)=0;                 %initializez matricea cu 0 pentru a forma dupa aceea matricea de adiacenta
    endfor
  endfor
  
  for i = 1 : N
    nrnod = fscanf(fid,'%d',1)
    nrvecini = fscanf(fid,'%d',1);
    L(i)=nrvecini;    %formez vectorul L care contine numarul de vecini
   
    for j = 1 : nrvecini
      elem = fscanf (fid,'%d',1);
      if elem != 0 
        for k = 1 : N
            A(i,elem) = 1;    % am format matricea de adiacenta asociata grafului citit
          endfor
       endif
     endfor
  endfor
fclose(fid);
endfunction