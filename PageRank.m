% Andries Cristina 314CC

function [R1 R2] = PageRank(nume, d, eps)
	% Clculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  R1=Iterative(nume,d,eps);
  nr=numel(R1);
  nume=strcat(nume,'.out');
  nume
  nr
  fout=fopen(nume,'w');
  fprintf(fout,'%d\n',nr);
  for i = 1 : nr
    fprintf(fout,'%.6f\n',R1(i,1));
  endfor
  fclose(fout);
endfunction
  
  
  
  
  
  