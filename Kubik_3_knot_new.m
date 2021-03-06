clc; clear;
do=searchfiles(); n=length(do(:,1));
fprintf('--------------------------------------------------------------\n');
fprintf('      Nilai GCV untuk 1 & 2 titik knot pada spline linear\n');
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

nf=1; n=length(do(:,1));
for i=1:n;
    k11=X1(i,1); k12=X2(i,1); k13=X3(i,1);
    if ((k11 == MaxX1) | (k11 == MinX1)) | ...
       ((k12 == MaxX2) | (k12 == MinX2)) | ...
       ((k13 == MaxX3) | (k13 == MinX3))
    else
       newX1(nf,1)=X1(i,1); newX2(nf,1)=X2(i,1); newX3(nf,1)=X3(i,1);
       nf=nf+1;
    end
end

%Menyeleksi data yang tidak mengandung nilai Min dan Max
newdata1=[newX1(:,1),newX2(:,1),newX3(:,1)]
nf=1;
for i=1:length(newdata1(:,1))
   for j=1:length(newdata1(:,1))
       for k=1:length(newdata1(:,1))
           d11(nf,1:3)=newdata1(i,1:3);
           d12(nf,1:3)=newdata1(j,1:3);
           d13(nf,1:3)=newdata1(k,1:3);
           nf=nf+1;
       end    
   end
end 
newdata2=[d11(:,:),d12(:,:),d13(:,:)]

nf=1; 
for i=1:length(newdata2(:,1))
    if ((newdata2(i,7) > newdata2(i,4) )&& (newdata2(i,4)>  newdata2(i,1)) && ...
        (newdata2(i,8) > newdata2(i,5) )&& (newdata2(i,5)>  newdata2(i,2)) && ...
        (newdata2(i,9) > newdata2(i,6) )&& (newdata2(i,6)>  newdata2(i,3)))
        data3(nf,1:9)=newdata2(i,1:9);
        nf=nf+1;
    end
end
newdata3=[data3(:,:)]

nf=1;
for i=1:length(newdata3(:,1))
   for j=1:length(newdata3(:,1))
       d21(nf,:)=newdata3(i,:);
       d22(nf,:)=newdata3(j,:);
       nf=nf+1;
   end
end
newdata4=[d21(:,:),d22(:,:)]


