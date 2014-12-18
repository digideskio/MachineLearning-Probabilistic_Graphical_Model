% Project Two: Probabilistic Graphical Models
% Author: Xiujiao Gao
% Parameter Estimation

% Some explanations
% P_Cur_Px1Gx2x3 means the probability of x1 given x2 and x3 for Cursive one
% Example: 0 1 2 0.3 means the p(x1=0|x2=1,x3=2)=0.3
% P_Hand_Px1Gx2x3 means the probability of x1 given x2 and x3 for Hand print one
% P_Cur_Px1 means marginal probability of x1 for Cursive one
% P_Cur_Px1x5 means joint probability of P(x1,x2) for Cursive one
% P_Cur_Px1-9 means the joint probability of P(x1,x2,x3,x4,x5,x6,x7,x8,x9) for Cursive one
% P_Hand_Px1 means marginal probability of x1 for Hand print one
% P_Hand_Px1x5 means joint probability of P(x1,x2) for Hand print one
% P_Hand_Px1-9 means the joint probability of P(x1,x2,x3,x4,x5,x6,x7,x8,x9) for Hand print one
% All the version without 'P_' as prefix are num format version(such as Cur_Px1,Cur_Px2Gx1,Hand_Px1Gx5x6x8 and so on), which are
% used for estimation,sampling and inference

global Cur_Px1;global Cur_Px2;global Cur_Px3;global Cur_Px4;global Cur_Px5;global Cur_Px6;global Cur_Px7;global Cur_Px8;global Cur_Px9;
global Cur_Px2Gx1; global Cur_Px4Gx3x5; global Cur_Px7Gx6x8; global Cur_Px9Gx2x4x7;
global Hand_Px1;global Hand_Px2;global Hand_Px3;global Hand_Px4;global Hand_Px5;global Hand_Px6;global Hand_Px7;global Hand_Px8;global Hand_Px9;
global Hand_Px1Gx5x6x8; global Hand_Px2Gx3x5; global Hand_Px4Gx2x3; global Hand_Px5Gx3; global Hand_Px6Gx2x5; global Hand_Px7Gx3x4x6; global Hand_Px8Gx5x6;

% All variables are assumed to be independent 
% Cursive writing 
% feature demension
CursiveFeature =[4 5 3 5 4 4 4 5 3];
% load data
truthCursive = importdata('truthCursive.txt');
[rows,columns] = size(truthCursive.data);

Cur_Px1 = zeros(4,2);
for i=1:CursiveFeature(1)
    Cur_Px1(i,1) = i-1;
    temp = find(truthCursive.data(:,1)==Cur_Px1(i,1));
    Cur_Px1(i,2)= length(temp)/rows;
end
 P_Cur_Px1 = num2str(Cur_Px1)
 
 Cur_Px2 = zeros(5,2);
for i=1:CursiveFeature(2)
    Cur_Px2(i,1) = i-1;
    temp = find(truthCursive.data(:,2)==Cur_Px2(i,1));
    Cur_Px2(i,2)= length(temp)/rows;
end
 P_Cur_Px2 = num2str(Cur_Px2)
 
 Cur_Px3 = zeros(3,2);
for i=1:CursiveFeature(3)
    Cur_Px3(i,1) = i-1;
    temp = find(truthCursive.data(:,3)==Cur_Px3(i,1));
    Cur_Px3(i,2)= length(temp)/rows;
end
P_Cur_Px3 = num2str(Cur_Px3)

 Cur_Px4 = zeros(5,2);
for i=1:CursiveFeature(4)
    Cur_Px4(i,1) = i-1;
    temp = find(truthCursive.data(:,4)==Cur_Px4(i,1));
    Cur_Px4(i,2)= length(temp)/rows;
end
 P_Cur_Px4 = num2str(Cur_Px4)

 Cur_Px5 = zeros(4,2);
for i=1:CursiveFeature(5)
    Cur_Px5(i,1) = i-1;
    temp = find(truthCursive.data(:,5)==Cur_Px5(i,1));
    Cur_Px5(i,2)= length(temp)/rows;
