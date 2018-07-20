
## Bipartite society: cohesiveness and antagonism {#sec:mfantiresults}

In [@sec:mfantiferromagnetic] we presented a model for a bipartite society that presented a balance between in-group ferromagnetism and inter-group antiferromagnetism. This lead us to [@eq:fmaxima], a set of consistent relations we needed to solve to find the stable solutions $(x^*, y^*)$ corresponding to the maxima of $f(x, y)$.

Before solving the system it is useful to have a proper interpretation to $x^*$ and $y^*$. To do that we can insert source terms $H_A \sum_{i \in A} h_i + H_B \sum_{j \in B} h_j$ in the Hamiltonian ([@eq:hamiltonian2]), which shifts the free energy with $\beta z_{A,B} \to \beta\left( z_{A,B} + H_{A,B} \right)$. Usual statistical mechanics calculations lead us into:

$$ \left. \del{\log Z}{H_A} \right|_{H_A = 0} = \beta \left\langle \sum_{i \in A} h_i \right\rangle = \beta N m_A $$ {#eq:dellogz1}

where we defined $m_A \equiv \frac1N \left\langle \sum_{i \in A} h_i \right\rangle$ and $m_B \equiv \frac1N \left\langle \sum_{j \in B} h_j \right\rangle$.

On the other hand, differentiating [@eq:finallogzanti] with respect to $H_A$ we obtain:

$$ \left. \del{\log Z}{H_A} \right|_{H_A = 0} = N \del{f}{H_A} = \rho_A\ \beta N \left[ \tanh \left( \beta z_A + \beta H_A \right) - \frac{1}{\beta z_A + H_A} \right] $$ {#eq:dellogz2}

<!-- $$ m_A = \rho_A \left[ \cotanh \beta z_A - \frac{1}{\beta z_A} \right] $$ -->

Comparing [@eq:fmaxima], [@eq:dellogz1] and [@eq:dellogz2], we find that the stable solutions $x^*$ and $y^*$ are the magnetizations for each community:

$$ x^* = m_A \qquad y^* = m_B $$ {#eq:magnetization}

Now we perform once again the iterate process described in [@eq:updatemap] for several values of the parameters $(\beta, \delta, \varepsilon)$ and obtain the fixed points of the system. Once again optimizing $\alpha$ was unnecessary because the convergence was not a problem.

We considered only the situation in which the populations have the same size, that is, $\rho_A = \rho_B = 0.5$.

![The phase diagram when $\beta = 10.0$ and $\rho_A = \rho_B = 0.5$. The initial points for the iterative algorithm were $x_0 = 0.9, y_0 = 0.1$](images/phasediagram-full-beta10-rho05-initial0901.png){#fig:phasediagram width='80%'}

From [@fig:phasediagram], beyond the expected behavior of an all-agreeing phase and a disagreeing one, we also note that there is a region where both groups present zero magnetization. This can be seen also from the free energy plot below ([@fig:freeenergydisorder]), and is due to the interplay between agreement and disagreement in the groups' interactions: it is a region of the $(\beta, \delta, \varepsilon)$-space inside which the agents cannot decide whether it is best to agree with their peer group or to disagree with the foe group, so the society enters a frustrated state. In statistical mechanics terms: both strategies (agreeing with my group or disagreeing with the other one) don't succeed in minimizing the overall energy of the system, so the only solution is to have zero magnetization throughout the society.

![Free energy $f(x, y)$ landscape when $\beta = 10.0, \delta = 0.25, \varepsilon = 0.6$ and $\rho_A = \rho_B = 0.5$. This is a region in which there is no consensus among the communities](images/freeenergy-beta10-delta25-eps6-rho05.png){#fig:freeenergydisorder width='70%'}

We also present the other $2$ behaviours, expected from previous models: consensus in [@fig:freeenergyconsensus] and polarization in [@fig:freeenergypolarization]. Note that, depending on the initial choice of alignment of the communities $(x_0, y_0)$, the society (or, the iterative algorithm) converges to different and opposing states. This does not mean much about the dynamics of the model, it is only a statement on which group would align in favor of against of a given opinion (e.g. in one hypothetical situation community $A$ could be in favor of a free basic income policy and community $B$ against it, whereas under another initial condition the communities would change roles).

\newpage

![Free energy $f(x, y)$ landscape when $\beta = 10.0, \delta = 0.8, \varepsilon = 0.2$ and $\rho_A = \rho_B = 0.5$. This is a region in which there is overall consensus among the society](images/freeenergy-beta10-delta8-eps2-rho05.png){#fig:freeenergyconsensus width='70%'}

![Free energy $f(x, y)$ landscape when $\beta = 10.0, \delta = 0.8, \varepsilon = 0.8$ and $\rho_A = \rho_B = 0.5$. This is a region in which there is internal consensus on each community but they disagree with one another.](images/freeenergy-beta10-delta8-eps8-rho05.png){#fig:freeenergypolarization width='70%'}
