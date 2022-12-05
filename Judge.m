function isLegal=Judge(line,xMax,yMax)
    isLegal=1;
    for i=1:5
        la=[(line(i+1).x)-(line(i).x),(line(i+1).y)-(line(i).y)];
        lb=[(line(i+2).x)-(line(i+1).x),(line(i+2).y)-(line(i+1).y)];
        if acos(dot(la,lb)/(norm(la)*norm(lb)))>=pi/6
            isLegal=0;
        end
    end
    la=[(line(7).x)-(line(6).x),(line(7).y)-(line(6).y)];
    lb=[xMax-(line(7).x),yMax-(line(7).y)];
    if acos(dot(la,lb)/(norm(la)*norm(lb)))>=pi/3
        isLegal=0;
    end
end