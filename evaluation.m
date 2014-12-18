% Project Two: Probabilistic Graphical Models
% Author: Xiujiao Gao
% Evaluations
% Before you do the evaluations, you have to run parameter_estimation.m
% first to get parameters
% Cur_Indpendent_LL: log-loss for cursive writing when all the varivbales are independent;
% Hand_Independent_LL:log-loss for hand-print writing when all the varivbales are independent;
% Cur_Ga_LL:log-loss  for cursive writing when we use graph(a)
% Hand_Gb_LL:log-loss for hand-print writing when we use graph(b)

clear;
global Cur_Px1;global Cur_Px2;global Cur_Px3;global Cur_Px4;global Cur_Px5;global Cur_Px6;global Cur_Px7;global Cur_Px8;global Cur_Px9;
global Cur_Px2Gx1; global Cur_Px4Gx3x5; global Cur_Px7Gx6x8; global Cur_Px9Gx2x4x7;
global Hand_Px1;global Hand_Px2;global Hand_Px3;global Hand_Px4;global Hand_Px5;global Hand_Px6;global Hand_Px7;global Hand_Px8;global Hand_Px9;
global Hand_Px1Gx5x6x8; global Hand_Px2Gx3x5; global Hand_Px4Gx2x3; global Hand_Px5Gx3; global Hand_Px6Gx2x5; global Hand_Px7Gx3x4x6; global Hand_Px8Gx5x6;

Cur_Independent_LL=0;
Hand_Independent_LL=0;
Cur_Ga_LL=0;
Hand_Gb_LL=0;

% log-loss for cursive writing when all the varivbales are independent
truthCursive = importdata('truthCursive.txt');
[rows,columns] = size(truthCursive.data);
for i =1:rows
    %Px1
    index = truthCursive.data(i,1)+1;
    p = Cur_Px1(index,2);
    Cur_Independent_LL =Cur_Independent_LL -log(p);
    % Px2
    index = truthCursive.data(i,2)+1;
    p = Cur_Px2(index,2);
    Cur_Independent_LL =Cur_Independent_LL -log(p);
    % Px3
    index = truthCursive.data(i,3)+1;
    p = Cur_Px3(index,2);
    Cur_Independent_LL =Cur_Independent_LL -log(p);
    % Px4
    index = truthCursive.data(i,4)+1;
    p = Cur_Px4(index,2);
    Cur_Independent_LL =Cur_Independent_LL -log(p);
    % Px5
    index = truthCursive.data(i,5)+1;
    p = Cur_Px5(index,2);
    Cur_Independent_LL =Cur_Independent_LL -log(p);
    % Px6
    index = truthCursive.data(i,6)+1;
    p = Cur_Px6(index,2);
    Cur_Independent_LL =Cur_Independent_LL -log(p);
    % Px7
    index = truthCursive.data(i,7)+1;
    p = Cur_Px7(index,2);
    Cur_Independent_LL =Cur_Independent_LL -log(p);
    % Px8
    index = truthCursive.data(i,8)+1;
    p = Cur_Px8(index,2);
    Cur_Independent_LL =Cur_Independent_LL -log(p);
    % Px9
    index = truthCursive.data(i,9)+1;
    p = Cur_Px9(index,2);
    Cur_Independent_LL =Cur_Independent_LL -log(p);
end

% log-loss for hand print writing when all the varivbales are independent
truthHandprint = importdata('truthHandprint.txt');
[rowsHp,columnsHp] = size(truthHandprint.data);
for i =1:rowsHp
    % Px1
    index = truthHandprint.data(i,1)+1;
    p = Hand_Px1(index,2);
    Hand_Independent_LL =Hand_Independent_LL -log(p);
    % Px2
    index = truthHandprint.data(i,2)+1;
    p = Hand_Px2(index,2);
    Hand_Independent_LL =Hand_Independent_LL -log(p);
    % Px3
    index = truthHandprint.data(i,3)+1;
    p = Hand_Px3(index,2);
    Hand_Independent_LL =Hand_Independent_LL -log(p);
    % Px4
    index = truthHandprint.data(i,4)+1;
    p = Hand_Px4(index,2);
    Hand_Independent_LL =Hand_Independent_LL -log(p);
    % Px5
    index = truthHandprint.data(i,5)+1;
    p = Hand_Px5(index,2);
    Hand_Independent_LL =Hand_Independent_LL -log(p);
    % Px6
    index = truthHandprint.data(i,6)+1;
    p = Hand_Px6(index,2);
    Hand_Independent_LL =Hand_Independent_LL -log(p);
    % Px7
    index = truthHandprint.data(i,7)+1;
    p = Hand_Px7(index,2);
    Hand_Independent_LL =Hand_Independent_LL -log(p);
    % Px8
    index = truthHandprint.data(i,8)+1;
    p = Hand_Px8(index,2);
    Hand_Independent_LL =Hand_Independent_LL -log(p);
    % Px9
    index = truthHandprint.data(i,9)+1;
    p = Hand_Px9(index,2);
    Hand_Independent_LL =Hand_Independent_LL -log(p);
