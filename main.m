%% Problem 3
close all;clear;clc;

%% constant
xMax=1023;
yMax=1023;
xPre=1;
yPre=1;
theta=pi;

%% genetic parameters
popSize=10;
crossProb=0.5;
mutantProb=0.05;
xRange=[0,xMax];
yRange=[0,yMax];
maxNum=1000;
offSize=round(popSize*crossProb/2)*2;
fitnessWindyP=[];
fitnessWindyO=[];
fitnessWindlessP=[];
fitnessWindlessO=[];

%% genetic individuals
template.x=0;
template.y=0;
line=repmat(template,7,1);
parentWindy=cell(1,10);
parentWindless=cell(1,10);

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
        parentWindless{i}=line;
        i=i+1;
    end
end

%% iteration
for i=1:maxNum
    parentWindy=Encode(parentWindy,popSize);
    parentWindless=Encode(parentWindless,popSize);
    parentWindy=Decode(parentWindy,popSize);
    parentWindless=Decode(parentWindless,popSize);
    for j=1:popSize                 % calculate the fitness of the previous generation
        valueWindy=CurValue(parentWindy{j},xMax,yMax);
        valueWindless=CurValue(parentWindless{j},xMax,yMax);
        fitnessWindyP(j)=CalFitWindy(valueWindy);
        fitnessWindlessP(j)=CalFitWindless(valueWindless);
    end
    parentWindy=Encode(parentWindy,popSize);
    newPopWindy=CrossPop(parentWindy,popSize,crossProb);
    newPopWindy=MutantPop(newPopWindy,popSize,mutantProb);
    newPopWindy=Decode(newPopWindy,popSize);
    parentWindy=Decode(parentWindy,popSize);
    parentWindless=Encode(parentWindless,popSize);
    newPopWindless=CrossPop(parentWindless,popSize,crossProb);
    newPopWindless=MutantPop(newPopWindless,popSize,mutantProb);
    newPopWindless=Decode(newPopWindless,popSize);
    parentWindless=Decode(parentWindless,popSize);
    % bottom guarantee mechanism
    for j=1:popSize
        valueWindy=CurValue(newPopWindy{j},xMax,yMax);
        valueWindless=CurValue(newPopWindless{j},xMax,yMax);
        fitnessWindyO(j)=CalFitWindy(valueWindy);
        fitnessWindlessO(j)=CalFitWindless(valueWindless);
    end
    indexWindy=find(fitnessWindyO>fitnessWindyP);
    indexWindless=find(fitnessWindlessO>fitnessWindlessP);
    for j=1:numel(indexWindy)
        parentWindy{j}=newPopWindy{j};
    end
    for j=1:numel(indexWindless)
        parentWindless{j}=newPopWindless{j};
    end
end

%% draw figure
h=figure;

subplot(1,2,1);
valueWindy=CurValue(parentWindy{4},xMax,yMax);
plot(valueWindy(1,:),valueWindy(2,:),'r-','LineWidth',2);
hold on;
valueWindy=CurValue(parentWindy{2},xMax,yMax);
plot(valueWindy(1,:),valueWindy(2,:),'b--','LineWidth',2);
hold on;
valueWindy=CurValue(parentWindy{3},xMax,yMax);
plot(valueWindy(1,:),valueWindy(2,:),'c-.','LineWidth',2);
hold on;
title('The Optimal Path(Windy)');
axis([-100 1123,-100 1123]);
legend('Solution 1','Solution 2','Solution 3','location','best'); 
xlabel('x axis position');
ylabel('y axis position');

subplot(1,2,2);
valueWindless=CurValue(parentWindless{4},xMax,yMax);
plot(valueWindless(1,:),valueWindless(2,:),'r-','LineWidth',2);
hold on;
valueWindless=CurValue(parentWindless{2},xMax,yMax);
plot(valueWindless(1,:),valueWindless(2,:),'b--','LineWidth',2);
hold on;
valueWindless=CurValue(parentWindless{3},xMax,yMax);
plot(valueWindless(1,:),valueWindless(2,:),'c-.','LineWidth',2);
hold on;
title('The Optimal Path(Windless)');
axis([-100 1123,-100 1123]);
legend('Solution 1','Solution 2','Solution 3','location','best'); 
xlabel('x axis position');
ylabel('y axis position');