end
 P_Cur_Px5 = num2str(Cur_Px5)
 
 Cur_Px6 = zeros(4,2);
for i=1:CursiveFeature(6)
    Cur_Px6(i,1) = i-1;
    temp = find(truthCursive.data(:,6)==Cur_Px6(i,1));
    Cur_Px6(i,2)= length(temp)/rows;
end
 P_Cur_Px6 = num2str(Cur_Px6)

 Cur_Px7 = zeros(4,2);
for i=1:CursiveFeature(7)
    Cur_Px7(i,1) = i-1;
    temp = find(truthCursive.data(:,7)==Cur_Px7(i,1));
    Cur_Px7(i,2)= length(temp)/rows;
end
 P_Cur_Px7 = num2str(Cur_Px7)
 
 Cur_Px8 = zeros(5,2);
for i=1:CursiveFeature(8)
    Cur_Px8(i,1) = i-1;
    temp = find(truthCursive.data(:,8)==Cur_Px8(i,1));
    Cur_Px8(i,2)= length(temp)/rows;
end
 P_Cur_Px8 = num2str(Cur_Px8)
 
 Cur_Px9 = zeros(3,2);
for i=1:CursiveFeature(9)
    Cur_Px9(i,1) = i-1;
    temp = find(truthCursive.data(:,9)==Cur_Px9(i,1));
    Cur_Px9(i,2)= length(temp)/rows;
end
 P_Cur_Px9 = num2str(Cur_Px9)
 
% Hand-print writing 
% feature demension
HandPrintFeature = [5 6 5 5 3 5 6 4 3];
% load data
truthHandprint = importdata('truthHandprint.txt');
[rowsHp,columnsHp] = size(truthHandprint.data);
 Hand_Px1 = zeros(5,2);
for i=1:HandPrintFeature(1)
    Hand_Px1(i,1) = i-1;
    temp = find(truthHandprint.data(:,1)==Hand_Px1(i,1));
    Hand_Px1(i,2)= length(temp)/rowsHp;
end
 P_Hand_Px1 = num2str(Hand_Px1)
 
 Hand_Px2 = zeros(6,2);
for i=1:HandPrintFeature(2)
    Hand_Px2(i,1) = i-1;
    temp = find(truthHandprint.data(:,2)==Hand_Px2(i,1));
    Hand_Px2(i,2)= length(temp)/rowsHp;
end
 P_Hand_Px2 = num2str(Hand_Px2)
 
 Hand_Px3 = zeros(5,2);
for i=1:HandPrintFeature(3)
    Hand_Px3(i,1) = i-1;
    temp = find(truthHandprint.data(:,3)==Hand_Px3(i,1));
    Hand_Px3(i,2)= length(temp)/rowsHp;
end
 P_Hand_Px3 = num2str(Hand_Px3)

 Hand_Px4 = zeros(5,2);
for i=1:HandPrintFeature(4)
    Hand_Px4(i,1) = i-1;
    temp = find(truthHandprint.data(:,4)==Hand_Px4(i,1));
    Hand_Px4(i,2)= length(temp)/rowsHp;
end
 P_Hand_Px4 = num2str(Hand_Px4)

 Hand_Px5 = zeros(3,2);
for i=1:HandPrintFeature(5)
    Hand_Px5(i,1) = i-1;
    temp = find(truthHandprint.data(:,5)==Hand_Px5(i,1));
    Hand_Px5(i,2)= length(temp)/rowsHp;
end
 P_Hand_Px5 = num2str(Hand_Px5)
 
 Hand_Px6 = zeros(5,2);
for i=1:HandPrintFeature(6)
    Hand_Px6(i,1) = i-1;
    temp = find(truthHandprint.data(:,6)==Hand_Px6(i,1));
    Hand_Px6(i,2)= length(temp)/rowsHp;
end
 P_Hand_Px6 = num2str(Hand_Px6)

 Hand_Px7 = zeros(6,2);
for i=1:HandPrintFeature(7)
    Hand_Px7(i,1) = i-1;
    temp = find(truthHandprint.data(:,7)==Hand_Px7(i,1));
    Hand_Px7(i,2)= length(temp)/rowsHp;
