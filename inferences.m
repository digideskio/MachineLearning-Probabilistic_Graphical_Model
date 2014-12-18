% Project Two: Probabilistic Graphical Models
% Author: Xiujiao Gao
% Inferences
% Before you do the inferences, you have to run parameter_estimation.m
% first to get parameters

% mumber of max total samples
N = 100;
% load data
truthCursive = importdata('truthCursive.txt');
[rows,columns] = size(truthCursive.data);
truthHandprint = importdata('truthHandprint.txt');
[rowsHp,columnsHp] = size(truthHandprint.data);

% Joint probability
Cur_Independent_P=zeros(4*5*3*5*4*4*4*5*3,10);
Cur_P=zeros(4*5*3*5*4*4*4*5*3,10);
Hand_Independent_P=zeros(5*6*5*5*3*5*6*4*3,10);
Hand_P=zeros(5*6*5*5*3*5*6*4*3,10);
% Joint probability for Cursive writing
for x1=0:3
    for x2=0:4
        for x3=0:2
            for x4=0:4
               for x5=0:3
                   for x6=0:3
                        for x7 =0:3
                           for x8=0:4
                               for x9=0:2
                                    index =x1*5*3*5*4*4*4*5*3+x2*3*5*4*4*4*5*3+x3*5*4*4*4*5*3+x4*4*4*4*5*3+x5*4*4*5*3+x6*4*5*3+x7*5*3+x8*3+x9+1;
                                    Cur_Independent_P(index,1)=x1;
                                    Cur_Independent_P(index,2)=x2;
                                    Cur_Independent_P(index,3)=x3;
                                    Cur_Independent_P(index,4)=x4;
                                    Cur_Independent_P(index,5)=x5;
                                    Cur_Independent_P(index,6)=x6;
                                    Cur_Independent_P(index,7)=x7;
                                    Cur_Independent_P(index,8)=x8;
                                    Cur_Independent_P(index,9)=x9;
                                    Cur_Independent_P(index,10)=Cur_Px1(x1+1,2)*Cur_Px2(x2+1,2)*Cur_Px3(x3+1,2)*Cur_Px4(x4+1,2)*Cur_Px5(x5+1,2)*Cur_Px6(x6+1,2)*Cur_Px7(x7+1,2)*Cur_Px8(x8+1,2)*Cur_Px9(x9+1,2);
                                    Cur_P(index,1)=x1;
                                    Cur_P(index,2)=x2;
                                    Cur_P(index,3)=x3;
                                    Cur_P(index,4)=x4;
                                    Cur_P(index,5)=x5;
                                    Cur_P(index,6)=x6;
                                    Cur_P(index,7)=x7;
                                    Cur_P(index,8)=x8;
                                    Cur_P(index,9)=x9;
                                    Cur_P(index,10)=Cur_Px1(x1+1,2)*Cur_Px2Gx1(x2*4+x1+1,3)*Cur_Px3(x3+1,2)*Cur_Px4Gx3x5(x4*12+x3*4+x5+1,4)*Cur_Px5(x5+1,2)*Cur_Px6(x6+1,2)*Cur_Px7Gx6x8(x7*20+x6*5+x8+1,4)*Cur_Px8(x8+1,2)*Cur_Px9Gx2x4x7(x9*100+x2*20+x4*4+x7+1,5); 
                               end
                            end
                        end
                    end
                end
            end
        end
    end
end

