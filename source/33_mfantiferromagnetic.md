
## Model 3 {#sec:methods:model3}
<!-- A model for a Bipartite Society -->

In our third model we investigate the existence of groups, or factions, inside the society. This is a situation not encountered naturally in the models presented before in the case of one discussed query, $\zeitgeist$. Another advantage this model has over the one in [@sec:methods:model1] is that in that one the only values of mistrust $\varepsilon$ we could explore were between $0$ and $0.5$ (as we present in [@sec:results:model1]). This is because for values of $\varepsilon > 0.5$ the society enters a frustrated state which cannot be resolved by aligning nor anti-aligning the opinions of the agents.

__FALAR DO MEU MODELO SEM MOSTRAR NÃO ROLA, ALÉM DISSO ESCREVER ALGO DO ISING__

A similar problem is known for the infinite-range Ising model which we present below

### Infinite-range Ising model {#sec:isingmodel}

The hamiltonian describing the infinite-range Ising model is

$$ \hamiltonian_I = - \frac{J}{N} \sum_{\langle ij \rangle} s_i s_j - h \sum_i s_i $$

From that, the partition function is:

$$ Z_I = \sum_{\{s\}} \exp \left( \frac{\beta J}{N} \sum_{\langle ij \rangle} s_i s_j + \beta h \sum_i s_i \right) $$ {#eq:partitionising1}

We cannot do the sum to solve $Z_I$ with the quadratic terms in the exponential. So we have to use the following expression for a gaussian distribution:

$$ \exp\left(\frac{\beta J N m^2}{2}\right) = \intinf \frac{\mathrm{d}M}{\sqrt{2\pi/(\beta J N)}} \exp \left( - \frac12 \beta J N M^2 + \beta J N m M \right) $$ {#eq:gaussiantrick1d}

Now we define $m = \frac1N \sum_i s_i$ and substitute [@eq:gaussiantrick1d] into [@eq:partitionising1] to perform the sum and obtain:

\begin{align}
    Z_I &= 2^N \intinf \frac{\mathrm{d}M}{\sqrt{2\pi/(\beta J N)}} \exp \left( - \frac12 \beta J N M^2 \right) \exp \left( N \log \cosh (\beta J M + \beta h ) \right) \\
    &= c_N \intinf \mathrm{d}M e^{-N\beta J f(M)}
\end{align}

where $f(M) = \frac1 M^2 - \frac{1}{\beta J} \log \cosh (\beta M + \beta h)$ can be associated to the free energy of the model.

We expect $N$ to be large, so we expand $f(M)$ around its maximum $M^*$ to obtain a good approximation of the integral. This is known as Laplace's method. Differentiating $f$ with respect to $M$ and finding the maximum, one obtains the known relation of Curie-Weiss:

$$ M^* = \tanh [\beta (M^* + h)] $$ {#eq:curieweiss}

Back to the partition function, one can do the integral and obtain the thermodynamics of the mode:

$$ \frac{1}{\beta J N} \log Z_I = - f(M^*) + \mathrm{constant\ terms} $$ {#eq:thermoising}

For this calculation to work properly we depends on the fact that $J>0$. If we considered antiferromagnetic interactions, that is $J<0$, the gaussian substitution needed to find the final solution would not be valid. This motivates the separation of the Ising spins into 2 groups: inside the groups the interaction is ferromagnetic and between spins of different groups it is antiferromagnetic.

<!-- and can be solved separating the spins into 2 groups. -->

### Bipartite Society {#sec:bipartitesociety}

__CHECK IF IT IS MAKING SENSE__

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
    &\hspace{30mm} \times \int \mathrm{d}h\ \exp\left( \beta \left[ \delta x + (1-2\varepsilon)y\right] \sum_{i \in A} h_i + \beta \left[ \delta y + (1-2\varepsilon)x \right] \sum_{j \in B} h_j \right)
\end{align}

Now we evaluate the integral over $h$ separating into contributions from each group:

\begin{align}
    I_h &= \int \mathrm{d}h\ \exp\left( \beta \left[ \delta x + (1-2\varepsilon)y \right] \sum_{i \in A} h_i + \beta \left[ \delta y + (1-2\varepsilon)x \right] \sum_{j \in B} h_j \right) \\
    &= \int \mathrm{d}h_A\ \exp\left( \beta \left[ \delta x + (1-2\varepsilon)y \right] \sum_{j \in A} h_i \right)\int \mathrm{d}h_B\ \exp\left( \beta \left[ \delta y + (1-2\varepsilon)x \right] \sum_{j \in B} h_j \right)
\end{align}

\begin{align}
    I_h &= \left[ \int_{-1}^1 \mathrm{d}h_i\ \exp\left( \beta \left[ \delta x + (1-2\varepsilon)y \right] h_i \right) \right]^{N_A} \left[ \int_{-1}^1 \mathrm{d}h_j\ \exp\left( \beta \left[ \delta y + (1-2\varepsilon)x \right] h_j \right) \right]^{N_B} \\
    &= 2^N \left[ \frac{\sinh \beta \left[ \delta x + (1-2\varepsilon)y \right]}{\beta \left[ \delta x + (1-2\varepsilon)y \right]} \right]^{N_A} \left[ \frac{\sinh \beta \left[ \delta y + (1-2\varepsilon)x \right]}{\beta \left[ \delta y + (1-2\varepsilon)x \right]} \right]^{N_B}
\end{align}

Inserting this result back into $Z$, one obtains:

$$ Z_B = 2^N \int_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{2\pi} \sqrt{\beta\delta N} e^{Nf(x, y)} $$ {#eq:zantiferro}

where $f$ will be associated to the free energy of the model:

\begin{align}
    f(x, y) &= \frac{N_A}{N} \log \left( \frac{\sinh \beta \left[ \delta x + (1-2\varepsilon)y \right]}{\beta \left[ \delta x + (1-2\varepsilon)y \right]} \right) + \frac{N_B}{N} \log \left( \frac{\sinh \beta \left[ \delta y + (1-2\varepsilon)x \right]}{\beta \left[ \delta y + (1-2\varepsilon)x \right]} \right) \\
    \nonumber &\qquad - \frac{\beta \delta}{2} \left( x^2 + y^2 \right) - \beta (1-2\varepsilon) xy
\end{align}

<!-- We expect $N$ to be large, so we expand $f(x, y)$ around its maximum $(x^*, y^*)$ to obtain a good approximation of the integral. This is known as Laplace's method. Differentiating $f$ with respect to its variables and finding the maxima, one obtains the following set of equations: -->
Once again, we employ Laplace's method __EXPLAIN MORE__

\begin{align}
	\label{eq:fmaxima1} N \left[ \delta x^* + (1-2\varepsilon)y^* \right] &= N_A \delta \left[ \coth \beta \delta x^* + (1-2\varepsilon)y^* - \frac{1}{\beta \delta x^* + (1-2\varepsilon)y^*} \right] \\
    \nonumber +& N_B (1-2\varepsilon) \left[ \coth \beta \delta y^* + (1-2\varepsilon)x^* - \frac{1}{\beta \delta y^* + (1-2\varepsilon)x^*} \right] \\
	\label{eq:fmaxima2} N \left[ \delta y^* + (1-2\varepsilon)x^* \right] &= N_B \delta \left[ \coth \beta \delta y^* + (1-2\varepsilon)x^* - \frac{1}{\beta \delta y^* + (1-2\varepsilon)x^*} \right] \\
    \nonumber +& N_A (1-2\varepsilon) \left[ \coth \beta \delta x^* + (1-2\varepsilon)y^* - \frac{1}{\beta \delta x^* + (1-2\varepsilon)y^*} \right] \nonumber
\end{align}

One can then come back to [@eq:zantiferro], continue Laplace's method extracting the term $e^{Nf(x^*, y^*)}$ from the integral and taking the logarithm to obtain:

$$ \log Z_B(\beta, \delta, \varepsilon) = N f(x^*, y^*, \beta, \delta, \varepsilon) + \mathrm{const.} + \mathcal{O}(N) $$ {#eq:finallogzanti}

Now, with the partition function, we have the thermodynamical model and we can understand the behaviour of the system under different regimes of the parameters.
