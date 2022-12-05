function fit=CalFitWindless(values)
    fit=0;
    for i=1:144
        pCir=TriPCircle([[values(1,i),values(2,i)];[values(1,i+1),values(2,i+1)];[values(1,i+2),values(2,i+2)]]);
        va=[values(1,i+1)-values(1,i),values(2,i+1)-values(2,i)];
        vb=[values(1,i+2)-values(1,i+1),values(2,i+2)-values(2,i+1)];
        dst=(norm(va)+norm(vb))/2;
        if acos(dot(va,vb)/(norm(va)*norm(vb)))>=pi/6
            fit=-1;
            break;
        end
        if fit~=-1
            fit=fit+pCir*dst;
        end
    end
    if fit~=-1
        fit=1/fit;
    end
end