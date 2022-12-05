function newPop=MutantPop(pop,popSize,mutantProb)
    for i=1:popSize
        if rand<mutantProb
            r=randi([7,10]);
            j=randi(7);
                if pop{i}(j).x(r)=='1'
                    pop{i}(j).x(r)='0';
                elseif pop{i}(j).x(r)=='0'
                        pop{i}(j).x(r)='1';
                end
                if pop{i}(j).y(r)=='1'
                    pop{i}(j).y(r)='0';
                elseif pop{i}(j).y(r)=='0'
                        pop{i}(j).y(r)='1';
                end
        end
    end
    newPop=pop;
end