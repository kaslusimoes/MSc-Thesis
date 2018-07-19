
## Bipartite society: coherence and opposition {#sec:mfantiresults}

In [@sec:mfantiferromagnetic] we presented a model for a bipartite society that presented a balance between in-group ferromagnetism and inter-group antiferromagnetism. This lead us to [@eq:fmaxima], a set of consistent relations we needed to solve to find the stable solutions $(x^*, y^*)$ corresponding to the maxima of $f(x, y)$.

Before solving the system it is useful to have a proper interpretation to $x^*$ and $y^*$. To do that we can insert source terms $H_A \sum_{i \in A} h_i + H_B \sum_{j \in B} h_j$ in the Hamiltonian ([@eq:hamiltonian2]) and proceed with usual statistical mechanics calculations to obtain that the stable solutions are the magnetizations for each community:

$$ x^* = \frac1N \left\langle \sum_{i \in A} h_i \right\rangle \equiv m_A \qquad y^* = \frac1N \left\langle \sum_{j \in B} h_j \right\rangle \equiv m_B $$ {#eq:magnetization}

Now we perform once again the iterate process described in [@eq:updatemap] for several values of the parameters $(\beta, \delta, \varepsilon)$ and obtain the fixed points of the system. Once again optimizing $\alpha$ was unnecessary because the convergence was not a problem.

We considered only the situation in which the populations have the same size, that is, $\rho_A = \rho_B = 0.5$.

![The phase diagram when $\beta = 10.0$ and $\rho_A = \rho_B = 0.5$. The initial points for the iterative algorithm were $x_0 = 0.9, y_0 = 0.1$](images/phasediagram-full-beta10-rho05-initial0901.png){#fig:phasediagram width='80%'}

From [@fig:phasediagram], beyond the expected behavior of an all-agreeing phase and a disagreement one, we also note that there is a region where both groups present zero magnetization. This can be seen also from the free energy plot, in [@fig:freeenergydisorder], below, and this is due to the interplay between agreement and disagreement in the groups' interactions.

![Free energy $f(x, y)$ landscape when $\beta = 10.0, \delta = 0.25, \varepsilon = 0.6$ and $\rho_A = \rho_B = 0.5$. This is a region in which there is no consensus among the communities](images/freeenergy-beta10-delta25-eps6-rho05.png){#fig:freeenergydisorder width='60%'}

We also present the other $2$ expected behaviours: consensus and polarization in [@fig:freeenergyconsensus; and @fig:freeenergypolarization]. Note that depending on the initial choice $(x_0, y_0)$ of alignment of the communities with the issue being discussed the society (the iterative algorithm) would converge to different and opposing states. This does not mean much about the dynamics of the model, it is only a statement on which group would align in favor of against of a given opinion (e.g. in one hypothetical situation community $A$ could be in favor of a free basic income policy and community $B$ against it, whereas under another initial condition the communities would change roles).

![Free energy $f(x, y)$ landscape when $\beta = 10.0, \delta = 0.8, \varepsilon = 0.2$ and $\rho_A = \rho_B = 0.5$. This is a region in which there is overall consensus among the society](images/freeenergy-beta10-delta8-eps2-rho05.png){#fig:freeenergyconsensus width='60%'}

![Free energy $f(x, y)$ landscape when $\beta = 10.0, \delta = 0.8, \varepsilon = 0.8$ and $\rho_A = \rho_B = 0.5$. This is a region in which there is internal consensus on each community but they disagree with one another.](images/freeenergy-beta10-delta8-eps8-rho05.png){#fig:freeenergypolarization width='60%'}