end
 P_Hand_Px7 = num2str(Hand_Px7)
 
 Hand_Px8 = zeros(4,2);
for i=1:HandPrintFeature(8)
    Hand_Px8(i,1) = i-1;
    temp = find(truthHandprint.data(:,8)==Hand_Px8(i,1));
    Hand_Px8(i,2)= length(temp)/rowsHp;
end
 P_Hand_Px8 = num2str(Hand_Px8)
 
 Hand_Px9 = zeros(3,2);
for i=1:HandPrintFeature(9)
    Hand_Px9(i,1) = i-1;
    temp = find(truthHandprint.data(:,9)==Hand_Px9(i,1));
    Hand_Px9(i,2)= length(temp)/rowsHp;
end
 P_Hand_Px9 = num2str(Hand_Px9)

% Cursive writing based on graph(a)
% Cur_Px1,Cur_Px3,Cur_Px5,Cur_Px6 and Cur_Px8 already are computed 
 Cur_Px2Gx1 = zeros(4*5,3);
for i=1:20
    Cur_Px2Gx1(i,1)=floor((i-1)/4);
    Cur_Px2Gx1(i,2)=mod((i-1),4);
    temp1 =0;
    temp2 =0;
    for j=1:rows
        if(truthCursive.data(j,1)==Cur_Px2Gx1(i,2))
            temp1 = temp1 +1;
        end
        if(truthCursive.data(j,1)==Cur_Px2Gx1(i,2) && truthCursive.data(j,2)==Cur_Px2Gx1(i,1))
            temp2 = temp2 +1;
        end
    end
    if(temp1 ==0)
        Cur_Px2Gx1(i,3) =0;
    else
        Cur_Px2Gx1(i,3) = temp2/temp1;
    end
end
P_Cur_Px2Gx1 = num2str(Cur_Px2Gx1)

 Cur_Px4Gx3x5 = zeros(5*3*4,4);
for i = 1:5*3*4
    Cur_Px4Gx3x5(i,1) = floor((i-1)/12);
    Cur_Px4Gx3x5(i,2)= floor((i-12*Cur_Px4Gx3x5(i,1)-1)/4);
    Cur_Px4Gx3x5(i,3)= mod((i-12*Cur_Px4Gx3x5(i,1)-1),4);
    temp1 =0;
    temp2 =0;
    for j = 1:rows
        if(truthCursive.data(j,3)==Cur_Px4Gx3x5(i,2) && truthCursive.data(j,5)==Cur_Px4Gx3x5(i,3))
            temp1 = temp1 +1;
        end
        if((truthCursive.data(j,3)==Cur_Px4Gx3x5(i,2)) && (truthCursive.data(j,5)==Cur_Px4Gx3x5(i,3)) && (truthCursive.data(j,4)==Cur_Px4Gx3x5(i,1)))
            temp2 = temp2 +1;
        end
    end
    if(temp1 ==0)
        Cur_Px4Gx3x5(i,4) =0;
    else
        Cur_Px4Gx3x5(i,4) = temp2/temp1;
    end
end
P_Cur_Px4Gx3x5 = num2str(Cur_Px4Gx3x5)

 Cur_Px7Gx6x8 = zeros(4*4*5,4);
for i = 1:4*4*5
    Cur_Px7Gx6x8(i,1) = floor((i-1)/20);
    Cur_Px7Gx6x8(i,2)= floor((i-20*Cur_Px7Gx6x8(i,1)-1)/5);
    Cur_Px7Gx6x8(i,3)= mod((i-20*Cur_Px7Gx6x8(i,1)-1),5);
    temp1 =0;
    temp2 =0;
    for j = 1:rows
        if(truthCursive.data(j,6)==Cur_Px7Gx6x8(i,2) && truthCursive.data(j,8)==Cur_Px7Gx6x8(i,3))
            temp1 = temp1 +1;
        end
        if((truthCursive.data(j,6)==Cur_Px7Gx6x8(i,2)) && (truthCursive.data(j,8)==Cur_Px7Gx6x8(i,3)) && (truthCursive.data(j,7)==Cur_Px7Gx6x8(i,1)))
            temp2 = temp2 +1;
        end
    end
    if(temp1 ==0)
        Cur_Px7Gx6x8(i,4) =0;
    else
        Cur_Px7Gx6x8(i,4) = temp2/temp1;
    end
