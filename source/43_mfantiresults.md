
## Model 3 {#sec:results:model3}
<!-- Bipartite society: cohesiveness and antagonism -->

In [@sec:methods:model3] we presented a model for a bipartite society that presented a balance between in-group ferromagnetism and inter-group antiferromagnetism. This lead us to [@eq:fmaxima1;@eq:fmaxima2], a set of consistent relations we needed to solve to find the stable solutions $(x^*, y^*)$ corresponding to the maxima of $f(x, y)$.

We repeat the results below for completeness:

\begin{align}
    &f(x, y) = \frac{N_A}{N} \log \left( \frac{\sinh \beta \delta x + (1-2\varepsilon)y}{\beta \delta x + (1-2\varepsilon)y} \right) + \frac{N_B}{N} \log \left( \frac{\sinh \beta \delta y + (1-2\varepsilon)x}{\beta \delta y + (1-2\varepsilon)x} \right) \\
    \nonumber &\qquad\qquad\qquad - \frac{\beta \delta}{2} \left( x^2 + y^2 \right) - \beta (1-2\varepsilon) xy \\
    &\delta x + (1-2\varepsilon)y = \delta x + (1-2\varepsilon)y,\ \qquad \delta y + (1-2\varepsilon)x = \delta y + (1-2\varepsilon)x
\end{align}

Before solving the system it is useful to have a proper interpretation to $x^*$ and $y^*$. To do that we can insert source terms $H_A \sum_{i \in A} h_i$ and $H_B \sum_{j \in B} h_j$ in the Hamiltonian ([@eq:hamiltonian2]):

