% Project Two: Probabilistic Graphical Models
% Author: Xiujiao Gao
% Samplings
% Before you do the samplings, you have to run parameter_estimation.m
% first to get parameters
clear;
global Cur_Px1;global Cur_Px2;global Cur_Px3;global Cur_Px4;global Cur_Px5;global Cur_Px6;global Cur_Px7;global Cur_Px8;global Cur_Px9;
global Cur_Px2Gx1; global Cur_Px4Gx3x5; global Cur_Px7Gx6x8; global Cur_Px9Gx2x4x7;
global Hand_Px1;global Hand_Px2;global Hand_Px3;global Hand_Px4;global Hand_Px5;global Hand_Px6;global Hand_Px7;global Hand_Px8;global Hand_Px9;
global Hand_Px1Gx5x6x8; global Hand_Px2Gx3x5; global Hand_Px4Gx2x3; global Hand_Px5Gx3; global Hand_Px6Gx2x5; global Hand_Px7Gx3x4x6; global Hand_Px8Gx5x6;

% load data,we can compare the samples we generated with the data set
truthCursive = importdata('truthCursive.txt');
[rows,columns] = size(truthCursive.data);
truthHandprint = importdata('truthHandprint.txt');
[rowsHp,columnsHp] = size(truthHandprint.data);
% sample number
M = 10;
% struct used to store samples
 
% Ancestral samplings for Cursive writing under independent variables
Cur_Independent_Sam.data = zeros(M,9);
for k=1:10
for i=1:M
    % generate x1
    r = rand(1);
    if r <= Cur_Px1(1,2) && Cur_Px1(1,2)~=0
        x1 = 0;
    end
    if r>= Cur_Px1(1,2) && r <= Cur_Px1(1,2) + Cur_Px1(2,2) && Cur_Px1(2,2)~=0
        x1 =1;
    end
    if  r>=Cur_Px1(1,2) + Cur_Px1(2,2) && r<= Cur_Px1(1,2) + Cur_Px1(2,2) +Cur_Px1(3,2) && Cur_Px1(3,2)~=0
        x1 =2;
    end
    if r>= Cur_Px1(1,2) + Cur_Px1(2,2) +Cur_Px1(3,2) && Cur_Px1(4,2)~=0
        x1 =3;
    end
    Cur_Independent_Sam.data(i,1) = x1;
    
    % generate x2
    r = rand(1);
    if (r <= Cur_Px2(1,2) && Cur_Px2(1,2)~=0)
        x2 = 0;
    end
    if (r>= Cur_Px2(1,2) && r <= Cur_Px2(1,2) + Cur_Px2(2,2)  && Cur_Px2(2,2)~=0)
        x2 =1;
    end
    if  (r>=Cur_Px2(1,2) + Cur_Px2(2,2) && r<= Cur_Px2(1,2) + Cur_Px2(2,2) +Cur_Px2(3,2)  && Cur_Px2(3,2)~=0)
        x2 =2;
    end
    if  (r>= Cur_Px2(1,2) + Cur_Px2(2,2) +Cur_Px2(3,2) && r<= Cur_Px2(1,2) + Cur_Px2(2,2) +Cur_Px2(3,2) +Cur_Px2(4,2)  && Cur_Px2(4,2)~=0)
        x2 =3;
    end
    if (r>= Cur_Px2(1,2) + Cur_Px2(2,2) +Cur_Px2(3,2) +Cur_Px2(4,2)  && Cur_Px2(5,2)~=0)
        x2=4;
    end
    Cur_Independent_Sam.data(i,2) = x2;
    
    % generate x3
    r = rand(1);
    if r <= Cur_Px3(1,2)  && Cur_Px3(1,2)~=0
        x3 = 0;
    end
    if r>= Cur_Px3(1,2) && r <= Cur_Px3(1,2) + Cur_Px3(2,2) && Cur_Px3(2,2)~=0
        x3 =1;
    end
    if  r>=Cur_Px3(1,2) + Cur_Px3(2,2) && r<= Cur_Px3(1,2) + Cur_Px3(2,2) +Cur_Px3(3,2) && Cur_Px3(3,2)~=0
        x3 =2;
    end
    Cur_Independent_Sam.data(i,3) = x3;
    
    % generate x4
    r = rand(1);
    if r <= Cur_Px4(1,2) && Cur_Px4(1,2)~=0
        x4 = 0;
    end
    if r>= Cur_Px4(1,2) && r <= Cur_Px4(1,2) + Cur_Px4(2,2) && Cur_Px4(2,2)~=0
        x4 =1;
    end
    if  r>=Cur_Px4(1,2) + Cur_Px4(2,2) && r<= Cur_Px4(1,2) + Cur_Px4(2,2) +Cur_Px4(3,2) && Cur_Px4(3,2)~=0
        x4 =2;
    end
    if  r>= Cur_Px4(1,2) + Cur_Px4(2,2) +Cur_Px4(3,2) && r<= Cur_Px4(1,2) + Cur_Px4(2,2) +Cur_Px4(3,2) +Cur_Px4(4,2) && Cur_Px4(4,2)~=0
        x4 =3;
    end
    if r>= Cur_Px4(1,2) + Cur_Px4(2,2) +Cur_Px4(3,2) +Cur_Px4(4,2) && Cur_Px4(5,2)~=0
        x4=4;
    end
    Cur_Independent_Sam.data(i,4) = x4;
    
    % generate x5
    r = rand(1);
    if r <= Cur_Px5(1,2) && Cur_Px5(1,2)~=0
        x5 = 0;
    end
    if r>= Cur_Px5(1,2) && r <= Cur_Px5(1,2) + Cur_Px5(2,2) && Cur_Px5(2,2)~=0
        x5 =1;
    end
    if  r>=Cur_Px5(1,2) + Cur_Px5(2,2) && r<= Cur_Px5(1,2) + Cur_Px5(2,2) +Cur_Px5(3,2) && Cur_Px5(3,2)~=0
        x5 =2;
    end
    if r>= Cur_Px5(1,2) + Cur_Px5(2,2) +Cur_Px5(3,2) && Cur_Px5(4,2)~=0
        x5 =3;
    end
    Cur_Independent_Sam.data(i,5) = x5;
    
    % generate x6
    r = rand(1);
    if r <= Cur_Px6(1,2) && Cur_Px6(1,2)~=0
        x6 = 0;
    end
    if r>= Cur_Px6(1,2) && r <= Cur_Px6(1,2) + Cur_Px6(2,2) && Cur_Px6(2,2)~=0
        x6 =1;
    end
    if  r>=Cur_Px6(1,2) + Cur_Px6(2,2) && r<= Cur_Px6(1,2) + Cur_Px6(2,2) +Cur_Px6(3,2) && Cur_Px6(3,2)~=0
        x6 =2;
    end
    if r>= Cur_Px6(1,2) + Cur_Px6(2,2) +Cur_Px6(3,2) && Cur_Px6(4,2)~=0
        x6 =3;
    end
    Cur_Independent_Sam.data(i,6) = x6;
    
    % generate x7
    r = rand(1);
    if r <= Cur_Px7(1,2) && Cur_Px7(1,2)~=0
        x7 = 0;
    end
    if r>= Cur_Px7(1,2) && r <= Cur_Px7(1,2) + Cur_Px7(2,2) && Cur_Px7(2,2)~=0
        x7 =1;
    end
    if  r>=Cur_Px7(1,2) + Cur_Px7(2,2) && r<= Cur_Px7(1,2) + Cur_Px7(2,2) +Cur_Px7(3,2) && Cur_Px7(3,2)~=0
        x7 =2;
    end
    if  r>= Cur_Px7(1,2) + Cur_Px7(2,2) +Cur_Px7(3,2) && Cur_Px7(4,2)~=0
        x7 =3;
    end
    Cur_Independent_Sam.data(i,7) = x7;
    
    % generate x8
    r = rand(1);
    if r <= Cur_Px8(1,2) && Cur_Px8(1,2)~=0
        x8 = 0;
    end
    if r>= Cur_Px8(1,2) && r <= Cur_Px8(1,2) + Cur_Px8(2,2) && Cur_Px8(2,2)~=0
        x8 =1;
    end
    if  r>=Cur_Px8(1,2) + Cur_Px8(2,2) && r<= Cur_Px8(1,2) + Cur_Px8(2,2) +Cur_Px8(3,2) && Cur_Px8(3,2)~=0
        x8 =2;
    end
    if  r>= Cur_Px8(1,2) + Cur_Px8(2,2) +Cur_Px8(3,2) && r<= Cur_Px8(1,2) + Cur_Px8(2,2) +Cur_Px8(3,2) +Cur_Px8(4,2) && Cur_Px8(4,2)~=0
        x8 =3;
    end
    if r>= Cur_Px8(1,2) + Cur_Px8(2,2) +Cur_Px8(3,2) +Cur_Px8(4,2) && Cur_Px8(5,2)~=0
        x8=4;
    end
    Cur_Independent_Sam.data(i,8) = x8;
    
    % generate x9
    r = rand(1);
    if r <= Cur_Px9(1,2) && Cur_Px9(1,2)~=0
        x9 = 0;
    end
    if r>= Cur_Px9(1,2) && r <= Cur_Px9(1,2) + Cur_Px9(2,2) && Cur_Px9(2,2)~=0
        x9 =1;
    end
    if  r>=Cur_Px9(1,2) + Cur_Px9(2,2) && r<= Cur_Px9(1,2) + Cur_Px9(2,2) +Cur_Px9(3,2) && Cur_Px9(3,2)~=0
        x9 =2;
    end
    Cur_Independent_Sam.data(i,9) = x9;  