end
% Cur_Ga_LL:log-loss  for cursive writing when we use graph(a)
for i =1:rows
    % Px1
    index = truthCursive.data(i,1)+1;
    p = Cur_Px1(index,2);
    Cur_Ga_LL =Cur_Ga_LL -log(p);
    % Px3
    index = truthCursive.data(i,3)+1;
    p = Cur_Px3(index,2);
    Cur_Ga_LL =Cur_Ga_LL -log(p);
    % Px5
    index = truthCursive.data(i,5)+1;
    p = Cur_Px5(index,2);
    Cur_Ga_LL =Cur_Ga_LL -log(p);
    % Px6
    index = truthCursive.data(i,6)+1;
    p = Cur_Px6(index,2);
    Cur_Ga_LL =Cur_Ga_LL -log(p);
    % Px8
    index = truthCursive.data(i,8)+1;
    p = Cur_Px8(index,2);
    Cur_Ga_LL =Cur_Ga_LL -log(p);
    % Px2Gx1
    index = truthCursive.data(i,2)*4 + truthCursive.data(i,1) + 1;
    p = Cur_Px2Gx1(index,3);
    Cur_Ga_LL =Cur_Ga_LL -log(p);
    % Px4Gx3x5
    index = truthCursive.data(i,4)*12+ truthCursive.data(i,3)*4 + truthCursive.data(i,5)+1;
    p = Cur_Px4Gx3x5(index,4);
    Cur_Ga_LL =Cur_Ga_LL -log(p);
    % Px7Gx6x8
    index = truthCursive.data(i,7)*20+ truthCursive.data(i,6)*5 + truthCursive.data(i,8) + 1;
    p = Cur_Px7Gx6x8(index,4);
    Cur_Ga_LL =Cur_Ga_LL -log(p);
    
    % Px9Gx2x4x7
    index = truthCursive.data(i,9)*100+ truthCursive.data(i,2)*20 + truthCursive.data(i,4)*4 + truthCursive.data(i,7)+1;
    p = Cur_Px9Gx2x4x7(index,5);
    Cur_Ga_LL =Cur_Ga_LL -log(p);
end

% Hand_Gb_LL:log-loss for hand-print writing when we use graph(b)

for i =1:rowsHp
    % Px3
    index = truthHandprint.data(i,3)+1;
    p = Hand_Px3(index,2);
    Hand_Gb_LL =Hand_Gb_LL -log(p);
    % Px9
    index = truthHandprint.data(i,9)+1;
    p = Hand_Px9(index,2);
    Hand_Gb_LL =Hand_Gb_LL -log(p);
    % Px5Gx3
    index = truthHandprint.data(i,5)*5 + truthHandprint.data(i,3)+1;
    p = Hand_Px5Gx3(index,3);
    Hand_Gb_LL =Hand_Gb_LL -log(p);
    % Px2Gx3x5
    index = truthHandprint.data(i,2)*15 + truthHandprint.data(i,3)*3+truthHandprint.data(i,5)+1;
    p = Hand_Px2Gx3x5(index,4);
    Hand_Gb_LL =Hand_Gb_LL -log(p);
    % Px4Gx2x3
    index = truthHandprint.data(i,4)*30 + truthHandprint.data(i,2)*5+truthHandprint.data(i,3)+1;
    p = Hand_Px4Gx2x3(index,4);
    Hand_Gb_LL =Hand_Gb_LL -log(p);
    % Px6Gx2x5
    index = truthHandprint.data(i,6)*18 + truthHandprint.data(i,2)*3+truthHandprint.data(i,5)+1;
    p = Hand_Px6Gx2x5(index,4);
    Hand_Gb_LL =Hand_Gb_LL -log(p);
    % Px8Gx5x6
    index = truthHandprint.data(i,8)*15 + truthHandprint.data(i,5)*5+truthHandprint.data(i,6)+1;
    p = Hand_Px8Gx5x6(index,4);
    Hand_Gb_LL =Hand_Gb_LL -log(p);
    % Px1Gx5x6x8
    index = truthHandprint.data(i,1)*60 + truthHandprint.data(i,5)*20+truthHandprint.data(i,6)*4+truthHandprint.data(i,8)+1;
    p = Hand_Px1Gx5x6x8(index,5);
    Hand_Gb_LL =Hand_Gb_LL -log(p);
     % Px7Gx3x4x6
    index = truthHandprint.data(i,7)*125 + truthHandprint.data(i,3)*25+truthHandprint.data(i,4)*5+truthHandprint.data(i,6)+1;
    p = Hand_Px7Gx3x4x6(index,5);
    Hand_Gb_LL =Hand_Gb_LL -log(p);
end

Cur_Independent_LL
Hand_Independent_LL
Cur_Ga_LL
Hand_Gb_LL

