function newPop=Decode(pop,popSize)
    for i=1:popSize
        for j=1:7
            pop{i}(j).x=bin2dec(pop{i}(j).x);
            pop{i}(j).y=bin2dec(pop{i}(j).y);
        end
    end
    newPop=pop;
end