clc; clear;
do=searchfiles(); n=length(do(:,1));
fprintf('--------------------------------------------------------------\n');
fprintf('      Nilai GCV untuk 2 titik knot pada spline kubik\n');
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
       d11(nf,1:3)=newdata1(i,1:3);
       d12(nf,1:3)=newdata1(j,1:3);
       nf=nf+1;
   end
end
newdata2=[d11(:,:),d12(:,:)]

nf=1; 
for i=1:length(newdata2(:,1))
    if ((newdata2(i,4) >  newdata2(i,1)) && ...
        (newdata2(i,5) >  newdata2(i,2)) && ...
        (newdata2(i,6) >  newdata2(i,3)))
        data3(nf,1:6)=newdata2(i,1:6);
        nf=nf+1;
    end
end
newdata3=[data3(:,:)]

