function [xk1,xk2] = k11(n,X1,X2,k1,k2)
    % Matriks untuk y1
    mk1=X1-k1; mk2=X2-k2; 
    for i=1:n
        if mk1(i,1) < 0 
            xk1(i,1)=0;
        else
            xk1(i,1)=mk1(i,1);
        end
    end
    for i=1:n
        if mk2(i,1) < 0 
            xk2(i,1)=0;
        else
            xk2(i,1)=mk2(i,1);
        end
    end
   
return