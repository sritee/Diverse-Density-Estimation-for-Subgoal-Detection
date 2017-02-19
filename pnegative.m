function Prob=pnegative(Point,NBag)

%Given a Negative bag, and a point, calculate the point being the true concept, given a negative bag.

    size_nbag=size(NBag);
    for i=1:size_nbag(1)
        temp(i)=PInstance(Point,NBag(i,:));
    end
    Prob=prod(1-temp);
