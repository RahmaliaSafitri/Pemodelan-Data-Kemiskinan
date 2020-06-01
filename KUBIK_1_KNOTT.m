clc; clear;
do=searchfiles(); n=length(do(:,1));
fprintf('--------------------------------------------------------------\n');
fprintf('      Nilai GCV untuk 1 titik knot pada spline linear\n');
fprintf('--------------------------------------------------------------\n');

Y=do(:,1); X1=do(:,2);X2=do(:,3); m1=ones(n,1);

%Mencari nilai Minimum Nilai X1
temp=X1(1,1); N=1;
for i=1:n
    if X1(i,1)<temp
        MinX1=X1(i,1); indekxMinX1=i;
    else
        MinX1=temp;    indekxMinX1=N;
    end
    temp=MinX1; N=indekxMinX1;
end


%Mencari nilai Maximum Nilai X1
temp=X1(1,1); N=1;
for i=1:n
    if X1(i,1) > temp
        MaxX1=X1(i,1); indekxMaxX1=i;
    else
        MaxX1=temp;    indekxMaxX1=N;
    end
    temp=MaxX1; N=indekxMaxX1;
end

%Mencari nilai Minimum Nilai X2
temp=X2(1,1); N=1;
for i=1:n
    if X2(i,1)<temp
        MinX2=X2(i,1); indekxMinX2=i;
    else
        MinX2=temp; indekxMinX2=N;
    end
    temp=MinX2; N=indekxMinX2;
end

%Mencari nilai Maximum Nilai X2
temp=X2(1,1); N=1;
for i=1:n
    if X2(i,1) > temp
        MaxX2=X2(i,1); indekxMaxX2=i;
    else
        MaxX2=temp; indekxMaxX2=N;
    end
    temp=MaxX2; N=indekxMaxX2;
end

f=0;
%tabelGCV=zeros((n*n),1);
for i=1:n;
    k11=X1(i,1); k12=X2(i,1);
    if ((k11 == MaxX1) | (k11 == MinX1)) | ...
       ((k12 == MaxX2) | (k12 == MinX2)) 
    else
       k11=X1(i,1); k12=X2(i,1); 
       
                [xk1,xk2] = kt1(n,X1,X2,k11,k12);
                
                %Matrix X
                a=[m1,X1,X1.^2,X1.^3,xk1.^3,X2,X2.^2,X2.^3,xk2.^3];
                [X]=matrixX(a);
                
                %Matriks B
                B=(inv(X'*X))*X'*Y;

                %MSE dan GCV
                [MSE GCV]=gcvw(n,Y,X,B);
                f=f+1;
                tabelGCV(f,1)=GCV;
                
                newtabelk11(f,1)=X1(i,1);
                newtabelk12(f,1)=X2(i,1);
               
    end
end
fprintf('Tabel Kubik 1 Knot (K1,K2,K3,T1,T2,T3,GCV)\n');
fprintf('Jumlah : %d',f); a=f;


for i=1:f
    tabelk11(i,1)=newtabelk11(i,1);
    tabelk12(i,1)=newtabelk12(i,1);

end

[tabelk11(:,1), tabelk12(:,1),tabelGCV(:,1)]
B

% Mencari nilai Minimum Nilai GCV
% Mencari nilai titik knot untuk nilai GCV minimum
tempGCV=tabelGCV(1,1); N=1;
for i=1:n
    if tabelGCV(i,1) < tempGCV
        MinGCV=tabelGCV(i,1); indekxMinGCV=i;
    else
        MinGCV=tempGCV; indekxMinGCV=N;
    end
    tempGCV=MinGCV; N=indekxMinGCV;
end

[tabelk11(indekxMinGCV,1), tabelk12(indekxMinGCV,1),tabelGCV(indekxMinGCV,1)]

