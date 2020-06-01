clc; clear;
do=searchfiles(); n=length(do(:,1));
fprintf('--------------------------------------------------------------\n');
fprintf('      Nilai GCV untuk 1 titik knot pada spline linear\n');
fprintf('--------------------------------------------------------------\n');

Y1=do(:,1); Y2=do(:,2); X1=do(:,3); X2=do(:,4); X3=do(:,5); m1=ones(n,1);

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

%Mencari nilai Minimum Nilai X3
temp=X3(1,1); N=1;
for i=1:n
    if X3(i,1)<temp
        MinX3=X3(i,1); indekxMinX3=i;
    else
        MinX3=temp; indekxMinX3=N;
    end
    temp=MinX3; N=indekxMinX3;
end
%Mencari nilai Maximum Nilai X3
temp=X3(1,1); N=1;
for i=1:n
    if X3(i,1) > temp
        MaxX3=X3(i,1); indekxMaxX3=i;
    else
        MaxX3=temp; indekxMaxX3=N;
    end
    temp=MaxX3; N=indekxMaxX3;
end

f=0;
%tabelGCV=zeros((n*n),1);
for i=1:n;
    k11=X1(i,1); k12=X2(i,1); k13=X3(i,1);
    if ((k11 == MaxX1) | (k11 == MinX1)) | ...
       ((k12 == MaxX2) | (k12 == MinX2)) | ...
       ((k13 == MaxX3) | (k13 == MinX3))
    else
       k11=X1(i,1); k12=X2(i,1); k13=X3(i,1);
       
       for j=1:n
           t21=X1(j,1); t22=X2(j,1); t23=X3(j,1);
           if ((t21 == MaxX1) | (t21 == MinX1)) | ...
              ((t22 == MaxX2) | (t22 == MinX2)) | ...
              ((t23 == MaxX3) | (t23 == MinX3))
           else
             t21=X1(j,1); t22=X2(j,1); t23=X3(j,1);
             
                [xk1,xk2,xk3,xt1,xt2,xt3] = k1(n,X1,X2,X3,k11,k12,k13,t21,t22,t23);

                %Matrix y1 dan y2
                my1=[m1,X1,X1.^2,X1.^3,xk1.^3,X2,X2.^2,X2.^3,xk2.^3,X3,X3.^2,X3.^3,xk3.^3];
                my2=[m1,X1,X1.^2,X1.^3,xt1.^3,X2,X2.^2,X2.^3,xt2.^3,X3,X3.^2,X3.^3,xt3.^3];

                %Matrix H1(.) dan H2(.)
                [H1,H2]=matrixH(my1,my2);

                %Mencari Varian-Coarian dan Matriks W
                [W]=matrixW(n,Y1,Y2,H1,H2);

                %Pembuatan Matriks X
                [X]=matrixX(my1,my2);

                %Pembuatan Matriks Y
                Y=[Y1;Y2];

                %Matriks B
                B=(inv(X'*inv(W)*X))*X'*(inv(W))*Y;

                %MSE dan GCV
                [MSE GCV]=gcv(n,Y,X,B,W);
                f=f+1;
                tabelGCV(f,1)=GCV;
                
                newtabelk11(f,1)=X1(i,1);
                newtabelk12(f,1)=X2(i,1);
                newtabelk13(f,1)=X3(i,1);

                newtabelt21(f,1)=X1(j,1);
                newtabelt22(f,1)=X2(j,1);
                newtabelt23(f,1)=X3(j,1);
           end
       end
    end
end
fprintf('Tabel Kubik 1 Knot (K1,K2,K3,T1,T2,T3,GCV)\n');
fprintf('Jumlah : %d',f); a=f;


for i=1:f
    tabelk11(i,1)=newtabelk11(i,1);
    tabelk12(i,1)=newtabelk12(i,1);
    tabelk13(i,1)=newtabelk13(i,1);
    tabelt21(i,1)=newtabelt21(i,1);
    tabelt22(i,1)=newtabelt22(i,1);
    tabelt23(i,1)=newtabelt23(i,1);
end

[tabelk11(:,1), tabelk12(:,1), ...
    tabelk13(:,1), tabelt21(:,1), tabelt22(:,1), ...
    tabelt23(:,1),tabelGCV(:,1)]
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

[tabelk11(indekxMinGCV,1), tabelk12(indekxMinGCV,1), ...
    tabelk13(indekxMinGCV,1), tabelt21(indekxMinGCV,1), tabelt22(indekxMinGCV,1), ...
    tabelt23(indekxMinGCV,1),tabelGCV(indekxMinGCV,1)]

% Titik Knot kedua
%Y1=do(:,1); Y2=do(:,2); X1=do(:,3); X2=do(:,4); X3=do(:,5); m1=ones(n,1);
f=1;
for i=1:n
    if ((X1(i,1) >= tabelk11(indekxMinGCV,1)) && ...
            (X2(i,1) >= tabelk12(indekxMinGCV,1)) && ...
            (X3(i,1) >= tabelk13(indekxMinGCV,1)))
        newY1_b(f,1)=Y1(i,1);
        newY2_b(f,1)=Y2(i,1);
        newk11_b(f,1)=do(i,3);
        newk12_b(f,1)=do(i,4);
        newk13_b(f,1)=do(i,5);
        f=f+1;
    end
end

Y1_b=newY1_b(:,1); Y2_b=newY2_b(:,1); 
X1_b=newk11_b(:,1); X2_b=newk12_b(:,1); X3_b=newk13_b(:,1); m1=ones(n,1);

fprintf('Data baru dimana :\n'); 
fprintf('X1 >= %7.4f\n',tabelk11(indekxMinGCV,1));
fprintf('X2 >= %7.4f\n',tabelk12(indekxMinGCV,1));
fprintf('X3 >= %7.4f\n',tabelk13(indekxMinGCV,1));

[Y1_b,Y2_b,X1_b,X2_b,X3_b]

f=1;
for i=1:n
    if ((X1(i,1) <= tabelk11(indekxMinGCV,1)) && ...
            (X2(i,1) <= tabelk12(indekxMinGCV,1)) && ...
            (X3(i,1) <= tabelk13(indekxMinGCV,1)))
        newY1_k(f,1)=Y1(i,1);
        newY2_k(f,1)=Y2(i,1);
        newk11_k(f,1)=do(i,3);
        newk12_k(f,1)=do(i,4);
        newk13_k(f,1)=do(i,5);
        f=f+1;
    end
end

Y1_k=newY1_k(:,1); Y2_k=newY2_k(:,1); 
X1_k=newk11_k(:,1); X2_k=newk12_k(:,1); X3_k=newk13_k(:,1);

fprintf('Data baru dimana :\n'); 
fprintf('X1 <= %7.4f\n',tabelk11(indekxMinGCV,1));
fprintf('X2 <= %7.4f\n',tabelk12(indekxMinGCV,1));
fprintf('X3 <= %7.4f\n',tabelk13(indekxMinGCV,1));

[Y1_k,Y2_k,X1_k,X2_k,X3_k]
