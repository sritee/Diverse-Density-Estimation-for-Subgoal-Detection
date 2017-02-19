function [logdiverse,logdiversefin]=plotdd(Pbag)

%Try plotdd(Pbag(1:30,1:25)) to obtain smoothened DDE Plots after 25th iteration

%logdiverse gives all trials, logdiversefin gives smoothened average.
num_trials=size(Pbag,1);
logdiverse=zeros(10,21,num_trials);
 %A bag is passed into this function 
 
    for trial=1:num_trials  %size indicates the number of trials
       
           fprintf('Currently in trial %d \n',trial);
      
        for i=1:10
            for j=1:21
                logdiverse(i,j,trial)=densitydiv([i j],Pbag(trial,:)',{});
            end
        end
    end
   
    logdiversefin=sum(logdiverse,3)/num_trials; %negative of log diverse density
end
 
