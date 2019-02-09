% Andries Cristina 314CC

function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  output_precision(6);

  fid=fopen(nume,'r');
  N=fscanf(fid,'%d',[1 1]);            % citim numarul de noduri

  %fin=fopen(nume.out,'w');
  %fwrite(fin,N,1);
  for i = 1: N
    for j= 1 : N
      A (i,j)=0;                 %initializez matricea cu 0 pentru a forma dupa aceea matricea de adiacenta
    endfor
  endfor
  
  for i = 1 : N
    nrnod = fscanf(fid,'%d',1);
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
  
  for i = 1: N
    for j= 1 : N
      K (i,j)=0;                 %initializez matricea cu 0
    endfor
  endfor
  
  K=diag(L);    %formez matricea K cu mentiunea ca are pe diagonala numarul de vecini
  
  %trebuie sa aflu inversa matricei K
  for i = 1: N
    for j= 1 : N
      inversaK (i,j)=0;                 %initializez matricea cu 0
    endfor
  endfor
  
  for i=1:N
    inversaK(i,i)=K(i,i).^(-1); %inversa matricei este inversa pentru fiecare element
  endfor
  
  M = (inversaK * A)';  %conform formula din enunt M este produsul dintre inversa lui K si matricea A, totul transpus
  
  for i = 1 : N
    l(i)=1; %construiesc vectorul coloana " l " care are de N ori 1 
    endfor
  l=l';
 
  val = 1/N;
  
  for i = 1 : N   % PR = R conform enuntului 
    PR(i) = val;  % calculez valoarea initiala = 1/N
    endfor
  PR=PR'; 
  
  R = d * M * PR + (1-d) * l / N;  %aplic formula din enunt pentru vectorul R
  
  while norm( R - PR ) >= eps
    PR = R;
    R = d * M * PR + (1-d) * l / N;  %aplic formula din enunt pentru NOUL vector R, de data asta pornind cu PR egal cu R anterior
  endwhile

  R=PR; %afisez ultima iteratie
  
fclose(fid);
endfunction