end
for i =1:M
    for j =1:rows
        flag = isequal(Cur_Independent_Sam.data(i,:),truthCursive.data(j,:));
        if flag ==1
            Cur_Independent_Sam.textdata(i,:)=truthCursive.textdata(j,:);
            break;
        end
    end
end
end
for i =1:M
    x1 = Cur_Independent_Sam.data(i,1);
    x2 = Cur_Independent_Sam.data(i,2);
    x3 = Cur_Independent_Sam.data(i,3);
    x4 = Cur_Independent_Sam.data(i,4);
    x5 = Cur_Independent_Sam.data(i,5);
    x6 = Cur_Independent_Sam.data(i,6);
    x7 = Cur_Independent_Sam.data(i,7);
    x8 = Cur_Independent_Sam.data(i,8);  
    x9 = Cur_Independent_Sam.data(i,9);
    Cur_Independent_Sam.data(i,10)=Cur_Px1(x1+1,2)*Cur_Px2(x2+1,2)*Cur_Px3(x3+1,2)*Cur_Px4(x4+1,2)*Cur_Px5(x5+1,2)*Cur_Px6(x6+1,2)*Cur_Px7(x7+1,2)*Cur_Px8(x8+1,2)*Cur_Px9(x9+1,2);
end
% Ancestral samplings for Hand print writing under independent variables
Hand_Independent_Sam.data = zeros(M,9);
for k=1:10
for i=1:M
    % generate x1
    r = rand(1);
    if r <= Hand_Px1(1,2) && Hand_Px1(1,2)~=0
        x1 = 0;
    end
    if r>= Hand_Px1(1,2) && r <= Hand_Px1(1,2) + Hand_Px1(2,2) && Hand_Px1(2,2)~=0
        x1 =1;
    end
    if  r>=Hand_Px1(1,2) + Hand_Px1(2,2) && r<= Hand_Px1(1,2) + Hand_Px1(2,2) +Hand_Px1(3,2) && Hand_Px1(3,2)~=0
        x1 =2;
    end
    if r>= Hand_Px1(1,2) + Hand_Px1(2,2) +Hand_Px1(3,2) && r<=Hand_Px1(1,2) + Hand_Px1(2,2) +Hand_Px1(3,2) +Hand_Px1(4,2) && Hand_Px1(4,2)~=0
        x1 =3;
    end
    if r>=Hand_Px1(1,2) + Hand_Px1(2,2) +Hand_Px1(3,2) +Hand_Px1(4,2) && Hand_Px1(5,2)~=0
        x1 =4;
    end
    Hand_Independent_Sam.data(i,1) = x1;
    
    % generate x2
    r = rand(1);
    if (r <= Hand_Px2(1,2) && Hand_Px2(1,2)~=0)
        x2 = 0;
    end
    if (r>= Hand_Px2(1,2) && r <= Hand_Px2(1,2) + Hand_Px2(2,2) && Hand_Px2(2,2)~=0)
        x2 =1;
    end
    if  (r>=Hand_Px2(1,2) + Hand_Px2(2,2) && r<= Hand_Px2(1,2) + Hand_Px2(2,2) +Hand_Px2(3,2) && Hand_Px2(3,2)~=0)
        x2 =2;
    end
    if  (r>= Hand_Px2(1,2) + Hand_Px2(2,2) +Hand_Px2(3,2) && r<= Hand_Px2(1,2) + Hand_Px2(2,2) +Hand_Px2(3,2) +Hand_Px2(4,2) && Hand_Px2(4,2)~=0)
        x2 =3;
    end
    if (r>= Hand_Px2(1,2) + Hand_Px2(2,2) +Hand_Px2(3,2) +Hand_Px2(4,2)) && r<=Hand_Px2(1,2) + Hand_Px2(2,2) +Hand_Px2(3,2) +Hand_Px2(4,2)+Hand_Px2(5,2) && Hand_Px2(5,2)~=0
        x2=4;
    end
    if  r>=Hand_Px2(1,2) + Hand_Px2(2,2) +Hand_Px2(3,2) +Hand_Px2(4,2)+Hand_Px2(5,2) && Hand_Px2(6,2)~=0
        x2 =5;
    end
    Hand_Independent_Sam.data(i,2) = x2;
    
    % generate x3
    r = rand(1);
    if r <= Hand_Px3(1,2) && Hand_Px3(1,2)~=0
        x3 = 0;
    end
    if r>= Hand_Px3(1,2) && r <= Hand_Px3(1,2) + Hand_Px3(2,2) && Hand_Px3(2,2)~=0
        x3 =1;
    end
    if  r>=Hand_Px3(1,2) + Hand_Px3(2,2) && r<= Hand_Px3(1,2) + Hand_Px3(2,2) +Hand_Px3(3,2) && Hand_Px3(3,2)~=0
        x3 =2;
    end
    if r>= Hand_Px3(1,2) + Hand_Px3(2,2) +Hand_Px3(3,2) && r<=Hand_Px3(1,2) + Hand_Px3(2,2) +Hand_Px3(3,2) +Hand_Px3(4,2) && Hand_Px3(4,2)~=0
        x3 =3;
    end
    if r>=Hand_Px3(1,2) + Hand_Px3(2,2) +Hand_Px3(3,2) +Hand_Px3(4,2) && Hand_Px3(5,2)~=0
        x3 =4;
    end
    Hand_Independent_Sam.data(i,3) = x3;
    
    % generate x4
    r = rand(1);
    if r <= Hand_Px4(1,2) && Hand_Px4(1,2)~=0
        x4 = 0;
    end
    if r>= Hand_Px4(1,2) && r <= Hand_Px4(1,2) + Hand_Px4(2,2) && Hand_Px4(2,2)~=0
        x4 =1;
    end
    if  r>=Hand_Px4(1,2) + Hand_Px4(2,2) && r<= Hand_Px4(1,2) + Hand_Px4(2,2) +Hand_Px4(3,2) && Hand_Px4(3,2)~=0
        x4 =2;
    end
    if r>= Hand_Px4(1,2) + Hand_Px4(2,2) +Hand_Px4(3,2) && r<=Hand_Px4(1,2) + Hand_Px4(2,2) +Hand_Px4(3,2) +Hand_Px4(4,2) && Hand_Px4(4,2)~=0
        x4 =3;
    end
    if r>=Hand_Px4(1,2) + Hand_Px4(2,2) +Hand_Px4(3,2) +Hand_Px4(4,2) && Hand_Px4(5,2)~=0
        x4 =4;
    end
    Hand_Independent_Sam.data(i,4) = x4;
    
    % generate x5
    r = rand(1);
    if r <= Hand_Px5(1,2) && Hand_Px5(1,2)~=0
        x5 = 0;
    end
    if r>= Hand_Px5(1,2) && r <= Hand_Px5(1,2) + Hand_Px5(2,2) && Hand_Px5(2,2)~=0
        x5 =1;
    end
    if  r>=Hand_Px5(1,2) + Hand_Px5(2,2) && Hand_Px5(3,2)~=0
        x5 =2;
    end
    Hand_Independent_Sam.data(i,5) = x5;
    
    % generate x6
    r = rand(1);
    if r <= Hand_Px6(1,2) && Hand_Px6(1,2)~=0
        x6 = 0;
    end
    if r>= Hand_Px6(1,2) && r <= Hand_Px6(1,2) + Hand_Px6(2,2) && Hand_Px6(2,2)~=0
        x6 =1;
    end
    if  r>=Hand_Px6(1,2) + Hand_Px6(2,2) && r<= Hand_Px6(1,2) + Hand_Px6(2,2) +Hand_Px6(3,2) && Hand_Px6(3,2)~=0
        x6 =2;
    end
    if r>= Hand_Px6(1,2) + Hand_Px6(2,2) +Hand_Px6(3,2) && r<=Hand_Px6(1,2) + Hand_Px6(2,2) +Hand_Px6(3,2) +Hand_Px6(4,2) && Hand_Px6(4,2)~=0
        x6 =3;
    end
    if r>=Hand_Px6(1,2) + Hand_Px6(2,2) +Hand_Px6(3,2) +Hand_Px6(4,2) && Hand_Px6(5,2)~=0
        x6 =4;
    end
    Hand_Independent_Sam.data(i,6) = x6;
    
    
    % generate x7
    r = rand(1);
    if (r <= Hand_Px7(1,2)) && Hand_Px7(1,2)~=0
        x7 = 0;
    end
    if (r>= Hand_Px7(1,2) && r <= Hand_Px7(1,2) + Hand_Px7(2,2) && Hand_Px7(2,2)~=0)
        x7 =1;
    end
    if  (r>=Hand_Px7(1,2) + Hand_Px7(2,2) && r<= Hand_Px7(1,2) + Hand_Px7(2,2) +Hand_Px7(3,2) && Hand_Px7(3,2)~=0)
        x7 =2;
    end
    if  (r>= Hand_Px7(1,2) + Hand_Px7(2,2) +Hand_Px7(3,2) && r<= Hand_Px7(1,2) + Hand_Px7(2,2) +Hand_Px7(3,2) +Hand_Px7(4,2) && Hand_Px7(4,2)~=0)
        x7 =3;
    end
    if (r>= Hand_Px7(1,2) + Hand_Px7(2,2) +Hand_Px7(3,2) +Hand_Px7(4,2)) && r<=Hand_Px7(1,2) + Hand_Px7(2,2) +Hand_Px7(3,2) +Hand_Px7(4,2)+Hand_Px7(5,2) && Hand_Px7(5,2)~=0
        x7=4;
    end
    if  r>=Hand_Px7(1,2) + Hand_Px7(2,2) +Hand_Px7(3,2) +Hand_Px7(4,2)+Hand_Px7(5,2) && Hand_Px7(6,2)~=0
        x7 =5;
    end
    Hand_Independent_Sam.data(i,7) = x7;
    
    % generate x8
    r = rand(1);
    if r <= Hand_Px8(1,2) && Hand_Px8(1,2)~=0
        x8 = 0;
    end
    if r>= Hand_Px8(1,2) && r <= Hand_Px8(1,2) + Hand_Px8(2,2) && Hand_Px8(2,2)~=0
        x8 =1;
    end
    if  r>=Hand_Px8(1,2) + Hand_Px8(2,2) && r<= Hand_Px8(1,2) + Hand_Px8(2,2) +Hand_Px8(3,2) && Hand_Px8(3,2)~=0
        x8 =2;
    end
    if  r>= Hand_Px8(1,2) + Hand_Px8(2,2) +Hand_Px8(3,2)  && Hand_Px8(4,2)~=0
        x8 =3;
    end
    Hand_Independent_Sam.data(i,8) = x8;
    
    % generate x9
    r = rand(1);
    if r <= Hand_Px9(1,2) && Hand_Px9(1,2)~=0
        x9 = 0;
    end
    if r>= Hand_Px9(1,2) && r <= Hand_Px9(1,2) + Hand_Px9(2,2) && Hand_Px9(2,2)~=0
        x9 =1;
    end
    if  r>=Hand_Px9(1,2) + Hand_Px9(2,2) && r<= Hand_Px9(1,2) + Hand_Px9(2,2) +Hand_Px9(3,2) && Hand_Px9(3,2)~=0
        x9 =2;
    end
    Hand_Independent_Sam.data(i,9) = x9;  
