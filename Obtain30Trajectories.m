allstates=zeros(10,21);
alpha=0.05; % step size parameter
epsilon=0.1; % exploration parameter
num_episodes=50; % episode per run.
gamma=0.90; % discount parameter
num_tries=30;  %number of runs of the code for smoothing
Pbag=cell(30,50); %to store the trajectories (bags)
goalstate=[10,21]; %bottom left corner

    



for k=1:num_tries %Multiple runs of the code, hence we collect num_tries runs.
    fprintf('This is run number %d \n',k);
    qvalues=zeros(210,4);
    tempr=1; %used later when adding to state trajectory bag
    
    for i=1:num_episodes
    ssrand1=randperm(10);
    ssrand2=randperm(10);
   
   
    curstate=[ssrand1(1),ssrand2(1)]; %random start state in the left hall
        
        while(1)
     
        csi=sub2ind(size(allstates),curstate(1),curstate(2)); % convert state to index
        
        if(rand<1-epsilon) % greedy action
            
        temp=find(max(qvalues(csi,:))==qvalues(csi,:));
        temp1=randperm(size(temp,2)); % ensure equal q value actions are selected with equal chance
        action=temp(temp1(1));
        else
            temp=randperm(4); % exploring action
            action=temp(1);
        end
         %The following 5 lines adds the curstate to the trajectory bag
        if ~( isequal(abs(curstate-goalstate) < [4 4] , ones(1,2))) %Do not add states close to goal state to the trajectory, as we are filtering them out
            
            if tempr==1
                Pbag{k,i}(1,:)=curstate;
                tempr=0;
            else
                Pbag{k,i}(end+1,:)=curstate;
            end
        end
        
        
        
        [rew,nextstate,signal]=transition(curstate,action); % Environment simulator
        nsi=sub2ind(size(allstates),nextstate(1),nextstate(2)); %Index of the next state
        
        if(signal==1) %The trial has ended
            qvalues(csi,action)=qvalues(csi,action)+ alpha*(rew- qvalues(csi,action));
            fprintf('Agent has won\n');
            break; %actionvalues for terminal state is all zero.
        end
        
        qmaxnext=max(qvalues(nsi,:));
        
        qvalues(csi,action)=qvalues(csi,action)+ alpha*(rew+ gamma*qmaxnext - qvalues(csi,action));% Qlearning update
        
        curstate=nextstate;
        end
     end 
end


        



  
  
