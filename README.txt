1) In order to obtain first visit frequency plots- Run firstvisitfrequency.m

2) Obtain30trajectories.m Will simulate 30 runs, and will give you a Cell of size 30x50, where Pbag{2,3} is a matrix which contains 3rd      
   epsiode trajectories from the 2nd trial.
   USE This Pbag obtained in function plotdd.m. Example plotdd(Pbag(1:5),1:25) will give you smooth plots over 5 trails of the log dd after 
   25 episodes

3) transition.m simulates the environment, change the wall position if desired.

4) Densitydiv.m is the diverse density calculator.Pinstance, Ppositive, Pnegative are the functions used in it.Scaling is not used since both 
    x and y are pretty much same scale. If you want to weigh different features differently, say x is 1 to 10, y from 1000 to 2000, modify the
    code to change the distance measure.
   Pbag is input as a cell, where Pbag{1}(1,:) indicates the first instance in bag1.

5) Data for Use folder, contains 30 runs of the matlab file, each trial containing 50 tries of the agent.
   Hence size(Pbag)=[30 50]. To access the trajectory the agent took in the first trial, first iteration,
   access Pbag{1,1}. This a matrix containing the complete trajectory.

6) llaverageafter25.mat contains negative log of the diverse density obtained after 25 trials, averaged over multiple trials.

7) Cmptrunning average calculates the running average mentioned in the paper.This wont be neccesary to visualize the logdd values.



