NIPS Spotlight Talk
===================

## Slide 1
- Paper title
- Work with BVR
- Part of engineering at Stanford university

## Slide 2
*What is RL and why do we care*

- We are looking at learning problems + decision making + delayed consequences.
- This progression takes Supervised learning to bandits to RL... and it's an incredibly powerful and wholistic view of the decision problem.
- There are tons of important applications (healthcare, agriculture, robotics, finance).
- You might think of Mario trying to collect coins and defeat Bowser.
- To do this you have to understand the problem and plan ahead.
- One big problem here is Exploration vs. Exploitation.
- The choices I make affect my performance but also what I learn...
- Our **goal** is to get a reinforcement learning algorithm which will balance these needs and give us performance which is as good as possible.
- One way to think about this performance is through what we call the Regret.
- The Regret(T) is the expected difference in rewards between the unknown optimal controller and those which the algorithm actually receives.
- If the Regret grows sub linearly in T then eventually we will learn the optimal policy.
- The problem is that in the real world that might not be good enough - we want to learn to behave well now!
- And here comes the bad news: we know that over a general MDP with S states and A actions the regret will grow with a lower bound $$$\sqrt{SAT}$$$.
- This means that is take time T order SA to start to have any learning guarantees.
- But for all those problems I mentioned before (healthcare, agriculture, robotics and even Mario) the number of states is going to be absolutely huge!
- This seems pretty hopeless...

## Slide 3
*How can we get around these lower bounds*

- Here we take some inspiration from the supervised learning literature.
- We know that the complexity of a supervised learning problem comes down to the number of parameters in a family.
- This means that if there is some low-dimensional structure, such as VC-dimension, then even large problems can become tractable.
- Our only hope is that if the system exhibits some low-dimensional structure then we can exploit this to learn faster.
- We choose to focus on the well-studied example of factored MDPs.
- These are MDPs which exhibit some conditional independence structure.
- My favorite example for this is to imagine a large production line with lots of machines in sequence.
- Each machine can be in a different state (working, empty or broken) and the production line ultimately depends on the state each and every machine.
- However, over a small tilmestep the evolution of each machine only depends directly upon its neighbors.
- This simple conditional independence reduces the complexity of the overall system exponentially.
- We show in this paper that it is this MDP complexity that is important in the learning process, not just the number of states.
- We obtain regret bounds that scale with the number of parameters, which may be exponentially smaller than the number of states or actions.
- To attain these bounds its crucial to have some efficient way of balancing exploration vs exploitation.
- We develop two simple algorithms, one based upon optimism and the other on posterior sampling that do exactly this to attain near-optimal bounds.
- The key result is that if you have K independent sections then using a naive RL algorithm you'd get lower bounds which are exponential in K.
- We show that you can exploit this knowledge to get bounds which are instead LINEAR in K, which is also the lower bound for this scaling.
- So what's the key takeaway?
- Reinforcement learning is a really exciting field with a lot of important applications.
- Due to the curse of dimensionality, a lot of these applications have extremely large state spaces...
- The key to getting practical performance here will be to exploit low-dimensional structure even in high-dimensional systems.
- In our paper we show how you can do this in Factored MDPs using two simple algorithms.
- We pair this with analysis that show regret bounds grow with the number of parameters, rather than the number of states.
- This simple change can lead to exponentially better performance.