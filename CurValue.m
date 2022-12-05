function value=CurValue(line,xMax,yMax)
    matX=0;
    matY=0;
    for i=1:7
        matX(i+1)=line(i).x;
        matY(i+1)=line(i).y;
    end
    matX(9)=xMax;
    matY(9)=yMax;
    value = spcrv([[matX(1) matX matX(end)];[matY(1) matY matY(end)]],3);
end