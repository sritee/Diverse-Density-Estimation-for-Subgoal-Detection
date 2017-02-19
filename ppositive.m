function Prob=ppositive(Point,PBag)
   %Given a positive bag , the  point , this computes the probability of the true concept being the point, given a bag.
   
    size_pbag=size(PBag,1);
    for i=1:size_pbag
        temp(i)=PInstance(Point,PBag(i,:));
    end
    Prob=1-prod(1-temp);
     
