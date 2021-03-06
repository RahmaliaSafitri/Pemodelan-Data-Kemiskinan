function [MSE GCV]=gcv(n,Y,X,B,W)
    % ================================================================ 
    %  Nilai MSE dan GCV
    % ---------------------------------------------------------------- 
    %  Input 
    %  n    : Jumlah data
    %  Y    : Matrix Y baru
    %  X    : Matrix X baru    
    %  B    : Matrix B baru
    %  W    : Matrix W baru
    % ---------------------------------------------------------------- 
    %  Output
    %  MSE  : Nilai MSE
    %  GCV  : Nilai GCV
    % ================================================================ 
    MSE=(1/n)*(Y-(X*B))'*inv(W)*(Y-(X*B));
    Hk=X*(inv(X'*(inv(W))*X))*X'*(inv(W));
    I2=eye(length(Hk));
    N=((1/n)*(trace(I2-Hk)))^2;
    GCV=MSE/N
return