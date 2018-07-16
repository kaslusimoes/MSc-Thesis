
## Bipartite Society {#sec:mfantiferromagnetic}

In [@sec:meanfield] the only values of mistrust $\varepsilon$ explored were between $0$ and $0.5$. That is because for values of $\varepsilon > 0.5$ the society enters a frustrated state which cannot be resolved by aligning nor anti-aligning the opinions of the agents. This problem is known for a long time on infinite-range Ising models and can be solved separating the Ising variables into 2 groups. The groups, which we will call *communities*, have ferromagnetic interactions within them and antiferromagnetic ones between elements of different the communities.

![Exemplification of the interactions between and inside the 2 communities in a bipartite society](images/antiferromagnetic-2groups.png){#fig:antiferro2groups width='55%'}

The relevant Hamiltonian of a society if two groups we are going to use is:

$$  \mathcal{H} =  -\frac{\delta}{N} \sum_{\langle i, j \rangle \in A} h_i h_j -\frac{\delta}{N} \sum_{\langle i, j \rangle \in B} h_i h_j - \frac{(1 - 2 \varepsilon)}{N} \sum_{\substack{i \in A \\ j \in B}} h_i h_j $$ {#eq:hamiltonian2}

where the $h_i \in [-1, 1]$ are the opinion fields for each of the $N$ agents. The parameters $\delta$ and $\varepsilon$ can have values on the interval $[-1, 1]$. We note that $\delta$ describes the intensity of the in-group interactions (always ferromagnetic), whereas $\varepsilon$ describes the inter-group interactions (which can become antiferromagnetic when $\varepsilon > 0.5$).

The canonical distribution when we consider the relevant constraint of the expected value of the energy $\langle\mathcal{H}\rangle_{P_B} = E$ is $P_B(\{h_i\}) = \frac1Z \exp(-\beta \mathcal{H})$. We want to evaluate the partition function because from that we will obtain the free energy and the thermodynamics of the model.

First, let us rewrite the hamiltonian in the following way:

\begin{align}
  \mathcal{H} &=  -\frac{\delta}{N} \sum_{\langle i, j \rangle \in A} h_i h_j -\frac{\delta}{N} \sum_{\langle i, j \rangle \in B} h_i h_j - \frac{(1 - 2 \varepsilon)}{N} \sum_{\substack{i \in A \\ j \in B}} h_i h_j \\
  &= -\frac{N}{2} \left[ \delta \left( \frac1N \sum_{i \in A} h_i \right)^2 + \delta \left( \frac1N \sum_{j \in B} h_i \right)^2 + 2(1 - 2 \varepsilon) \left( \frac1N \sum_{i \in A} h_i \right) \left( \frac1N \sum_{j \in B} h_j \right) \right]
\end{align}

Secondly, we recognize that we have only squared terms in the hamiltonian, which renders the evaluation of the partition function rather difficult. One way around this is to use the following gaussian identity:

$$ \exp\left( \frac{A^2 + B^2 +2\rho A B}{2(1-\rho^2)} \right) = \int_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{2\pi\sqrt{1 - \rho^2}}\ \exp\left( -\frac{ x^2 + y^2 + 2\rho x y - 2A(x+\rho y) - 2B(y+\rho x)}{2(1-\rho^2)} \right) $$ {#eq:gaussiantrick2d}

We can associate $A = \frac1N \sum_{i\in A} h_i,\ B = \frac1N \sum_{j\in B} h_j,\ \frac{1}{1-\rho^2} = \beta N \delta$ and $\frac{\rho}{1-\rho^2} = \beta N (1-2\varepsilon)$ to continue the calculation:

\begin{align}
    Z &= \int_{-1}^1 \mathrm{d}h_1 \int_{-1}^1 \mathrm{d}h_2 \cdots \int_{-1}^1 \mathrm{d}h_N\ \exp(-\beta \mathcal{H}) = \int \mathrm{d}h\ \exp(-\beta \mathcal{H}) \\
    &= \int \mathrm{d}h\ \exp \left\{ \frac{\beta N}{2} \left[ \delta \left( \frac1N \sum_{i \in A} h_i \right)^2 + \delta \left( \frac1N \sum_{j \in B} h_i \right)^2 + 2(1 - 2 \varepsilon) \left( \frac1N \sum_{i \in A} h_i \right) \left( \frac1N \sum_{j \in B} h_j \right) \right] \right\} \\
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

<!-- WAS A GATHER ENVIRONMENT -->
$$ Z = 2^N \int_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{2\pi} \sqrt{\beta\delta N} e^{Nf(x, y)} $$

where $f$ is going to be the free energy of the model:

$$ f(x, y) = \rho_A \log \left( \frac{\sinh \beta z_A}{\beta z_A} \right) + \rho_B \log \left( \frac{\sinh \beta z_B}{\beta z_B} \right) - \frac{\beta \delta}{2} \left( x^2 + y^2 \right) - \beta (1-2\varepsilon) xy $$

where $\rho_{A,B} = \frac{n_{A,B}}{N}$ is the fraction of agents in a given population, and we implicitly defined two auxiliary variables for ease of calculation: $z_A = \delta x + (1-2\varepsilon)y$ and $z_B = \delta y + (1-2\varepsilon)x$.

We expect $N$ to be large, so we approximate $f(x, y)$ around its maximum $(x^*, y^*)$ to obtain a good approximation of the integral. This is known as Laplace's method. Differentiating $f$ with respect to its variables and finding the maxima, one obtains the following set of equations:

\begin{align}
	z_A^* = \rho_A \delta \left[ \coth \beta z_A^* - \frac{1}{\beta z_A^*} \right] + \rho_B (1-2\varepsilon) \left[ \coth \beta z_B^* - \frac{1}{\beta z_B^*} \right] \\
	z_B^* = \rho_B \delta \left[ \coth \beta z_B^* - \frac{1}{\beta z_B^*} \right] + \rho_A (1-2\varepsilon) \left[ \coth \beta z_A^* - \frac{1}{\beta z_A^*} \right]
\end{align}
