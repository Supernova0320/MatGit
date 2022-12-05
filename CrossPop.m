function newPop=CrossPop(pop,popSize,crossProb)
    i=2;
    newPop=pop;
    while i+2<=popSize
        if rand<crossProb
            r = randperm(9,2) ;
            r1 = min(r); r2 =max(r) ;
            j=randperm(7,4);
            for k=1:numel(j)
                x1 = pop{i-1}(j(k)).x;
                x2 = pop{i}(j(k)).x;
                y1=pop{i-1}(j(k)).y;
                y2=pop{i-1}(j(k)).y;
                newPop{i-1}(j(k)).x= [x1(1:r1-1),x2(r1:r2),x1(r2+1:end)];
                newPop{i-1}(j(k)).y= [y1(1:r1-1),y2(r1:r2),y1(r2+1:end)];
                newPop{i}(j(k)).x=[x2(1:r1-1),x1(r1:r2),x2(r2+1:end)];
                newPop{i}(j(k)).x=[y2(1:r1-1),y1(r1:r2),y2(r2+1:end)];
            end
        end
        i=i+2;
    end
end