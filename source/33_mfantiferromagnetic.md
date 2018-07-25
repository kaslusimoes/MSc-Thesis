
## Model 3 {#sec:methods:model3}
<!-- A model for a Bipartite Society -->

In our third model we investigate the existence of groups, or factions, inside the society. This is a situation not encountered naturally in the models presented before in the case of one discussed query, $\zeitgeist$. Another advantage this model has over the one in [@sec:methods:model1] is that in that one the only values of mistrust $\varepsilon$ we could explore were between $0$ and $0.5$ (as we present in [@sec:results:model1]). This is because for values of $\varepsilon > 0.5$ the society enters a frustrated state which cannot be resolved by aligning nor anti-aligning the opinions of the agents. A similar problem is known for the infinite-range Ising model and can be solved separating the spins into 2 groups.

Both because of our interest in investigating groups' interactions in society and because of the drawback of the first model just mentioned, we proceed in the same way of the infinite-range Ising model: we separate the agents into 2 groups, which we call _communities_. These communities have ferromagnetic interactions within them and antiferromagnetic ones between elements of different groups (depicted in [@fig:antiferro2groups]).

![Exemplification of the interactions between and inside the 2 communities in a bipartite society](images/antiferromagnetic-2groups.png){#fig:antiferro2groups width='55%'}

We borrow [@eq:hamiltonianvisujeca] from [@sec:methods:model2], and consider two different situations to build the Hamiltonian of a bipartite society: the first one, in which the agents interacting are agreeing $h_ih_j>0$; and a second one, in which the agents are disagreeing $h_ih_j<0$. These two situations yield different contributions: $-\delta h_ih_j$ and $-h_ih_j$, respectively. The first term will be the interaction term inside a given community, whereas the second one will be the interaction term between communities.

After modulating the antiferromagnetic interaction with a noise level $\varepsilon$, the Hamiltonian describing our bipartite society is:

$$  \hamiltonian =  -\frac{\delta}{N} \sum_{\langle i, j \rangle \in A} h_i h_j -\frac{\delta}{N} \sum_{\langle i, j \rangle \in B} h_i h_j - \frac{(1 - 2 \varepsilon)}{N} \sum_{\substack{i \in A \\ j \in B}} h_i h_j $$ {#eq:hamiltonian2}

where the $h_i \in [-1, 1]$ are the opinion fields for each of the $N$ agents. Both parameters $\delta$ and $\varepsilon$ can have values on the interval $[-1, 1]$. We note that $\delta$ describes the intensity of the in-group ferromagnetic interactions, whereas $\varepsilon$ describes the inter-group antiferromagnetic ones.

Considering the constraint of the expected value of the energy $\langle\hamiltonian\rangle_{P_B} = E$, usual maximum entropy arguments lead us to a canonical distribution $P_B(\{h_i\}) = \frac{1}{Z_B} \exp(-\beta \hamiltonian)$. We proceed evaluating the partition function of the model.

First, let us rewrite the Hamiltonian in the following way:

\begin{align}
  \hamiltonian &=  -\frac{\delta}{N} \sum_{\langle i, j \rangle \in A} h_i h_j -\frac{\delta}{N} \sum_{\langle i, j \rangle \in B} h_i h_j - \frac{(1 - 2 \varepsilon)}{N} \sum_{\substack{i \in A \\ j \in B}} h_i h_j \\
  =& -\frac{N}{2} \left[ \delta \left( \frac1N \sum_{i \in A} h_i \right)^2 + \delta \left( \frac1N \sum_{j \in B} h_i \right)^2 + 2(1 - 2 \varepsilon) \left( \frac1N \sum_{i \in A} h_i \right) \left( \frac1N \sum_{j \in B} h_j \right) \right] \label{eq:modhamiltonian}
\end{align}

We recognize that we have only squared terms in the Hamiltonian, which renders the evaluation of the partition function rather difficult. One way around this is to use the following gaussian identity:

\begin{align}
    \label{eq:gaussiantrick2d} \exp\left( \frac{A^2 + B^2 +2\rho A B}{2(1-\rho^2)} \right) &= \\
    \int_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{2\pi\sqrt{1 - \rho^2}}\ &\exp\left( -\frac{ x^2 + y^2 + 2\rho x y - 2A(x+\rho y) - 2B(y+\rho x)}{2(1-\rho^2)} \right) \nonumber
\end{align}

We can associate some quantities from [@eq:modhamiltonian] to quantities in [@eq:gaussiantrick2d] to continue the calculation:

\begin{align}
    &A = \frac1N \sum_{i\in A} h_i\ \qquad\ B = \frac1N \sum_{j\in B} h_j \\
    &\frac{1}{1-\rho^2} = \beta N \delta\ \qquad\ \frac{\rho}{1-\rho^2} = \beta N (1-2\varepsilon)
\end{align}

Now, we have:

\begin{align}
    Z_B &= \int_{-1}^1 \mathrm{d}h_1 \int_{-1}^1 \mathrm{d}h_2 \cdots \int_{-1}^1 \mathrm{d}h_N\ \exp(-\beta \hamiltonian) = \int \mathrm{d}h\ \exp(-\beta \hamiltonian) \\
    &= \int \mathrm{d}h\ \exp \left\{ \frac{\beta N}{2} \left[ \delta \left( \frac1N \sum_{i \in A} h_i \right)^2 + \delta \left( \frac1N \sum_{j \in B} h_i \right)^2 \right. \right. \\
    &\hspace{30mm}\ + \left. \left. 2(1 - 2 \varepsilon) \left( \frac1N \sum_{i \in A} h_i \right) \left( \frac1N \sum_{j \in B} h_j \right) \right] \right\} \\
    &= \int \mathrm{d}h\ \int_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{2\pi\sqrt{1 - \rho^2}}\ \exp\left( -\frac{ x^2 + y^2 + 2\rho x y - 2A(x+\rho y) - 2B(y+\rho x)}{2(1-\rho^2)} \right) \\
    &= \int_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{2\pi\sqrt{1 - \rho^2}} \exp\left( -\frac{x^2 + y^2 + 2\rho x y}{2(1-\rho^2)} \right) \int \mathrm{d}h\ \exp\left( \frac{A(x+\rho y) + B(y+\rho x)}{1-\rho^2} \right) \\
    &= \int_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{2\pi} \sqrt{\beta \delta N} \exp\left( -\frac{\beta N}{2} \left(\delta x^2 + \delta y^2 + 2(1-2\varepsilon) x y \right) \right) \\
    &\hspace{30mm} \times \int \mathrm{d}h\ \exp\left( \beta z_A \sum_{i \in A} h_i + \beta z_B \sum_{j \in B} h_j \right)
\end{align}

where we defined $z_B = \delta x + (1-2\varepsilon) y$ and $z_B = \delta y + (1-2\varepsilon) x$. Now we evaluate the integral over $h$ separating into contributions from group $A$ and contributions from group $B$:

\begin{align}
    I_h &= \int \mathrm{d}h\ \exp\left( \beta z_A \sum_{i \in A} h_i + \beta z_B \sum_{j \in B} h_j \right) \\
    &= \int \mathrm{d}h_A\ \exp\left( \beta z_A \sum_{j \in A} h_i \right)\int \mathrm{d}h_B\ \exp\left( \beta z_B \sum_{j \in B} h_j \right) \\
    &= \left[ \int_{-1}^1 \mathrm{d}h_i\ \exp\left( \beta z_A h_i \right) \right]^{n_A} \left[ \int_{-1}^1 \mathrm{d}h_j\ \exp\left( \beta z_B h_j \right) \right]^{n_B} \\
    &= 2^N \left[ \frac{\sinh \beta z_A}{\beta z_A} \right]^{n_A} \left[ \frac{\sinh \beta z_B}{\beta z_B} \right]^{n_B}
\end{align}

Inserting this result back into $Z$, one obtains:

$$ Z_B = 2^N \int_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{2\pi} \sqrt{\beta\delta N} e^{Nf(x, y)} $$ {#eq:zantiferro}

where $f$ will be associated to the free energy of the model:

$$ f(x, y) = \rho_A \log \left( \frac{\sinh \beta z_A}{\beta z_A} \right) + \rho_B \log \left( \frac{\sinh \beta z_B}{\beta z_B} \right) - \frac{\beta \delta}{2} \left( x^2 + y^2 \right) - \beta (1-2\varepsilon) xy $$

where $\rho_{A,B} = \frac{n_{A,B}}{N}$ is the fraction of agents in a given population, and we implicitly defined two auxiliary variables for ease of calculation: $z_A = \delta x + (1-2\varepsilon)y$ and $z_B = \delta y + (1-2\varepsilon)x$.

We expect $N$ to be large, so we expand $f(x, y)$ around its maximum $(x^*, y^*)$ to obtain a good approximation of the integral. This is known as Laplace's method. Differentiating $f$ with respect to its variables and finding the maxima, one obtains the following set of equations:

\begin{align}
	z_A^* = \rho_A \delta \left[ \coth \beta z_A^* - \frac{1}{\beta z_A^*} \right] + \rho_B (1-2\varepsilon) \left[ \coth \beta z_B^* - \frac{1}{\beta z_B^*} \right] \label{eq:fmaxima} \\
	z_B^* = \rho_B \delta \left[ \coth \beta z_B^* - \frac{1}{\beta z_B^*} \right] + \rho_A (1-2\varepsilon) \left[ \coth \beta z_A^* - \frac{1}{\beta z_A^*} \right] \nonumber
\end{align}

One can then come back to [@eq:zantiferro], continue Laplace's method extracting the term $e^{Nf(x^*, y^*)}$ from the integral and taking the logarithm to obtain:

$$ \log Z_B(\beta, \delta, \varepsilon) = N f(x^*, y^*, \beta, \delta, \varepsilon) + \mathrm{const.} + \mathcal{O}(N) $$ {#eq:finallogzanti}

Now, with the partition function, we have the thermodynamical model and we can understand the behaviour of the system under different regimes of the parameters.
