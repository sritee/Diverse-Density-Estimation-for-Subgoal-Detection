allstates=zeros(10,21);
qvalues=zeros(210,4);
qvisit=zeros(210,10); % certain dummy qvalues corresponding to wall blocks wont be updated
alpha=0.05; % step size parameter
epsilon=0.1; % exploration policy
num_iters=50;
gamma=0.90;
lambda=0.5;
Pbag={};

for tries=1:30
    qvalues=zeros(210,4);
    temporary=zeros(210,10);
    for i=1:num_iters
    ssrand1=randperm(10);
    ssrand2=randperm(10);
    
  curstate=[ssrand1(1),ssrand2(1)]; % Ensure we start in a random state in the left hall
        
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
        
        if (i>20 && i< 30)
        temporary(csi,i-20)=1;
                          % mark as visited state
        end
        
        [rew,nextstate,signal]=transition(curstate,action);
        nsi=sub2ind(size(allstates),nextstate(1),nextstate(2));
        if(signal==1)
            qvalues(csi,action)=qvalues(csi,action)+ alpha*(rew- qvalues(csi,action));
            fprintf('Agent has reached goal state \n');
            if (i>20 && i< 31)
             temporary(csi,i-20)=1;
              temporary(nsi,i-20)=1;% mark as visited state
            end
            break; %actionvalues for terminal state is all zero.
        end
      
        
            
        temp=find(max(qvalues(csi,:))==qvalues(csi,:));
        temp1=randperm(size(temp,2)); % ensure equal q values are selected with equal chance
        action=temp(temp1(1)); % This is the max over action for the next state(unless terminal)
       
        qmaxnext=qvalues(nsi,action);
        
        qvalues(csi,action)=qvalues(csi,action)+ alpha*(rew+ gamma*qmaxnext - qvalues(csi,action));% Qlearning update
        
      curstate=nextstate;
        end
    end 
disp(tries);
qvisit=temporary+qvisit;
end

qvisit1=sum(qvisit,2);
qans=reshape(qvisit1,size(allstates));
imagesc(qans);
   
