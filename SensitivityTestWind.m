%% Problem 3
close all;clear;clc;

%% constant
xMax=100;
yMax=100;
xPre=1;
yPre=1;
theta=pi;
sigma=0;
valueSen1=[];

%% genetic parameters
popSize=3;
crossProb=0.5;
mutantProb=0.05;
xRange=[0,xMax];
yRange=[0,yMax];
maxNum=1000;
offSize=round(popSize*crossProb/2)*2;
fitnessWindyP=[];
fitnessWindyO=[];

%% genetic individuals
template.x=0;
template.y=0;
line=repmat(template,7,1);
parentWindy=cell(1,10);

%% initialize
i=1;
while i<=popSize
    line(1).x=randi(round(xMax/2));
    line(1).y=randi(round(yMax/2));
    for j=2:7
        pre1=line(j-1).x;
        pre2=line(j-1).y;
        line(j).x=randi([pre1,xMax]);
        line(j).y=randi([pre2,yMax]);
    end
    if Judge(line,xMax,yMax)==1
        parentWindy{i}=line;
        i=i+1;
    end
end

%% iteration
for k=1:10
    sigma=(2*pi/9)*(k-1);
    for i=1:maxNum
        parentWindy=Encode(parentWindy,popSize);
        parentWindy=Decode(parentWindy,popSize);
    for j=1:popSize                 % calculate the fitness of the previous generation
        valueWindy=CurValue(parentWindy{j},xMax,yMax);
        fitnessWindyP(j)=TestSenWind(valueWindy,sigma);
    end
    parentWindy=Encode(parentWindy,popSize);
    newPopWindy=CrossPop(parentWindy,popSize,crossProb);
    newPopWindy=MutantPop(newPopWindy,popSize,mutantProb);
    newPopWindy=Decode(newPopWindy,popSize);
    parentWindy=Decode(parentWindy,popSize);
    % bottom guarantee mechanism
    for j=1:popSize
        valueWindy=CurValue(newPopWindy{j},xMax,yMax);
        fitnessWindyO(j)=TestSenWind(valueWindy,sigma);
    end
    indexWindy=find(fitnessWindyO>fitnessWindyP);
    for j=1:numel(indexWindy)
        parentWindy{j}=newPopWindy{j};
    end
    end
    valueSen1(1,k)=sigma;
    valueSen1(2,k)=fitnessWindyP(1);
end
x=valueSen1(1,:);
y=valueSen1(2,:);
value=spcrv([[x(1) x x(end)];[y(1) y y(end)]],3);
%% draw figure
h=figure;
plot(value(1,:),value(2,:),'r','LineWidth',2);
xlabel("parameter");
ylabel("fitness of pupulation");
print(h,'-djpeg','SensitivityTestWind1.jpg');