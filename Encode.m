function newPop=Encode(pop,popSize)
    for i=1:popSize
        for j=1:7
            pop{i}(j).x=sprintf('%010s',dec2bin(pop{i}(j).x));
            pop{i}(j).y=sprintf('%010s',dec2bin(pop{i}(j).y));
        end
    end
    newPop=pop;
end