% joint probabiliy for hand print writing 
for x1=0:4
    for x2=0:5
        for x3=0:4
            for x4=0:4
               for x5=0:2
                   for x6=0:4
                        for x7 =0:5
                           for x8=0:3
                               for x9=0:2
                                    index =x1*6*5*5*3*5*6*4*3+x2*5*5*3*5*6*4*3+x3*5*3*5*6*4*3+x4*3*5*6*4*3+x5*5*6*4*3+x6*6*4*3+x7*4*3+x8*3+x9+1;
                                    Hand_Independent_P(index,1)=x1;
                                    Hand_Independent_P(index,2)=x2;
                                    Hand_Independent_P(index,3)=x3;
                                    Hand_Independent_P(index,4)=x4;
                                    Hand_Independent_P(index,5)=x5;
                                    Hand_Independent_P(index,6)=x6;
                                    Hand_Independent_P(index,7)=x7;
                                    Hand_Independent_P(index,8)=x8;
                                    Hand_Independent_P(index,9)=x9;
                                    Hand_Independent_P(index,10)=Hand_Px1(x1+1,2)*Hand_Px2(x2+1,2)*Hand_Px3(x3+1,2)*Hand_Px4(x4+1,2)*Hand_Px5(x5+1,2)*Hand_Px6(x6+1,2)*Hand_Px7(x7+1,2)*Hand_Px8(x8+1,2)*Hand_Px9(x9+1,2);
                                    Hand_P(index,1)=x1;
                                    Hand_P(index,2)=x2;
                                    Hand_P(index,3)=x3;
                                    Hand_P(index,4)=x4;
                                    Hand_P(index,5)=x5;
                                    Hand_P(index,6)=x6;
                                    Hand_P(index,7)=x7;
                                    Hand_P(index,8)=x8;
                                    Hand_P(index,9)=x9;
                                    Hand_P(index,10)=Hand_Px1Gx5x6x8(x1*60+x5*20+x6*4+x8+1,5)*Hand_Px2Gx3x5(x2*15+x3*3+x5+1,4)*Hand_Px3(x3+1,2)*Hand_Px4Gx2x3(x4*30+x2*5+x3+1,4)*Hand_Px5Gx3(x5*5+x3+1,3)*Hand_Px6Gx2x5(x6*18+x2*3+x5+1,4)*Hand_Px7Gx3x4x6(x7*125+x3*25+x4*5+x6+1,5)*Hand_Px8Gx5x6(x8*15+x5*5+x6+1,4)*Hand_Px9(x9+1,2); 
                               end
                            end
                        end
                    end
                end
            end
        end
    end
end

% PRC 
Cur_Independent_PRC =0;
Cur_PRC=0;
Hand_Independent_PRC=0;
Hand_PRC=0;
for i =1:4*5*3*5*4*4*4*5*3
    Cur_Independent_PRC = Cur_Independent_PRC+Cur_Independent_P(i,10)*Cur_Independent_P(i,10);
    Cur_PRC = Cur_PRC+Cur_P(i,10)*Cur_P(i,10);
end

for i =1:5*6*5*5*3*5*6*4*3
    Hand_Independent_PRC = Hand_Independent_PRC+Hand_Independent_P(i,10)*Hand_Independent_P(i,10);
    Hand_PRC = Hand_PRC+Hand_P(i,10)*Hand_P(i,10);
end

% nPRC
index =0;
for n=2:2:N
    index = index+1;
    Cur_Independent_nPRC(index)= 1-power(1-Cur_Independent_PRC,n*(n-1)/2);
    Cur_nPRC(index)= 1-power(1-Cur_PRC,n*(n-1)/2);
    Hand_Independent_nPRC(index)= 1-power(1-Cur_Independent_PRC,n*(n-1)/2);
    Hand_nPRC(index)= 1-power(1-Cur_PRC,n*(n-1)/2);
end

