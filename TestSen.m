function asr=TestSen(values,parameter)
    asr=0;
    for i=1:144
        pCir=TriPCircle([[values(1,i),values(2,i)];[values(1,i+1),values(2,i+1)];[values(1,i+2),values(2,i+2)]]);
        va=[values(1,i+1)-values(1,i),values(2,i+1)-values(2,i)];
        vb=[values(1,i+2)-values(1,i+1),values(2,i+2)-values(2,i+1)];
        dst=(norm(va)+norm(vb))/2;
        if acos(dot(va,vb)/(norm(va)*norm(vb)))>=pi/6
            asr=-1;
            break;
        end
        if asr~=-1
            asr=asr+pCir*dst;
        end
    end
    sigma=atan((values(2,146)-values(2,145))/(values(1,146)-values(1,145)));
    if isnan(sigma)
        sigma=pi/2;
    end
    if asr~=-1
        temp=mapminmax([1/asr,sigma],1,10);
        asr=temp(1)+parameter*temp(2);
    end
end