end
P_Cur_Px7Gx6x8 = num2str(Cur_Px7Gx6x8)

 Cur_Px9Gx2x4x7 = zeros(3*5*5*4,5);
for i = 1:3*5*5*4
    Cur_Px9Gx2x4x7(i,1) = floor((i-1)/100);
    Cur_Px9Gx2x4x7(i,2)= floor((i-100*Cur_Px9Gx2x4x7(i,1)-1)/20);
    Cur_Px9Gx2x4x7(i,3)= floor((i-100*Cur_Px9Gx2x4x7(i,1)-20*Cur_Px9Gx2x4x7(i,2)-1)/4);
    Cur_Px9Gx2x4x7(i,4)= mod((i-20*Cur_Px9Gx2x4x7(i,1)-20*Cur_Px9Gx2x4x7(i,2)-1),4);
    temp1 =0;
    temp2 =0;
    for j = 1:rows
        if(truthCursive.data(j,2)==Cur_Px9Gx2x4x7(i,2) && truthCursive.data(j,4)==Cur_Px9Gx2x4x7(i,3) && truthCursive.data(j,7)==Cur_Px9Gx2x4x7(i,4))
            temp1 = temp1 +1;
        end
        if(truthCursive.data(j,2)==Cur_Px9Gx2x4x7(i,2) && truthCursive.data(j,4)==Cur_Px9Gx2x4x7(i,3) && truthCursive.data(j,7)==Cur_Px9Gx2x4x7(i,4) && truthCursive.data(j,9)==Cur_Px9Gx2x4x7(i,1))
            temp2 = temp2 +1;
        end
    end
    if(temp1 ==0)
        Cur_Px9Gx2x4x7(i,5) =0;
    else
        Cur_Px9Gx2x4x7(i,5) = temp2/temp1;
    end
end
P_Cur_Px9Gx2x4x7 = num2str(Cur_Px9Gx2x4x7)

% Hand-print writing based on graph(b)
 Hand_Px5Gx3 = zeros(3*5,3);
for i=1:15
    Hand_Px5Gx3(i,1)=floor((i-1)/5);
    Hand_Px5Gx3(i,2)=mod((i-1),5);
    temp1 =0;
    temp2 =0;
    for j=1:rowsHp
        if(truthHandprint.data(j,3)==Hand_Px5Gx3(i,2))
            temp1 = temp1 +1;
        end
        if(truthHandprint.data(j,3)==Hand_Px5Gx3(i,2) && truthHandprint.data(j,5)==Hand_Px5Gx3(i,1))
            temp2 = temp2 +1;
        end
    end
    if(temp1 ==0)
        Hand_Px5Gx3(i,3) =0;
    else
        Hand_Px5Gx3(i,3) = temp2/temp1;
    end
end
P_Hand_Px5Gx3 = num2str(Hand_Px5Gx3)

 Hand_Px2Gx3x5 = zeros(6*5*3,4);
for i = 1:6*5*3
    Hand_Px2Gx3x5(i,1) = floor((i-1)/15);
    Hand_Px2Gx3x5(i,2)= floor((i-15*Hand_Px2Gx3x5(i,1)-1)/3);
    Hand_Px2Gx3x5(i,3)= mod((i-15*Hand_Px2Gx3x5(i,1)-1),3);
    temp1 =0;
    temp2 =0;
    for j = 1:rowsHp
        if(truthHandprint.data(j,3)==Hand_Px2Gx3x5(i,2) && truthHandprint.data(j,5)==Hand_Px2Gx3x5(i,3))
            temp1 = temp1 +1;
        end
        if((truthHandprint.data(j,3)==Hand_Px2Gx3x5(i,2)) && (truthHandprint.data(j,5)==Hand_Px2Gx3x5(i,3)) && (truthHandprint.data(j,2)==Hand_Px2Gx3x5(i,1)))
            temp2 = temp2 +1;
        end
    end
    if(temp1 ==0)
        Hand_Px2Gx3x5(i,4) =0;
    else
        Hand_Px2Gx3x5(i,4) = temp2/temp1;
    end
