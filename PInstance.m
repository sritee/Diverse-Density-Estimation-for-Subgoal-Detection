function Prob=PInstance(Point,Instance)
    distance=(norm(Instance-Point,2))^2;
    Prob=exp(-distance);
 % Note, this does not use scaling since x and y are approximately same scale. If x is 10 to 100 and y say 1e4 to 1e6, change the distance measure appropriately.