end
for i =1:M
    for j =1:rowsHp
        flag = isequal(Hand_Independent_Sam.data(i,:),truthHandprint.data(j,:));
        if flag ==1
            Hand_Independent_Sam.textdata(i,:)=truthHandprint.textdata(j,:);
            break;
        end
    end
end
end
for i =1:M
    x1 = Hand_Independent_Sam.data(i,1);
    x2 = Hand_Independent_Sam.data(i,2);
    x3 = Hand_Independent_Sam.data(i,3);
    x4 = Hand_Independent_Sam.data(i,4);
    x5 = Hand_Independent_Sam.data(i,5);
    x6 = Hand_Independent_Sam.data(i,6);
    x7 = Hand_Independent_Sam.data(i,7);
    x8 = Hand_Independent_Sam.data(i,8);  
    x9 = Hand_Independent_Sam.data(i,9);
    Hand_Independent_Sam.data(i,10)=Hand_Px1(x1+1,2)*Hand_Px2(x2+1,2)*Hand_Px3(x3+1,2)*Hand_Px4(x4+1,2)*Hand_Px5(x5+1,2)*Hand_Px6(x6+1,2)*Hand_Px7(x7+1,2)*Hand_Px8(x8+1,2)*Hand_Px9(x9+1,2);
end
% Ancestral samplings for Cursive writing under graph(a)
Cur_Sam.data = zeros(M,9);
for k=1:10
for i=1:M
    % generate x1
    r = rand(1);
    if r <= Cur_Px1(1,2) && Cur_Px1(1,2)~=0
        x1 = 0;
    end
    if r>= Cur_Px1(1,2) && r <= Cur_Px1(1,2) + Cur_Px1(2,2) && Cur_Px1(2,2)~=0
        x1 =1;
    end
    if  r>=Cur_Px1(1,2) + Cur_Px1(2,2) && r<= Cur_Px1(1,2) + Cur_Px1(2,2) +Cur_Px1(3,2) && Cur_Px1(3,2)~=0
        x1 =2;
    end
    if r>= Cur_Px1(1,2) + Cur_Px1(2,2) +Cur_Px1(3,2) && Cur_Px1(4,2)~=0
        x1 =3;
    end
    Cur_Sam.data(i,1) = x1;
    
    % generate x3
    r = rand(1);
    if r <= Cur_Px3(1,2)  && Cur_Px3(1,2)~=0
        x3 = 0;
    end
    if r>= Cur_Px3(1,2) && r <= Cur_Px3(1,2) + Cur_Px3(2,2) && Cur_Px3(2,2)~=0
        x3 =1;
    end
    if  r>=Cur_Px3(1,2) + Cur_Px3(2,2) && r<= Cur_Px3(1,2) + Cur_Px3(2,2) +Cur_Px3(3,2) && Cur_Px3(3,2)~=0
        x3 =2;
    end
    Cur_Sam.data(i,3) = x3;
   
    % generate x5
    r = rand(1);
    if r <= Cur_Px5(1,2) && Cur_Px5(1,2)~=0
        x5 = 0;
    end
    if r>= Cur_Px5(1,2) && r <= Cur_Px5(1,2) + Cur_Px5(2,2) && Cur_Px5(2,2)~=0
        x5 =1;
    end
    if  r>=Cur_Px5(1,2) + Cur_Px5(2,2) && r<= Cur_Px5(1,2) + Cur_Px5(2,2) +Cur_Px5(3,2) && Cur_Px5(3,2)~=0
        x5 =2;
    end
    if r>= Cur_Px5(1,2) + Cur_Px5(2,2) +Cur_Px5(3,2) && Cur_Px5(4,2)~=0
        x5 =3;
    end
    Cur_Sam.data(i,5) = x5;
    
    % generate x6
    r = rand(1);
    if r <= Cur_Px6(1,2) && Cur_Px6(1,2)~=0
        x6 = 0;
    end
    if r>= Cur_Px6(1,2) && r <= Cur_Px6(1,2) + Cur_Px6(2,2) && Cur_Px6(2,2)~=0
        x6 =1;
    end
    if  r>=Cur_Px6(1,2) + Cur_Px6(2,2) && r<= Cur_Px6(1,2) + Cur_Px6(2,2) +Cur_Px6(3,2) && Cur_Px6(3,2)~=0
        x6 =2;
    end
    if r>= Cur_Px6(1,2) + Cur_Px6(2,2) +Cur_Px6(3,2) && Cur_Px6(4,2)~=0
        x6 =3;
    end
    Cur_Sam.data(i,6) = x6;
  
    % generate x8
    r = rand(1);
    if r <= Cur_Px8(1,2) && Cur_Px8(1,2)~=0
        x8 = 0;
    end
    if r>= Cur_Px8(1,2) && r <= Cur_Px8(1,2) + Cur_Px8(2,2) && Cur_Px8(2,2)~=0
        x8 =1;
    end
    if  r>=Cur_Px8(1,2) + Cur_Px8(2,2) && r<= Cur_Px8(1,2) + Cur_Px8(2,2) +Cur_Px8(3,2) && Cur_Px8(3,2)~=0
        x8 =2;
    end
    if  r>= Cur_Px8(1,2) + Cur_Px8(2,2) +Cur_Px8(3,2) && r<= Cur_Px8(1,2) + Cur_Px8(2,2) +Cur_Px8(3,2) +Cur_Px8(4,2) && Cur_Px8(4,2)~=0
        x8 =3;
    end
    if r>= Cur_Px8(1,2) + Cur_Px8(2,2) +Cur_Px8(3,2) +Cur_Px8(4,2) && Cur_Px8(5,2)~=0
        x8=4;
    end
    Cur_Sam.data(i,8) = x8;
    
    % generate x2
    r = rand(1);
    if r<= Cur_Px2Gx1(Cur_Sam.data(i,1)+1,3) && Cur_Px2Gx1(Cur_Sam.data(i,1)+1,3)~=0
        x2 = 0;
    end
    if r>= Cur_Px2Gx1(Cur_Sam.data(i,1)+1,3) && r<= Cur_Px2Gx1(Cur_Sam.data(i,1)+1,3)+Cur_Px2Gx1(4+Cur_Sam.data(i,1)+1,3) && Cur_Px2Gx1(4+Cur_Sam.data(i,1)+1,3)~=0
        x2 = 1;
    end 
    if  r>= Cur_Px2Gx1(Cur_Sam.data(i,1)+1,3)+Cur_Px2Gx1(4+Cur_Sam.data(i,1)+1,3) && r<= Cur_Px2Gx1(Cur_Sam.data(i,1)+1,3)+Cur_Px2Gx1(4+Cur_Sam.data(i,1)+1,3)+Cur_Px2Gx1(8+Cur_Sam.data(i,1)+1,3) && Cur_Px2Gx1(8+Cur_Sam.data(i,1)+1,3)~=0
        x2 = 2;
    end 
    if  r>= Cur_Px2Gx1(Cur_Sam.data(i,1)+1,3)+Cur_Px2Gx1(4+Cur_Sam.data(i,1)+1,3)+Cur_Px2Gx1(8+Cur_Sam.data(i,1)+1,3) && r<= Cur_Px2Gx1(Cur_Sam.data(i,1)+1,3)+Cur_Px2Gx1(4+Cur_Sam.data(i,1)+1,3)+Cur_Px2Gx1(8+Cur_Sam.data(i,1)+1,3) + Cur_Px2Gx1(12+Cur_Sam.data(i,1)+1,3) && Cur_Px2Gx1(12+Cur_Sam.data(i,1)+1,3)~=0
        x2 = 3;
    end 
    if  r>= Cur_Px2Gx1(Cur_Sam.data(i,1)+1,3)+Cur_Px2Gx1(4+Cur_Sam.data(i,1)+1,3)+Cur_Px2Gx1(8+Cur_Sam.data(i,1)+1,3) + Cur_Px2Gx1(12+Cur_Sam.data(i,1)+1,3) && r<= Cur_Px2Gx1(Cur_Sam.data(i,1)+1,3)+Cur_Px2Gx1(4+Cur_Sam.data(i,1)+1,3)+Cur_Px2Gx1(8+Cur_Sam.data(i,1)+1,3) + Cur_Px2Gx1(12+Cur_Sam.data(i,1)+1,3)+Cur_Px2Gx1(16+Cur_Sam.data(i,1)+1,3) && Cur_Px2Gx1(16+Cur_Sam.data(i,1)+1,3)~=0
        x2 = 4;
    end 
    Cur_Sam.data(i,2) = x2;
    
    % generate x4
    r = rand(1);
    if r <= Cur_Px4Gx3x5(Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) && Cur_Px4Gx3x5(Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4)~=0
        x4=0;
    end
    if r >= Cur_Px4Gx3x5(Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) && r<=Cur_Px4Gx3x5(Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) + Cur_Px4Gx3x5(12+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) && Cur_Px4Gx3x5(12+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4)~=0
        x4=1;
    end
    if r>=Cur_Px4Gx3x5(Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) + Cur_Px4Gx3x5(12+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) && r<=Cur_Px4Gx3x5(Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) + Cur_Px4Gx3x5(12+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4)+Cur_Px4Gx3x5(24+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) && Cur_Px4Gx3x5(24+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4)~=0
        x4=2;
    end
    if  r>=Cur_Px4Gx3x5(Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) + Cur_Px4Gx3x5(12+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4)+Cur_Px4Gx3x5(24+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) && r<=Cur_Px4Gx3x5(Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) + Cur_Px4Gx3x5(12+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4)+Cur_Px4Gx3x5(24+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4)+Cur_Px4Gx3x5(36+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) && Cur_Px4Gx3x5(36+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4)~=0
        x4=3;
    end
    if  r>=Cur_Px4Gx3x5(Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) + Cur_Px4Gx3x5(12+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4)+Cur_Px4Gx3x5(24+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4)+Cur_Px4Gx3x5(36+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) && r<=Cur_Px4Gx3x5(Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) + Cur_Px4Gx3x5(12+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4)+Cur_Px4Gx3x5(24+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4)+Cur_Px4Gx3x5(36+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4)+Cur_Px4Gx3x5(48+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4) && Cur_Px4Gx3x5(48+Cur_Sam.data(i,3)*4+Cur_Sam.data(i,5)+1,4)~=0
        x4=4;
    end
    Cur_Sam.data(i,4) = x4;
    
     % generate x7
    r = rand(1);
    if r <= Cur_Px7Gx6x8(Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4) && Cur_Px7Gx6x8(Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4)~=0
        x7=0;
    end
    if r >= Cur_Px7Gx6x8(Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4) && r<=Cur_Px7Gx6x8(Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4) + Cur_Px7Gx6x8(20+Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4) && Cur_Px7Gx6x8(20+Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4)~=0
        x7=1;
    end
    if r>=Cur_Px7Gx6x8(Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4) + Cur_Px7Gx6x8(20+Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4) && r<=Cur_Px7Gx6x8(Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4) + Cur_Px7Gx6x8(20+Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4)+Cur_Px7Gx6x8(40+Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4) && Cur_Px7Gx6x8(40+Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4)~=0
        x7=2;
    end
    if  r>=Cur_Px7Gx6x8(Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4) + Cur_Px7Gx6x8(20+Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4)+Cur_Px7Gx6x8(40+Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4) && r<=Cur_Px7Gx6x8(Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4) + Cur_Px7Gx6x8(20+Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4)+Cur_Px7Gx6x8(40+Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4)+Cur_Px7Gx6x8(60+Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4) && Cur_Px7Gx6x8(60+Cur_Sam.data(i,6)*5+Cur_Sam.data(i,8)+1,4)~=0
        x7=3;
    end
    Cur_Sam.data(i,7) = x7;
    
     % generate x9
    r = rand(1);
    if r <= Cur_Px9Gx2x4x7(Cur_Sam.data(i,2)*20+Cur_Sam.data(i,4)*4+Cur_Sam.data(i,7)+1,5) && Cur_Px9Gx2x4x7(Cur_Sam.data(i,2)*20+Cur_Sam.data(i,5)*4+Cur_Sam.data(i,7)+1,5)~=0
        x9=0;
    end
    if r >= Cur_Px9Gx2x4x7(Cur_Sam.data(i,2)*20+Cur_Sam.data(i,5)*4+Cur_Sam.data(i,7)+1,5) && r<=Cur_Px9Gx2x4x7(Cur_Sam.data(i,2)*20+Cur_Sam.data(i,5)*4+Cur_Sam.data(i,7)+1,5) + Cur_Px9Gx2x4x7(100+Cur_Sam.data(i,2)*20+Cur_Sam.data(i,5)*4+Cur_Sam.data(i,7)+1,5) && Cur_Px9Gx2x4x7(100+Cur_Sam.data(i,2)*20+Cur_Sam.data(i,5)*4+Cur_Sam.data(i,7)+1,5)~=0
        x9=1;
    end
    if r>=Cur_Px9Gx2x4x7(Cur_Sam.data(i,2)*20+Cur_Sam.data(i,5)*4+Cur_Sam.data(i,7)+1,5) + Cur_Px9Gx2x4x7(100+Cur_Sam.data(i,2)*20+Cur_Sam.data(i,5)*4+Cur_Sam.data(i,7)+1,5) && r<=Cur_Px9Gx2x4x7(Cur_Sam.data(i,2)*20+Cur_Sam.data(i,5)*4+Cur_Sam.data(i,7)+1,5) + Cur_Px9Gx2x4x7(100+Cur_Sam.data(i,2)*20+Cur_Sam.data(i,5)*4+Cur_Sam.data(i,7)+1,5)+Cur_Px9Gx2x4x7(200+Cur_Sam.data(i,2)*20+Cur_Sam.data(i,5)*4+Cur_Sam.data(i,7)+1,5) && Cur_Px9Gx2x4x7(200+Cur_Sam.data(i,2)*20+Cur_Sam.data(i,5)*4+Cur_Sam.data(i,7)+1,5)~=0
        x9=2;
    end
    Cur_Sam.data(i,9) = x9;
