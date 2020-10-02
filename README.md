# Particle swarm otimisation 

The Particle Swarm Optimisation (PSO) algorithm is inspired by the swarm intelligence observed in a flying flock of birds or swimming school of fish.
This algorithm can be effective in training neural networks by optimising the error function of the netowrk. 

The alogorithm here was created in scilab  and is used as demonstration to try and find the global minimum for the functionn f(x,y)=-(y+47)  sin⁡(√(|y+x/2+47| ))-xsin(√(|x-(y+47)| )). The x and y values are bounded in the range [-512,512]. The algorithm also adopts a dynamic stopping criteria where the algorithm terminates if there are no improving global/local minimum after 50 iterations.

