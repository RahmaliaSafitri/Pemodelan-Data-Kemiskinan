function [H1,H2]=matrixH(my1,my2)
    % ================================================================ 
    %  Matrix H1(.) dan Matrix H2(.)
    % ---------------------------------------------------------------- 
    %  Input 
    %  my1  : Matrix y1    
    %  my2  : Matrix y2
    % ---------------------------------------------------------------- 
    %  Output   
    %  H1   : Matrix H1(x1)
    %  H2   : Matrix H2(x2)
    % ================================================================ 
    H1=my1*(inv(my1'*my1))*my1';
    H2=my2*(inv(my2'*my2))*my2';
return