end
for i =1:M
    for j =1:rows
        flag = isequal(Cur_Sam.data(i,:),truthCursive.data(j,:));
        if flag ==1
            Cur_Sam.textdata(i,:)=truthCursive.textdata(j,:);
            break;
        end
    end
end
end

for i =1:M
    x1 = Cur_Sam.data(i,1);
    x2 = Cur_Sam.data(i,2);
    x3 = Cur_Sam.data(i,3);
    x4 = Cur_Sam.data(i,4);
    x5 = Cur_Sam.data(i,5);
    x6 = Cur_Sam.data(i,6);
    x7 = Cur_Sam.data(i,7);
    x8 = Cur_Sam.data(i,8);  
    x9 = Cur_Sam.data(i,9);
    Cur_Sam.data(i,10)=Cur_Px1(x1+1,2)*Cur_Px2Gx1(x2*4+x1+1,3)*Cur_Px3(x3+1,2)*Cur_Px4Gx3x5(x4*12+x3*4+x5+1,4)*Cur_Px5(x5+1,2)*Cur_Px6(x6+1,2)*Cur_Px7Gx6x8(x7*20+x6*5+x8+1,4)*Cur_Px8(x8+1,2)*Cur_Px9Gx2x4x7(x9*100+x2*20+x4*4+x7+1,5); 
