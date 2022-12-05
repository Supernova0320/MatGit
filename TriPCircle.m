function p=TriPCircle(A)
    x1=A(2,1)-A(1,1);
    y1=A(2,2)-A(1,2);
    x2=A(3,1)-A(2,1);
    y2=A(3,2)-A(2,2);
    if x1*y2==x2*y1
        p=0;
    else
    distance1 = sqrt((A(1, 1) - A(2, 1))^2 + (A(1, 2) - A(2, 2))^2);
    distance2 = sqrt((A(2, 1) - A(3, 1))^2 + (A(2, 2) - A(3, 2))^2);
    distance3 = sqrt((A(3, 1) - A(1, 1))^2 + (A(3, 2) - A(1, 2))^2);
    cosA = (distance2^2 + distance3^2 - distance1^2) / 2 * distance2 * distance3;
    sinA = sqrt(1 - cosA^2);
    r = distance1 / (2 * sinA);
    p=1/r;
    end
end