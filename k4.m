function [xk11,xk12,xk13,xk14,xk21,xk22,xk23,xk24,xk31,xk32,xk33,xk34,xt11,xt12,xt13,xt14,xt21,xt22,xt23,xt24,xt31,xt32,xt33,xt34] = ...
          k4(n,X1,X2,X3,k11,k12,k13,k14,k21,k22,k23,k24,k31,k32,k33,k34,t11,t12,t13,t14,t21,t22,t23,t24,t31,t32,t33,t34)
    % Matriks untuk y1
    mk11=X1-k11; mk12=X1-k12; mk13=X1-k13; mk14=X1-k14; mk21=X2-k21; mk22=X2-k22; mk23=X2-k23; mk24=X2-k24; mk31=X3-k31; mk32=X3-k32; mk33=X3-k33; mk34=X3-k34;
    for i=1:n
        if mk11(i,1) < 0 
            xk11(i,1)=0;
        else
            xk11(i,1)=mk11(i,1);
        end
    end
    for i=1:n
        if mk12(i,1) < 0 
            xk12(i,1)=0;
        else
            xk12(i,1)=mk12(i,1);
        end
    end
    for i=1:n
        if mk13(i,1) < 0 
            xk13(i,1)=0;
        else
            xk13(i,1)=mk13(i,1);
        end
    end
    for i=1:n
        if mk14(i,1) < 0 
            xk14(i,1)=0;
        else
            xk14(i,1)=mk14(i,1);
        end
    end
    for i=1:n
        if mk21(i,1) < 0 
            xk21(i,1)=0;
        else
            xk21(i,1)=mk21(i,1);
        end
    end
    for i=1:n
        if mk22(i,1) < 0 
            xk22(i,1)=0;
        else
            xk22(i,1)=mk22(i,1);
        end
    end
    for i=1:n
        if mk23(i,1) < 0 
            xk23(i,1)=0;
        else
            xk23(i,1)=mk23(i,1);
        end
    end
    for i=1:n
        if mk24(i,1) < 0 
            xk24(i,1)=0;
        else
            xk24(i,1)=mk24(i,1);
        end
    end
    for i=1:n
        if mk31(i,1) < 0 
            xk31(i,1)=0;
        else
            xk31(i,1)=mk31(i,1);
        end
    end
    for i=1:n
        if mk32(i,1) < 0 
            xk32(i,1)=0;
        else
            xk32(i,1)=mk32(i,1);
        end
    end
    for i=1:n
        if mk33(i,1) < 0 
            xk33(i,1)=0;
        else
            xk33(i,1)=mk33(i,1);
        end
    end
    for i=1:n
        if mk34(i,1) < 0 
            xk34(i,1)=0;
        else
            xk34(i,1)=mk34(i,1);
        end
    end
    % Matriks untuk y2
    mt11=X1-t11; mt12=X1-t12; mt13=X1-t13; mt14=X1-t14; mt21=X2-t21; mt22=X2-t22; mt23=X2-t23; mt24=X2-t24; mt31=X3-t31; mt32=X3-t32; mt33=X3-t33; mt34=X3-t34; 
    for i=1:n
        if mt11(i,1) < 0 
            xt11(i,1)=0;
        else
            xt11(i,1)=mt11(i,1);
        end
    end
    for i=1:n
        if mt12(i,1) < 0 
            xt12(i,1)=0;
        else
            xt12(i,1)=mt12(i,1);
        end
    end
    for i=1:n
        if mt13(i,1) < 0 
            xt13(i,1)=0;
        else
            xt13(i,1)=mt13(i,1);
        end
    end
    for i=1:n
        if mt14(i,1) < 0 
            xt14(i,1)=0;
        else
            xt14(i,1)=mt14(i,1);
        end
    end
    for i=1:n
        if mt21(i,1) < 0 
            xt21(i,1)=0;
        else
            xt21(i,1)=mt21(i,1);
        end
    end
    for i=1:n
        if mt22(i,1) < 0 
            xt22(i,1)=0;
        else
            xt22(i,1)=mt22(i,1);
        end
    end
    for i=1:n
        if mt23(i,1) < 0 
            xt23(i,1)=0;
        else
            xt23(i,1)=mt23(i,1);
        end
    end
    for i=1:n
        if mt24(i,1) < 0 
            xt24(i,1)=0;
        else
            xt24(i,1)=mt24(i,1);
        end
    end
    for i=1:n
        if mt31(i,1) < 0 
            xt31(i,1)=0;
        else
            xt31(i,1)=mt31(i,1);
        end
    end
    for i=1:n
        if mt32(i,1) < 0 
            xt32(i,1)=0;
        else
            xt32(i,1)=mt32(i,1);
        end
    end
    for i=1:n
        if mt33(i,1) < 0 
            xt33(i,1)=0;
        else
            xt33(i,1)=mt33(i,1);
        end
    end  
    for i=1:n
        if mt34(i,1) < 0 
            xt34(i,1)=0;
        else
            xt34(i,1)=mt34(i,1);
        end
    end
return