end
P_Hand_Px2Gx3x5 = num2str(Hand_Px2Gx3x5)

 Hand_Px4Gx2x3 = zeros(5*6*5,4);
for i = 1:5*6*5
    Hand_Px4Gx2x3(i,1) = floor((i-1)/30);
    Hand_Px4Gx2x3(i,2)= floor((i-30*Hand_Px4Gx2x3(i,1)-1)/5);
    Hand_Px4Gx2x3(i,3)= mod((i-30*Hand_Px4Gx2x3(i,1)-1),5);
    temp1 =0;
    temp2 =0;
    for j = 1:rowsHp
        if(truthHandprint.data(j,2)==Hand_Px4Gx2x3(i,2) && truthHandprint.data(j,3)==Hand_Px4Gx2x3(i,3))
            temp1 = temp1 +1;
        end
        if((truthHandprint.data(j,2)==Hand_Px4Gx2x3(i,2)) && (truthHandprint.data(j,3)==Hand_Px4Gx2x3(i,3)) && (truthHandprint.data(j,4)==Hand_Px4Gx2x3(i,1)))
            temp2 = temp2 +1;
        end
    end
    if(temp1 ==0)
        Hand_Px4Gx2x3(i,4) =0;
    else
        Hand_Px4Gx2x3(i,4) = temp2/temp1;
    end
end
P_Hand_Px4Gx2x3 = num2str(Hand_Px4Gx2x3)

 Hand_Px6Gx2x5 = zeros(5*6*3,4);
for i = 1:5*6*3
    Hand_Px6Gx2x5(i,1) = floor((i-1)/18);
    Hand_Px6Gx2x5(i,2)= floor((i-18*Hand_Px6Gx2x5(i,1)-1)/3);
    Hand_Px6Gx2x5(i,3)= mod((i-18*Hand_Px6Gx2x5(i,1)-1),3);
    temp1 =0;
    temp2 =0;
    for j = 1:rowsHp
        if(truthHandprint.data(j,2)==Hand_Px6Gx2x5(i,2) && truthHandprint.data(j,5)==Hand_Px6Gx2x5(i,3))
            temp1 = temp1 +1;
        end
        if((truthHandprint.data(j,2)==Hand_Px6Gx2x5(i,2)) && (truthHandprint.data(j,5)==Hand_Px6Gx2x5(i,3)) && (truthHandprint.data(j,6)==Hand_Px6Gx2x5(i,1)))
            temp2 = temp2 +1;
        end
    end
    if(temp1 ==0)
        Hand_Px6Gx2x5(i,4) =0;
    else
        Hand_Px6Gx2x5(i,4) = temp2/temp1;
    end
end
P_Hand_Px6Gx2x5 = num2str(Hand_Px6Gx2x5)

 Hand_Px8Gx5x6 = zeros(4*3*5,4);
for i = 1:4*3*5
    Hand_Px8Gx5x6(i,1) = floor((i-1)/15);
    Hand_Px8Gx5x6(i,2)= floor((i-15*Hand_Px8Gx5x6(i,1)-1)/5);
    Hand_Px8Gx5x6(i,3)= mod((i-15*Hand_Px8Gx5x6(i,1)-1),5);
    temp1 =0;
    temp2 =0;
    for j = 1:rowsHp
        if(truthHandprint.data(j,5)==Hand_Px8Gx5x6(i,2) && truthHandprint.data(j,6)==Hand_Px8Gx5x6(i,3))
            temp1 = temp1 +1;
        end
        if((truthHandprint.data(j,5)==Hand_Px8Gx5x6(i,2)) && (truthHandprint.data(j,6)==Hand_Px8Gx5x6(i,3)) && (truthHandprint.data(j,8)==Hand_Px8Gx5x6(i,1)))
            temp2 = temp2 +1;
        end
    end
    if(temp1 ==0)
        Hand_Px8Gx5x6(i,4) =0;
    else
        Hand_Px8Gx5x6(i,4) = temp2/temp1;
    end
