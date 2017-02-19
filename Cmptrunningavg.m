function [finalavg]= Cmptrunningavg(Pbag,average)

%Pass the initial average as zeros(10,21,size(Pbag,1)) unless this is part of the main
%program.
num_trials=size(Pbag,1);
lambda=0.75; %running average parameter
 %A bag is passed into this function 
 
    for trial=1:size(Pbag,1)  %size indicates the number of trials
       
        for k=1:size(Pbag,2); %indicates number of trajectories in trial
           fprintf('Currently in trial %d epsiode %d \n',trial,k);
      
            for i=1:10
                for j=1:21
                logdiverse(i,j)=densitydiv([i j],Pbag(1:k)',{});
                end
            end
    
    
    [a,b]=ind2sub(size(logdiverse),find(logdiverse(:)==min(logdiverse(:)))); % Calculate the subgoal states, i.e min negative log diverse density
   
    for hello=1:size(a,1)
          average(a(hello),b(hello),trial)=lambda*(average(a(hello),b(hello),trial) +1);
    end
    
        end
    end
   
    finalavg=sum(average,3)/num_trials; %This is final running value obtained.If it is closest
    % to lambda/1-lambda, then it is frequently one of the chosen goals.
    
end
 

