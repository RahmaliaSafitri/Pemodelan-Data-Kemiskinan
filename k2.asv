function [xk11,xk12,xk21,xk22,xk31,xk32,xt11,xt12,xt21,xt22,xt31,xt32] = k2(n,X1,X2,X3,k11,k12,k21,k22,k31,k32,t11,t12,t21,t22,t31,t32)
    mk11=X1-k11; mk12=X1-k12; mk21=X2-k21; mk22=X2-k22; mk31=X3-k31; mk32=X3-k32;
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
    mt11=X1-t11; mt12=X1-t12; mt21=X2-t21; mt22=X2-t22; mt31=X3-t31; mt32=X3-t32;
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
return