% find common and rare samples 
p0independent=0;
p1independent=1;
p0=0;
p1=1;
for i =1:rows
    x1 = truthCursive.data(i,1);
    x2 = truthCursive.data(i,2);
    x3 = truthCursive.data(i,3);
    x4 = truthCursive.data(i,4);
    x5 = truthCursive.data(i,5);
    x6 = truthCursive.data(i,6);
    x7 = truthCursive.data(i,7);
    x8 = truthCursive.data(i,8);  
    x9 = truthCursive.data(i,9);
    ptemp=Cur_Px1(x1+1,2)*Cur_Px2(x2+1,2)*Cur_Px3(x3+1,2)*Cur_Px4(x4+1,2)*Cur_Px5(x5+1,2)*Cur_Px6(x6+1,2)*Cur_Px7(x7+1,2)*Cur_Px8(x8+1,2)*Cur_Px9(x9+1,2);
    % common and rare cursive examples when all the invariables are independent 
    if ptemp >p0independent
        Cur_Common_Independent.data=truthCursive.data(i,:);
        Cur_Common_Independent.textdata = truthCursive.textdata(i,:);
        Cur_Common_Independent.data(1,10)=ptemp;
        p0independent = ptemp;
    end
    if ptemp <p1independent
        Cur_Rare_Independent.data=truthCursive.data(i,:);
        Cur_Rare_Independent.textdata = truthCursive.textdata(i,:);
        Cur_Rare_Independent.data(1,10)=ptemp;
        p1independent= ptemp;
    end
    % common and rare cursive examples when use graph (a)
    ptemp=Cur_Px1(x1+1,2)*Cur_Px2Gx1(x2*4+x1+1,3)*Cur_Px3(x3+1,2)*Cur_Px4Gx3x5(x4*12+x3*4+x5+1,4)*Cur_Px5(x5+1,2)*Cur_Px6(x6+1,2)*Cur_Px7Gx6x8(x7*20+x6*5+x8+1,4)*Cur_Px8(x8+1,2)*Cur_Px9Gx2x4x7(x9*100+x2*20+x4*4+x7+1,5); 
    if ptemp >p0
        Cur_Common.data =truthCursive.data(i,:);
        Cur_Common.textdata = truthCursive.textdata(i,:);
        Cur_Common.data(1,10)=ptemp;
        p0 = ptemp;
    end
    if ptemp <p1
        Cur_Rare.data=truthCursive.data(i,:);
        Cur_Rare.textdata = truthCursive.textdata(i,:);
        Cur_Rare.data(1,10)=ptemp;
        p1= ptemp;
    end
end

p0independent=0;
p1independent=1;
p0=0;
p1=1;
for i =1:rowsHp
    x1 = truthHandprint.data(i,1);
    x2 = truthHandprint.data(i,2);
    x3 = truthHandprint.data(i,3);
    x4 = truthHandprint.data(i,4);
    x5 = truthHandprint.data(i,5);
    x6 = truthHandprint.data(i,6);
    x7 = truthHandprint.data(i,7);
    x8 = truthHandprint.data(i,8);  
    x9 = truthHandprint.data(i,9);
    ptemp=Hand_Px1(x1+1,2)*Hand_Px2(x2+1,2)*Hand_Px3(x3+1,2)*Hand_Px4(x4+1,2)*Hand_Px5(x5+1,2)*Hand_Px6(x6+1,2)*Hand_Px7(x7+1,2)*Hand_Px8(x8+1,2)*Hand_Px9(x9+1,2);
    % common and rare hand print examples when all the invariables are independent 
    if ptemp >p0independent
        Hand_Common_Independent.data=truthHandprint.data(i,:);
        Hand_Common_Independent.textdata = truthHandprint.textdata(i,:);
        Hand_Common_Independent.data(1,10)=ptemp;
        p0independent = ptemp;
    end
    if ptemp <p1independent
        Hand_Rare_Independent.data=truthHandprint.data(i,:);
        Hand_Rare_Independent.textdata = truthHandprint.textdata(i,:);
        Hand_Rare_Independent.data(1,10)=ptemp;
        p1independent= ptemp;
    end
    % common and rare hand print examples when use graph (b)
    ptemp=Hand_Px1Gx5x6x8(x1*60+x5*20+x6*4+x8+1,5)*Hand_Px2Gx3x5(x2*15+x3*3+x5+1,4)*Hand_Px3(x3+1,2)*Hand_Px4Gx2x3(x4*30+x2*5+x3+1,4)*Hand_Px5Gx3(x5*5+x3+1,3)*Hand_Px6Gx2x5(x6*18+x2*3+x5+1,4)*Hand_Px7Gx3x4x6(x7*125+x3*25+x4*5+x6+1,5)*Hand_Px8Gx5x6(x8*15+x5*5+x6+1,4)*Hand_Px9(x9+1,2); 
    if ptemp >p0
        Hand_Common.data=truthHandprint.data(i,:);
        Hand_Common.textdata = truthHandprint.textdata(i,:);
        Hand_Common.data(1,10)=ptemp;
        p0 = ptemp;
    end
    if ptemp <p1
        Hand_Rare.data=truthHandprint.data(i,:);
        Hand_Rare.textdata = truthHandprint.textdata(i,:);
        Hand_Rare.data(1,10)=ptemp;
        p1= ptemp;
    end