end
P_Hand_Px8Gx5x6 = num2str(Hand_Px8Gx5x6)

 Hand_Px1Gx5x6x8 = zeros(5*3*5*4,5);
for i = 1:5*3*5*4
    Hand_Px1Gx5x6x8(i,1) = floor((i-1)/60);
    Hand_Px1Gx5x6x8(i,2)= floor((i-60*Hand_Px1Gx5x6x8(i,1)-1)/20);
    Hand_Px1Gx5x6x8(i,3)= floor((i-60*Hand_Px1Gx5x6x8(i,1)-20*Hand_Px1Gx5x6x8(i,2)-1)/4);
    Hand_Px1Gx5x6x8(i,4)= mod((i-20*Hand_Px1Gx5x6x8(i,1)-20*Hand_Px1Gx5x6x8(i,2)-1),4);
    temp1 =0;
    temp2 =0;
    for j = 1:rowsHp
        if(truthHandprint.data(j,5)==Hand_Px1Gx5x6x8(i,2) && truthHandprint.data(j,6)==Hand_Px1Gx5x6x8(i,3) && truthHandprint.data(j,8)==Hand_Px1Gx5x6x8(i,4))
            temp1 = temp1 +1;
        end
        if(truthHandprint.data(j,5)==Hand_Px1Gx5x6x8(i,2) && truthHandprint.data(j,6)==Hand_Px1Gx5x6x8(i,3) && truthHandprint.data(j,8)==Hand_Px1Gx5x6x8(i,4) && truthHandprint.data(j,1)==Hand_Px1Gx5x6x8(i,1))
            temp2 = temp2 +1;
        end
    end
    if(temp1 ==0)
        Hand_Px1Gx5x6x8(i,5) =0;
    else
        Hand_Px1Gx5x6x8(i,5) = temp2/temp1;
    end
end
P_Hand_Px1Gx5x6x8 = num2str(Hand_Px1Gx5x6x8)

Hand_Px7Gx3x4x6 = zeros(6*5*5*5,5);
for i = 1:6*5*5*5
    Hand_Px7Gx3x4x6(i,1) = floor((i-1)/125);
    Hand_Px7Gx3x4x6(i,2)= floor((i-125*Hand_Px7Gx3x4x6(i,1)-1)/25);
    Hand_Px7Gx3x4x6(i,3)= floor((i-125*Hand_Px7Gx3x4x6(i,1)-25*Hand_Px7Gx3x4x6(i,2)-1)/5);
    Hand_Px7Gx3x4x6(i,4)= mod((i-125*Hand_Px7Gx3x4x6(i,1)-25*Hand_Px7Gx3x4x6(i,2)-1),5);
    temp1 =0;
    temp2 =0;
    for j = 1:rowsHp
        if(truthHandprint.data(j,3)==Hand_Px7Gx3x4x6(i,2) && truthHandprint.data(j,4)==Hand_Px7Gx3x4x6(i,3) && truthHandprint.data(j,6)==Hand_Px7Gx3x4x6(i,4))
            temp1 = temp1 +1;
        end
        if(truthHandprint.data(j,3)==Hand_Px7Gx3x4x6(i,2) && truthHandprint.data(j,4)==Hand_Px7Gx3x4x6(i,3) && truthHandprint.data(j,6)==Hand_Px7Gx3x4x6(i,4) && truthHandprint.data(j,7)==Hand_Px7Gx3x4x6(i,1))
            temp2 = temp2 +1;
        end
    end
    if(temp1 ==0)
        Hand_Px7Gx3x4x6(i,5) =0;
    else
        Hand_Px7Gx3x4x6(i,5) = temp2/temp1;
    end
end
P_Hand_Px7Gx3x4x6 = num2str(Hand_Px7Gx3x4x6)





 