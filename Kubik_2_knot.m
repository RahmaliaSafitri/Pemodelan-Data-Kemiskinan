clc; clear;
do=searchfiles(); n=length(do); fdl=0;
fprintf('--------------------------------------------------------------\n');
fprintf('      Nilai GCV untuk 2 titik knot pada spline kubik\n');
fprintf('--------------------------------------------------------------\n');

%Matrix Y dan Y
Y1=do(:,1); Y2=do(:,2); X1=do(:,3); X2=do(:,4); X3=do(:,5); m1=ones(n,1);

%----------------------------------------------------------------------------------------------%
% Input nilai titik Knot k dan t
% Titik knot k untuk nilai titik knot bagian y1
% Titik knot t untuk nilai titik knot bagian y2
%----------------------------------------------------------------------------------------------%
dy=1; fd=0;
while dy > fd
    fprintf('\nNilai K1 untuk X1 Y1 harus diantara %7.4f',min(X1)); fprintf(' sampai %7.4f\n',max(X1));
    k11=input('Input nilai titik knot k1 = ');
    if k11 < (min(X1)) | k11 > (max(X1))
        disp('!!! Anda Salah input');
    else dy=dy-1; end
end

dy=1; fd=0;
while dy > fd
    fprintf('\nNilai K2 untuk X1 Y1 harus diantara %7.4f',min(X1)); fprintf(' sampai %7.4f\n',max(X1));
    k12=input('Input nilai titik knot k2 = ');
    if k12 < (min(X1)) | k12 > (max(X1))
        disp('!!! Anda Salah input');
    else dy=dy-1; end
end

dy=1; fd=0;
while dy > fd
    fprintf('\nNilai K1 untuk X2 Y1 harus diantara %7.4f',min(X2)); fprintf(' sampai %7.4f\n',max(X2));
    k21=input('Input nilai titik knot k1 = ');
    if k21 < (min(X2)) | k21 > (max(X2))
        disp('!!! Anda Salah input');
    else dy=dy-1; end
end


dy=1; fd=0;
while dy > fd
    fprintf('\nNilai K2 untuk X2 Y1 harus diantara %7.4f',min(X2)); fprintf(' sampai %7.4f\n',max(X2));
    k22=input('Input nilai titik knot k2 = ');
    if k22 < (min(X2)) | k22 > (max(X2))
        disp('!!! Anda Salah input');
    else dy=dy-1; end
end

dy=1; fd=0;
while dy > fd
    fprintf('\nNilai K1 untuk X3 Y1 harus diantara %7.4f',min(X3)); fprintf(' sampai %7.4f\n',max(X3));
    k31=input('Input nilai titik knot k1 = ');
    if k31 < (min(X3)) | k31 > (max(X3))
        disp('!!! Anda Salah input');
    else dy=dy-1; end
end

dy=1; fd=0;
while dy > fd
    fprintf('\nNilai K2 untuk X3 Y1 harus diantara %7.4f',min(X3)); fprintf(' sampai %7.4f\n',max(X3));
    k32=input('Input nilai titik knot k2 = ');
    if k32 < (min(X3)) | k32 > (max(X3))
        disp('!!! Anda Salah input');
    else dy=dy-1; end
end

dy=1; fd=0;
while dy > fd
    fprintf('\nNilai T1 untuk X1 Y2 harus diantara %7.4f',min(X1)); fprintf(' sampai %7.4f\n',max(X1));
    t11=input('Input nilai titik knot T1 = ');
    if t11 < (min(X1)) | t11 > (max(X1))
        disp('!!! Anda Salah input');
    else dy=dy-1; end
end

dy=1; fd=0;
while dy > fd
    fprintf('\nNilai T2 untuk X1 Y2 harus diantara %7.4f',min(X1)); fprintf(' sampai %7.4f\n',max(X1));
    t12=input('Input nilai titik knot T2 = ');
    if t12 < (min(X1)) | t12 > (max(X1))
        disp('!!! Anda Salah input');
    else dy=dy-1; end
end

dy=1; fd=0;
while dy > fd
    fprintf('\nNilai T1 untuk X2 Y2 harus diantara %7.4f',min(X2)); fprintf(' sampai %7.4f\n',max(X2));
    t21=input('Input nilai titik knot T1 = ');
    if t21 < (min(X2)) | t21 > (max(X2))
        disp('!!! Anda Salah input');
    else dy=dy-1; end
end

dy=1; fd=0;
while dy > fd
    fprintf('\nNilai T2 untuk X2 Y2 harus diantara %7.4f',min(X2)); fprintf(' sampai %7.4f\n',max(X2));
    t22=input('Input nilai titik knot T2 = ');
    if t22 < (min(X2)) | t22 > (max(X2))
        disp('!!! Anda Salah input');
    else dy=dy-1; end
end

dy=1; fd=0;
while dy > fd
    fprintf('\nNilai T1 untuk X3 Y2 harus diantara %7.4f',min(X3)); fprintf(' sampai %7.4f\n',max(X3));
    t31=input('Input nilai titik knot T1 = ');
    if t31 < (min(X3)) | t31 > (max(X3))
        disp('!!! Anda Salah input');
    else dy=dy-1; end
end

dy=1; fd=0;
while dy > fd
    fprintf('\nNilai T2 untuk X3 Y2 harus diantara %7.4f',min(X3)); fprintf(' sampai %7.4f\n',max(X3));
    t32=input('Input nilai titik knot T2 = ');
    if t32 < (min(X3)) | t32 > (max(X3))
        disp('!!! Anda Salah input');
    else dy=dy-1; end
end
[xk11,xk12,xk21,xk22,xk31,xk32,xt11,xt12,xt21,xt22,xt31,xt32] = k2(n,X1,X2,X3,k11,k12,k21,k22,k31,k32,t11,t12,t21,t22,t31,t32);


% Matriks untuk y1 dan y2
my1=[m1,X1,X1.^2,X1.^3,xk11.^3,xk12.^3,X2,X2.^2,X2.^3,xk21.^3,xk22.^3,X3,X3.^2,X3.^3,xk31.^3,xk32.^3];
my2=[m1,X1,X1.^2,X1.^3,xt11.^3,xt12.^3,X2,X2.^2,X2.^3,xt21.^3,xt22.^3,X3,X3.^2,X3.^3,xt31.^3,xt32.^3];

%Matrix H1(.) atau H2(.)
[H1,H2]=matrixH(my1,my2);

%Mencari Varian-Coarian dan Matriks W
[W]=matrixW(n,Y1,Y2,H1,H2);

%Matriks X
[X]=matrixX(my1,my2);

%Matriks Y
Y=[Y1;Y2];

%Matriks B
B=(inv(X'*inv(W)*X))*X'*(inv(W))*Y

%GCV
[MSE GCV]=gcv(n,Y,X,B,W);