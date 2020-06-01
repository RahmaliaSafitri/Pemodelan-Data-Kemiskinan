function [W]=matrixW(n,Y1,Y2,H1,H2)
    % ================================================================ 
    %  Matrix W
    % ---------------------------------------------------------------- 
    %  Input 
    %  n    : Banyaknya data
    %  Y1   : Matrix Y1 dari data    
    %  Y2   : Matrix Y2 dari data
    %  H1   : Matrix H1(x1)
    %  H2   : Matrix H2(x2)
    % ---------------------------------------------------------------- 
    %  Output   
    %  W    : Matrix W
    % ================================================================
    IH=eye(length(H1));
    V11=((Y1')*((IH-H1)')*(IH-H1)*Y1)/(n);
    V22=((Y2')*((IH-H2)')*(IH-H2)*Y2)/(n);
    V12=((Y1')*((IH-H1)')*(IH-H2)*Y2)/(n);
    sig11=IH*V11; sig22=IH*V22; sig12=IH*V12;
    W=[sig11 sig12; sig12 sig22];
return