end

% random examples
r1 =ceil(rand(1)*rows);
r2 = ceil(rand(1)*rowsHp);

x1 = truthCursive.data(r1,1);
x2 = truthCursive.data(r1,2);
x3 = truthCursive.data(r1,3);
x4 = truthCursive.data(r1,4);
x5 = truthCursive.data(r1,5);
x6 = truthCursive.data(r1,6);
x7 = truthCursive.data(r1,7);
x8 = truthCursive.data(r1,8);  
x9 = truthCursive.data(r1,9);
   
Cur_Independent_r.textdata = truthCursive.textdata(r1,:);
Cur_Independent_r.data = truthCursive.data(r1,:);
Cur_Independent_r.data(1,10) =  Cur_Px1(x1+1,2)*Cur_Px2(x2+1,2)*Cur_Px3(x3+1,2)*Cur_Px4(x4+1,2)*Cur_Px5(x5+1,2)*Cur_Px6(x6+1,2)*Cur_Px7(x7+1,2)*Cur_Px8(x8+1,2)*Cur_Px9(x9+1,2);
    
Cur_r.textdata = truthCursive.textdata(r1,:);
Cur_r.data = truthCursive.data(r1,:);
Cur_r.data(1,10) = Cur_Px1(x1+1,2)*Cur_Px2Gx1(x2*4+x1+1,3)*Cur_Px3(x3+1,2)*Cur_Px4Gx3x5(x4*12+x3*4+x5+1,4)*Cur_Px5(x5+1,2)*Cur_Px6(x6+1,2)*Cur_Px7Gx6x8(x7*20+x6*5+x8+1,4)*Cur_Px8(x8+1,2)*Cur_Px9Gx2x4x7(x9*100+x2*20+x4*4+x7+1,5); 
    
x1 = truthHandprint.data(r2,1);
x2 = truthHandprint.data(r2,2);
x3 = truthHandprint.data(r2,3);
x4 = truthHandprint.data(r2,4);
x5 = truthHandprint.data(r2,5);
x6 = truthHandprint.data(r2,6);
x7 = truthHandprint.data(r2,7);
x8 = truthHandprint.data(r2,8);  
x9 = truthHandprint.data(r2,9);
   
Hand_Independent_r.textdata = truthHandprint.textdata(r2,:);
Hand_Independent_r.data = truthHandprint.data(r2,:);
Hand_Independent_r.data(1,10) =  Hand_Px1(x1+1,2)*Hand_Px2(x2+1,2)*Hand_Px3(x3+1,2)*Hand_Px4(x4+1,2)*Hand_Px5(x5+1,2)*Hand_Px6(x6+1,2)*Hand_Px7(x7+1,2)*Hand_Px8(x8+1,2)*Hand_Px9(x9+1,2);
    
Hand_r.textdata = truthHandprint.textdata(r2,:);
Hand_r.data = truthHandprint.data(r2,:);
Hand_r.data(1,10) = Hand_Px1Gx5x6x8(x1*60+x5*20+x6*4+x8+1,5)*Hand_Px2Gx3x5(x2*15+x3*3+x5+1,4)*Hand_Px3(x3+1,2)*Hand_Px4Gx2x3(x4*30+x2*5+x3+1,4)*Hand_Px5Gx3(x5*5+x3+1,3)*Hand_Px6Gx2x5(x6*18+x2*3+x5+1,4)*Hand_Px7Gx3x4x6(x7*125+x3*25+x4*5+x6+1,5)*Hand_Px8Gx5x6(x8*15+x5*5+x6+1,4)*Hand_Px9(x9+1,2); 

