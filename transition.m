function [reward,ns,signal]=transition(cs,action)
reward=0;
signal=0;
r=cs(1);
c=cs(2);

switch action
    case 1
        c=c+1; % move right
    case 2
        c=c-1; %move left
    case 3
        r=r-1; % move up
    case 4
        r=r+1; %move down
end
     ns=[r,c];
    if isequal([r,c],[10,21]) % reached goal state
        reward=1;
        signal=1;
        ns=[2,18];
        return;
    end
   
   % check if agent moves out of maze 
   if (c>21  || (c< 1 ) || r> 10 || r<1)
       ns=cs;
       return;
   end
   
   %check if it moves into obstacle
   if (c==11 && (r~=5 && r~=6))
       ns=cs;
   end
   end 

