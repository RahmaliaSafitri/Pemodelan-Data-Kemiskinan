function [xk1,xk2,xk3,xt1,xt2,xt3] = k1(n,X1,X2,X3,k1,k2,k3,t1,t2,t3)
    % Matriks untuk y1
    mk1=X1-k1; mk2=X2-k2; mk3=X3-k3;
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
    for i=1:n
        if mk3(i,1) < 0 
            xk3(i,1)=0;
        else
            xk3(i,1)=mk3(i,1);
        end
    end
    % Matriks untuk y2
    mt1=X1-t1; mt2=X2-t2; mt3=X3-t3;
    for i=1:n
        if mt1(i,1) < 0 
            xt1(i,1)=0;
        else
            xt1(i,1)=mt1(i,1);
        end
    end
    for i=1:n
        if mt2(i,1) < 0 
            xt2(i,1)=0;
        else
            xt2(i,1)=mt2(i,1);
        end
    end
    for i=1:n
        if mt3(i,1) < 0 
            xt3(i,1)=0;
        else
            xt3(i,1)=mt3(i,1);
        end
    end
return