%Matrix Y dan Y
Y1=do(:,1); Y2=do(:,2); X1=do(:,3); X2=do(:,4); X3=do(:,5); m1=ones(n,1);
%----------------------------------------------------------------------------------------------%
% Input nilai titik Knot k dan t
% Titik knot k untuk nilai titik knot bagian y1
% Titik knot t untuk nilai titik knot bagian y2
%----------------------------------------------------------------------------------------------%
f=1;
for i=1:length(newdata4(:,1))
    k11=newdata4(i,1); k12=newdata4(i,4); k13=newdata4(i,7); 
    k21=newdata4(i,2); k22=newdata4(i,5); k23=newdata4(i,8);
    k31=newdata4(i,3); k32=newdata4(i,6); k33=newdata4(i,9);
    t11=newdata4(i,10); t12=newdata4(i,13); t13=newdata4(i,16); 
    t21=newdata4(i,11); t22=newdata4(i,14); t23=newdata4(i,17);
    t31=newdata4(i,12); t32=newdata4(i,15); t33=newdata4(i,18);

   [xk11,xk12,xk13,xk21,xk22,xk23,xk31,xk32,xk33,xt11,xt12,xt13,xt21,xt22,xt23,xt31,xt32,xt33] = ...
          k3(n,X1,X2,X3,k11,k12,k13,k21,k22,k23,k31,k32,k33,t11,t12,t13,t21,t22,t23,t31,t32,t33);

    %Matrix y1 dan y2
    my1=[m1,X1,X1.^2,X1.^3,xk11.^3,xk12.^3,xk13.^3,X2,X2.^2,X2.^3,xk21.^3,xk22.^3,xk23.^3,X3,X3.^2,X3.^3,xk31.^3,xk32.^3,xk33.^3];
    my2=[m1,X1,X1.^2,X1.^3,xt11.^3,xt12.^3,xt13.^3,X2,X2.^2,X2.^3,xt21.^3,xt22.^3,xt23.^3,X3,X3.^2,X3.^3,xt31.^3,xt32.^3,xt33.^3];



    %Matrix H1(.) atau H2(.)
    [H1,H2]=matrixH(my1,my2);

    %Mencari Varian-Coarian dan Matriks W
    [W]=matrixW(n,Y1,Y2,H1,H2);

    %Matriks X
    [X]=matrixX(my1,my2);

    %Matriks Y
    Y=[Y1;Y2];

    %Matriks B
    B=(inv(X'*inv(W)*X))*X'*(inv(W))*Y;

    %GCV
    [MSE GCV]=gcv(n,Y,X,B,W);
    tabelGCV(f,1)=GCV;
    
    newtabelk11(f,1)= newdata4(i,1);
    newtabelk12(f,1)= newdata4(i,4);
    newtabelk13(f,1)= newdata4(i,7);
    newtabelk21(f,1)= newdata4(i,2);
    newtabelk22(f,1)= newdata4(i,5);
    newtabelk23(f,1)= newdata4(i,8);
    newtabelk31(f,1)= newdata4(i,3);
    newtabelk32(f,1)= newdata4(i,6);
    newtabelk33(f,1)= newdata4(i,9);
    
    newtabelt11(f,1)= newdata4(i,10); 
    newtabelt12(f,1)= newdata4(i,13);
    newtabelt13(f,1)= newdata4(i,16);
    newtabelt21(f,1)= newdata4(i,11);
    newtabelt22(f,1)= newdata4(i,14);
    newtabelt23(f,1)= newdata4(i,17);
    newtabelt31(f,1)= newdata4(i,12);
    newtabelt32(f,1)= newdata4(i,15);
    newtabelt33(f,1)= newdata4(i,18);
    f=f+1;
end
fprintf('Tabel Linear 1 Knot (K1,K2,K3,K4,K5,K6,T1,T2,T3,T4,T5,T6,GCV)\n');
fprintf('Jumlah : %d',f-1);

[newtabelk11(:,1), newtabelk21(:,1), newtabelk31(:,1), ...
 newtabelk12(:,1), newtabelk22(:,1), newtabelk32(:,1), ...
 newtabelk13(:,1), newtabelk23(:,1), newtabelk33(:,1), ...
 newtabelt11(:,1), newtabelt21(:,1), newtabelt31(:,1), ...
 newtabelt12(:,1), newtabelt22(:,1), newtabelt32(:,1), ...
 newtabelt13(:,1), newtabelt23(:,1), newtabelt33(:,1),tabelGCV(:,1)]

% Mencari nilai GCV Minimum
tempGCV=tabelGCV(1,1); N=1;
for i=1:length(tabelGCV(:,1))
    if tabelGCV(i,1) < tempGCV
        MinGCV=tabelGCV(i,1); indekxMinGCV=i;
    else
        MinGCV=tempGCV; indekxMinGCV=N;
    end
    tempGCV=MinGCV; N=indekxMinGCV;
end

[newtabelk11(indekxMinGCV,1), newtabelk21(indekxMinGCV,1), newtabelk31(indekxMinGCV,1), ...
 newtabelk12(indekxMinGCV,1), newtabelk22(indekxMinGCV,1), newtabelk32(indekxMinGCV,1), ... 
 newtabelk13(indekxMinGCV,1), newtabelk23(indekxMinGCV,1), newtabelk33(indekxMinGCV,1), ...
 newtabelt11(indekxMinGCV,1), newtabelt21(indekxMinGCV,1), newtabelt31(indekxMinGCV,1), ...
 newtabelt12(indekxMinGCV,1), newtabelt22(indekxMinGCV,1), newtabelt32(indekxMinGCV,1), ...
 newtabelt13(indekxMinGCV,1), newtabelt23(indekxMinGCV,1), newtabelt33(indekxMinGCV,1), ...
 tabelGCV(indekxMinGCV,1)]
 B