$$  \hamiltonian =  -\frac{\delta}{N} \sum_{\langle i, j \rangle \in A} h_i h_j -\frac{\delta}{N} \sum_{\langle i, j \rangle \in B} h_i h_j - \frac{(1 - 2 \varepsilon)}{N} \sum_{\substack{i \in A \\ j \in B}} h_i h_j - H_A \sum_{i \in A} h_i - H_B \sum_{j \in B} h_j $$  {#eq:hamiltonian3}

This shifts the free energy with $\beta z_{A,B} \to \beta\left( z_{A,B} + H_{A,B} \right)$, which give us the following partition function:

\begin{align}
    \log Z_B &= N_A \log \left( \frac{\sinh \beta (\delta x^* + (1-2\varepsilon)y^* + H_A)}{\beta (\delta x^* + (1-2\varepsilon)y^* + H_A)} \right) \label{eq:finallogzanti2} \\
    \nonumber + &N_B \log \left( \frac{\sinh \beta (\delta y^* + (1-2\varepsilon)x^* + H_B)}{\beta (\delta y^* + (1-2\varepsilon)x^* + H_B)} \right) - \frac{\beta \delta}{2} \left( (x^*)^2 + (y^*)^2 \right) - \beta (1-2\varepsilon) x^*y^*
\end{align}

Differentiating [@eq:finallogzanti2] with respect to $H_A$ we obtain:

$$ \left. \del{\log Z}{H_A} \right|_{H_A = 0} \hspace{-2mm} = N_A \beta \left[ \tanh \left( \beta \delta x^* + (1-2\varepsilon)y^* + \beta H_A \right) - \frac{1}{\beta \delta x^* + (1-2\varepsilon)y^* + H_A} \right] $$ {#eq:dellogz2}

On the other hand, differentiating directly the definition of the partition with respect to the source lead us into a mean value we associate with a magnetization:

\vspace{-3mm}

\begin{align}
    \nonumber &\left. \del{\log Z}{H_A} \right|_{H_A = 0} \hspace{-2mm} = \frac1Z \Del{H_A} \int \mathrm{d}h\ \exp(-\beta \hamiltonian) \\
    &\qquad = \frac1Z \int \mathrm{d}h\ \left( \beta \sum_{i \in A} h_i \right) \exp(-\beta \hamiltonian) = \beta \left\langle \sum_{i \in A} h_i \right\rangle = \beta N m_A \label{eq:dellogz1}
\end{align}

where we defined $m_A \equiv \frac1N \left\langle \sum_{i \in A} h_i \right\rangle$ and $m_B \equiv \frac1N \left\langle \sum_{j \in B} h_j \right\rangle$.
<!-- $$ m_A = N_A \left[ \cotanh \beta \delta x + (1-2\varepsilon)y - \frac{1}{\beta \delta x + (1-2\varepsilon)y} \right] $$ -->

Now we can take [@eq:fmaxima1;@eq:fmaxima2]:

\begin{align}
	N \left[ \delta x^* + (1-2\varepsilon)y^* \right] &= N_A \delta \left[ \coth \beta \delta x^* + (1-2\varepsilon)y^* - \frac{1}{\beta \delta x^* + (1-2\varepsilon)y^*} \right] \\
    \nonumber +& N_B (1-2\varepsilon) \left[ \coth \beta \delta y^* + (1-2\varepsilon)x^* - \frac{1}{\beta \delta y^* + (1-2\varepsilon)x^*} \right] \\
	N \left[ \delta y^* + (1-2\varepsilon)x^* \right] &= N_B \delta \left[ \coth \beta \delta y^* + (1-2\varepsilon)x^* - \frac{1}{\beta \delta y^* + (1-2\varepsilon)x^*} \right] \\
    \nonumber +& N_A (1-2\varepsilon) \left[ \coth \beta \delta x^* + (1-2\varepsilon)y^* - \frac{1}{\beta \delta x^* + (1-2\varepsilon)y^*} \right] \nonumber
\end{align}

and compare with [@eq:dellogz1] and [@eq:dellogz2] to find that the stable solutions $x^*$ and $y^*$ are the magnetizations for each community:

$$ x^* = m_A \qquad y^* = m_B $$ {#eq:magnetization}

Now we perform once again the iterative process described in [@eq:updatemap] for several values of the parameters $(\beta, \delta, \varepsilon)$ and obtain the fixed points of the system. Once again optimizing $\alpha$ was unnecessary because the convergence was not a problem.

We considered only the situation in which the populations have the same size, that is, $N_A = N_B$.

![The phase diagram when $\beta = 10.0$ and $N_A = N_B$ . The initial points for the iterative algorithm were $x_0 = 0.9, y_0 = 0.1$](images/phasediagram-full-beta10-rho05-initial0901.png){#fig:phasediagram width='80%'}

From [@fig:phasediagram], beyond the expected behavior of an all-agreeing phase and a disagreeing one, we also note that there is a region where both groups present zero magnetization. This can be seen also from the free energy plot below ([@fig:freeenergydisorder]), and is due to the interplay between agreement and disagreement in the groups' interactions: it is a region of the $(\beta, \delta, \varepsilon)$-space inside which the agents cannot decide whether it is best to agree with their peer group or to disagree with the foe group, so the society enters a frustrated state. In statistical mechanics terms: both strategies (agreeing with my group or disagreeing with the other one) don't succeed in minimizing the overall energy of the system, so the only solution is to have zero magnetization throughout the society.

![Free energy $f(x, y)$ landscape when $\beta = 10.0, \delta = 0.25, \varepsilon = 0.6$ and $N_A = N_B$ . This is a region in which there is no consensus among the communities](images/freeenergy-beta10-delta25-eps6-rho05.png){#fig:freeenergydisorder width='70%'}

We also present the other $2$ behaviours, expected from previous models: consensus in [@fig:freeenergyconsensus] and polarization in [@fig:freeenergypolarization]. Note that, depending on the initial choice of alignment of the communities $(x_0, y_0)$, the society (or, the iterative algorithm) converges to different and opposing states. This does not mean much about the dynamics of the model, it is only a statement on which group would align in favor of against of a given opinion (e.g. in one hypothetical situation community $A$ could be in favor of a free basic income policy and community $B$ against it, whereas under another initial condition the communities would change roles).

We also show some plots of the free energy at the transition $\varepsilon = 0.5$ in [@fig:freeenergynext1;@fig:freeenergynext2]. Since the society is at the transition, both consensus and polarization scenarios can be observed when $\delta$ is high.

![Free energy $f(x, y)$ landscape when $\beta = 10.0, \delta = 0.8, \varepsilon = 0.2$ and $N_A = N_B$ . This is a region in which there is overall consensus among the society](images/freeenergy-beta10-delta8-eps2-rho05.png){#fig:freeenergyconsensus width='70%'}

![Free energy $f(x, y)$ landscape when $\beta = 10.0, \delta = 0.8, \varepsilon = 0.8$ and $N_A = N_B$ . This is a region in which there is internal consensus on each community but they disagree with one another.](images/freeenergy-beta10-delta8-eps8-rho05.png){#fig:freeenergypolarization width='70%'}

![Free energy $f(x, y)$ landscape when $\beta = 10.0, \delta = 0.8, \varepsilon = 0.5$ and $N_A = N_B$ .](images/freeenergy-beta10-delta9-eps5-rho05.png){#fig:freeenergynext2 width='70%'}