figure(1)
data=[Cur_Independent_PRC Cur_PRC Hand_Independent_PRC Hand_PRC];
b = bar(data);
grid on;
ch = get(b,'children');
set(ch,'FaceVertexCData',[4;2;3;1])
set(gca,'XTickLabel',{'Cur_Independent_PRC','Cur_PRC','Hand_Independent_PRC','Hand_PRC'})
ylabel('PRC for Different Models');

n=[2:2:N];
figure(2)
plot(n,Cur_Independent_nPRC,'b',n,Cur_nPRC,'m','LineWidth',1.5);hold on;
legend('CurIndependent','CurGa');
axis([1 100 0 1]);
xlabel('Number of Samples');
ylabel('nPRC for Different Models(Cursive)');

figure(3)
plot(n,Hand_Independent_nPRC,'k',n,Hand_nPRC,'r','LineWidth',1.5);hold on;
legend('HandIndependent','HandGb');
axis([1 100 0 1]);
xlabel('Number of Samples');
ylabel('nPRC for Different Models(Hand Print)');

index =0;
for n=2:2:10*N
    index =index+1;  
    Cur_Common_Independent_nPRC(index) = 1-power(1-Cur_Common_Independent.data(1,10),n-1);
    Cur_Common_nPRC(index) = 1-power(1-Cur_Common.data(1,10),n-1);
    Cur_Rare_Independent_nPRC(index) = 1-power(1-Cur_Rare_Independent.data(1,10),n-1);
    Cur_Rare_nPRC(index) = 1-power(1-Cur_Rare.data(1,10),n-1);
    
    Hand_Common_Independent_nPRC(index) = 1-power(1-Hand_Common_Independent.data(1,10),n-1);
    Hand_Common_nPRC(index) = 1-power(1-Hand_Common.data(1,10),n-1);
    Hand_Rare_Independent_nPRC(index) = 1-power(1-Hand_Rare_Independent.data(1,10),n-1);
    Hand_Rare_nPRC(index) = 1-power(1-Hand_Rare.data(1,10),n-1);
    
    Cur_Independent_rnPRC(index) = 1-power(1-Cur_Independent_r.data(1,10),n-1);
    Cur_rnPRC(index) = 1-power(1-Cur_r.data(1,10),n-1);
    Hand_Independent_rnPRC(index) = 1-power(1-Hand_Independent_r.data(1,10),n-1);
    Hand_rnPRC(index) = 1-power(1-Hand_r.data(1,10),n-1);  
end

n=[2:2:10*N];
figure(4)
plot(n,Cur_Common_Independent_nPRC,n,Cur_Rare_Independent_nPRC,n,Cur_Independent_rnPRC,'LineWidth',1.5);hold on;
legend('CurCommonIndependent','CurRareIndependent','CurRandomIndepent');
axis([1 1000 0 1.01]);
xlabel('Number of Samples');
ylabel('Conditional nPRC for Cursive Samples (Independent Varaibles)');

figure(5)
plot(n,Cur_Common_nPRC,n,Cur_Rare_nPRC,n,Cur_rnPRC,'LineWidth',1.5);hold on;
legend('CurCommon','CurRare','CurRandom');
axis([1 1000 0 1.01]);
xlabel('Number of Samples');
ylabel('Conditional nPRC for Cursive Samples based on Graph (a)');

figure(6)
plot(n,Hand_Common_Independent_nPRC,n,Hand_Rare_Independent_nPRC,n,Hand_Independent_rnPRC,'LineWidth',1.5);hold on;
legend('HandCommonIndependent','HandRareIndependent','HandRandomIndepent');
axis([1 1000 0 1.01]);
xlabel('Number of Samples');
ylabel('Conditional nPRC for Hand Print Samples (Independent Varaibles)');

figure(7)
plot(n,Hand_Common_nPRC,n,Hand_Rare_nPRC,n,Hand_rnPRC,'LineWidth',1.5);hold on;
legend('HandCommon','HandRare','HandRandom');
axis([1 1000 0 1.01]);
xlabel('Number of Samples');
ylabel('Conditional nPRC for Hand Print Samples based on Graph (b)');