end    
% Ancestral samplings for Hand print writing under graph(b)
Hand_Sam.data = zeros(M,9);
for k=1:10
for i=1:M
    % generate x3
    r = rand(1);
    if r <= Hand_Px3(1,2) && Hand_Px3(1,2)~=0
        x3 = 0;
    end
    if r>= Hand_Px3(1,2) && r <= Hand_Px3(1,2) + Hand_Px3(2,2) && Hand_Px3(2,2)~=0
        x3 =1;
    end
    if  r>=Hand_Px3(1,2) + Hand_Px3(2,2) && r<= Hand_Px3(1,2) + Hand_Px3(2,2) +Hand_Px3(3,2) && Hand_Px3(3,2)~=0
        x3 =2;
    end
    if r>= Hand_Px3(1,2) + Hand_Px3(2,2) +Hand_Px3(3,2) && r<=Hand_Px3(1,2) + Hand_Px3(2,2) +Hand_Px3(3,2) +Hand_Px3(4,2) && Hand_Px3(4,2)~=0
        x3 =3;
    end
    if r>=Hand_Px3(1,2) + Hand_Px3(2,2) +Hand_Px3(3,2) +Hand_Px3(4,2) && Hand_Px3(5,2)~=0
        x3 =4;
    end
    Hand_Sam.data(i,3) = x3;
   
    % generate x9
    r = rand(1);
    if r <= Hand_Px9(1,2) && Hand_Px9(1,2)~=0
        x9 = 0;
    end
    if r>= Hand_Px9(1,2) && r <= Hand_Px9(1,2) + Hand_Px9(2,2) && Hand_Px9(2,2)~=0
        x9 =1;
    end
    if  r>=Hand_Px9(1,2) + Hand_Px9(2,2) && r<= Hand_Px9(1,2) + Hand_Px9(2,2) +Hand_Px9(3,2) && Hand_Px9(3,2)~=0
        x9 =2;
    end
    Hand_Sam.data(i,9) = x9;  
    
    % generate x5
    r = rand(1);
    if r<= Hand_Px5Gx3(Hand_Sam.data(i,3)+1,3) && Hand_Px5Gx3(Hand_Sam.data(i,3)+1,3)~=0
        x5 =0;
    end
    if r>= Hand_Px5Gx3(Hand_Sam.data(i,3)+1,3) && r<=Hand_Px5Gx3(Hand_Sam.data(i,3)+1,3)+Hand_Px5Gx3(5+Hand_Sam.data(i,3)+1,3) && Hand_Px5Gx3(5+Hand_Sam.data(i,3)+1,3)~=0
        x5 =1;
    end
    if r>=Hand_Px5Gx3(Hand_Sam.data(i,3)+1,3)+Hand_Px5Gx3(5+Hand_Sam.data(i,3)+1,3) && r<=Hand_Px5Gx3(Hand_Sam.data(i,3)+1,3)+Hand_Px5Gx3(5+Hand_Sam.data(i,3)+1,3)+Hand_Px5Gx3(10+Hand_Sam.data(i,3)+1,3) && Hand_Px5Gx3(10+Hand_Sam.data(i,3)+1,3)~=0
        x5 =2;
    end
    Hand_Sam.data(i,5) = x5; 
    
    % generate x2
    r = rand(1);
    if r<= Hand_Px2Gx3x5(Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4) && Hand_Px2Gx3x5(Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)~=0
        x2 =0;
    end
    if r>= Hand_Px2Gx3x5(Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4) && r<=Hand_Px2Gx3x5(Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(15+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4) && Hand_Px2Gx3x5(15+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)~=0
        x2 =1;
    end
    if r>=Hand_Px2Gx3x5(Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(15+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4) && r<=Hand_Px2Gx3x5(Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(15+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(30+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4) && Hand_Px2Gx3x5(30+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)~=0
        x2 =2;
    end
    if  r>=Hand_Px2Gx3x5(Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(15+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(30+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4) && r<=Hand_Px2Gx3x5(Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(15+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(30+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(45+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4) && Hand_Px2Gx3x5(45+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)~=0
        x2 =3;
    end
    if  r>=Hand_Px2Gx3x5(Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(15+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(30+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(45+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4) && r<=Hand_Px2Gx3x5(Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(15+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(30+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(45+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(60+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4) && Hand_Px2Gx3x5(60+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)~=0
        x2 =4;
    end
    if  r>=Hand_Px2Gx3x5(Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(15+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(30+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(45+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(60+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4) && r<=Hand_Px2Gx3x5(Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(15+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(30+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(45+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px2Gx3x5(60+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4) +Hand_Px2Gx3x5(75+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)&& Hand_Px2Gx3x5(75+Hand_Sam.data(i,3)*3+Hand_Sam.data(i,5)+1,4)~=0
        x2 =5;
    end
    Hand_Sam.data(i,2) = x2; 
    
    % generate x4
    r = rand(1);
    if r<= Hand_Px4Gx2x3(Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4) && Hand_Px4Gx2x3(Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)~=0
        x4 =0;
    end
    if r>= Hand_Px4Gx2x3(Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4) && r<=Hand_Px4Gx2x3(Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(30+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4) && Hand_Px4Gx2x3(30+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)~=0
        x4 =1;
    end
    if r>=Hand_Px4Gx2x3(Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(30+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4) && r<=Hand_Px4Gx2x3(Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(30+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(60+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4) && Hand_Px4Gx2x3(60+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)~=0
        x4 =2;
    end
    if  r>=Hand_Px4Gx2x3(Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(30+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(60+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4) && r<=Hand_Px4Gx2x3(Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(30+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(60+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(90+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4) && Hand_Px4Gx2x3(90+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)~=0
        x4 =3;
    end
    if  r>=Hand_Px4Gx2x3(Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(30+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(60+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(90+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4) && r<=Hand_Px4Gx2x3(Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(30+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(60+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(90+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)+Hand_Px4Gx2x3(120+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4) && Hand_Px4Gx2x3(120+Hand_Sam.data(i,2)*5+Hand_Sam.data(i,3)+1,4)~=0
        x4 =4;
    end
    Hand_Sam.data(i,4) = x4; 
    
    % generate x6
    r = rand(1);
    if r<= Hand_Px6Gx2x5(Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4) && Hand_Px6Gx2x5(Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)~=0
        x6 =0;
    end
    if r>= Hand_Px6Gx2x5(Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4) && r<=Hand_Px6Gx2x5(Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(18+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4) && Hand_Px6Gx2x5(18+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)~=0
        x6 =1;
    end
    if r>=Hand_Px6Gx2x5(Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(18+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4) && r<=Hand_Px6Gx2x5(Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(18+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(36+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4) && Hand_Px6Gx2x5(36+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)~=0
        x6 =2;
    end
    if  r>=Hand_Px6Gx2x5(Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(18+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(36+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4) && r<=Hand_Px6Gx2x5(Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(18+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(36+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(54+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4) && Hand_Px6Gx2x5(54+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)~=0
        x6 =3;
    end
    if  r>=Hand_Px6Gx2x5(Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(18+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(36+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(54+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4) && r<=Hand_Px6Gx2x5(Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(18+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(36+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(54+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)+Hand_Px6Gx2x5(72+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4) && Hand_Px6Gx2x5(72+Hand_Sam.data(i,2)*3+Hand_Sam.data(i,5)+1,4)~=0
        x6 =4;
    end
    Hand_Sam.data(i,6) = x6; 
    
    % generate x8
    r = rand(1);
    if r<= Hand_Px8Gx5x6(Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4) && Hand_Px8Gx5x6(Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4)~=0
        x8 =0;
    end
    if r>= Hand_Px8Gx5x6(Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4) && r<=Hand_Px8Gx5x6(Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4)+Hand_Px8Gx5x6(15+Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4) && Hand_Px8Gx5x6(15+Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4)~=0
        x8 =1;
    end
    if r>=Hand_Px8Gx5x6(Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4)+Hand_Px8Gx5x6(15+Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4) && r<=Hand_Px8Gx5x6(Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4)+Hand_Px8Gx5x6(15+Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4)+Hand_Px8Gx5x6(30+Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4) && Hand_Px8Gx5x6(30+Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4)~=0
        x8 =2;
    end
    if  r>=Hand_Px8Gx5x6(Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4)+Hand_Px8Gx5x6(15+Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4)+Hand_Px8Gx5x6(30+Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4) && r<=Hand_Px8Gx5x6(Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4)+Hand_Px8Gx5x6(15+Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4)+Hand_Px8Gx5x6(30+Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4)+Hand_Px8Gx5x6(45+Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4) && Hand_Px8Gx5x6(45+Hand_Sam.data(i,5)*5+Hand_Sam.data(i,6)+1,4)~=0
        x8 =3;
    end
    Hand_Sam.data(i,8) = x8; 
    
    % generate x1
    r = rand(1);
    if r<= Hand_Px1Gx5x6x8(Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5) && Hand_Px1Gx5x6x8(Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)~=0
        x1 =0;
    end
    if r>= Hand_Px1Gx5x6x8(Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5) && r<=Hand_Px1Gx5x6x8(Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(60+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5) && Hand_Px1Gx5x6x8(60+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)~=0
        x1 =1;
    end
    if r>=Hand_Px1Gx5x6x8(Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(60+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5) && r<=Hand_Px1Gx5x6x8(Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(60+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(120+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5) && Hand_Px1Gx5x6x8(120+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)~=0
        x1 =2;
    end
    if  r>=Hand_Px1Gx5x6x8(Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(60+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(120+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5) && r<=Hand_Px1Gx5x6x8(Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(60+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(120+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(180+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5) && Hand_Px1Gx5x6x8(180+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)~=0
        x1 =3;
    end
    if  r>=Hand_Px1Gx5x6x8(Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(60+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(120+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(180+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5) && r<=Hand_Px1Gx5x6x8(Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(60+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(120+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)+Hand_Px1Gx5x6x8(180+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5) + Hand_Px1Gx5x6x8(240+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5) && Hand_Px1Gx5x6x8(240+Hand_Sam.data(i,5)*20+Hand_Sam.data(i,6)*4+Hand_Sam.data(i,8)+1,5)~=0
        x1 =4;
    end
    Hand_Sam.data(i,1) = x1; 
    
     % generate x7
    r = rand(1);
    if r<= Hand_Px7Gx3x4x6(Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5) && Hand_Px7Gx3x4x6(Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)~=0
        x7 =0;
    end
    if r>= Hand_Px7Gx3x4x6(Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5) && r<=Hand_Px7Gx3x4x6(Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(125+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5) && Hand_Px7Gx3x4x6(125+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)~=0
        x7 =1;
    end
    if r>=Hand_Px7Gx3x4x6(Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(125+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5) && r<=Hand_Px7Gx3x4x6(Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(125+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(250+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5) && Hand_Px7Gx3x4x6(250+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)~=0
        x7 =2;
    end
    if  r>=Hand_Px7Gx3x4x6(Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(125+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(250+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5) && r<=Hand_Px7Gx3x4x6(Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(125+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(250+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(375+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5) && Hand_Px7Gx3x4x6(375+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)~=0
        x7 =3;
    end
    if  r>=Hand_Px7Gx3x4x6(Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(125+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(250+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(375+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5) && r<=Hand_Px7Gx3x4x6(Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(125+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(250+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(375+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5) + Hand_Px7Gx3x4x6(500+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5) && Hand_Px7Gx3x4x6(500+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)~=0
        x7 =4;
    end
    if  r>=Hand_Px7Gx3x4x6(Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(125+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(250+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(375+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5) + Hand_Px7Gx3x4x6(500+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5) && r<=Hand_Px7Gx3x4x6(Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(125+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(250+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(375+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5) + Hand_Px7Gx3x4x6(500+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)+Hand_Px7Gx3x4x6(625+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)&& Hand_Px7Gx3x4x6(625+Hand_Sam.data(i,3)*25+Hand_Sam.data(i,4)*5+Hand_Sam.data(i,6)+1,5)~=0
        x7 =5;
    end
    Hand_Sam.data(i,7) = x7;   
end
for i =1:M
    for j =1:rowsHp
        flag = isequal(Hand_Sam.data(i,:),truthHandprint.data(j,:));
        if flag ==1
            Hand_Sam.textdata(i,:)=truthHandprint.textdata(j,:);
            break;
        end
    end
end
end
for i =1:M
    x1 = Hand_Sam.data(i,1);
    x2 = Hand_Sam.data(i,2);
    x3 = Hand_Sam.data(i,3);
    x4 = Hand_Sam.data(i,4);
    x5 = Hand_Sam.data(i,5);
    x6 = Hand_Sam.data(i,6);
    x7 = Hand_Sam.data(i,7);
    x8 = Hand_Sam.data(i,8);  
    x9 = Hand_Sam.data(i,9);
    Hand_Sam.data(i,10)=Hand_Px1Gx5x6x8(x1*60+x5*20+x6*4+x8+1,5)*Hand_Px2Gx3x5(x2*15+x3*3+x5+1,4)*Hand_Px3(x3+1,2)*Hand_Px4Gx2x3(x4*30+x2*5+x3+1,4)*Hand_Px5Gx3(x5*5+x3+1,3)*Hand_Px6Gx2x5(x6*18+x2*3+x5+1,4)*Hand_Px7Gx3x4x6(x7*125+x3*25+x4*5+x6+1,5)*Hand_Px8Gx5x6(x8*15+x5*5+x6+1,4)*Hand_Px9(x9+1,2); 
end