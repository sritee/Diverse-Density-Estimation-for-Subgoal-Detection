function Prob=densitydiv(Point,Pbags,Nbags)
      % Calculate the diverse density given a concept point as well as bags
   for i=1:size(Pbags,1)
       temp(i)=ppositive(Point,Pbags{i});
   end
    %Negative bags may or may not be present
 if(size(Nbags,1) >0)
   for i=(size(Pbags,1)+1):(size(Pbags,1)+size(Nbags,1))
       temp(i)=pnegative(Point,Nbags{i-size(Pbags,1)});
   end
   end
    Prob=-sum(log(max(temp,1e-8))); % Obtain the log of the diverse density with overflow check
end

