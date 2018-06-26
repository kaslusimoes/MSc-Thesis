
## Calculation and Saddle-point method {#sec:mfsaddlepoint}

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

$$ \exp\left( \frac{A^2 + B^2 +2\rho A B}{2(1-\rho^2)} \right) = \int\displaylimits_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{2\pi\sqrt{1 - \rho^2}}\ \exp\left( -\frac{ x^2 + y^2 + 2\rho x y - 2A(x+\rho y) - 2B(y+\rho x)}{2(1-\rho^2)} \right) $$ {#eq:gaussiantrick2d}

Continuing the calculation:

\begin{align}
  Z &= \int_{-1}^1 \mathrm{d}h_1 \int_{-1}^1 \mathrm{d}h_2 \cdots \int_{-1}^1 \mathrm{d}h_N \exp(-\beta \mathcal{H}) \\
  &= \int \mathrm{d}h \exp
\end{align}

One can proceed with the calculation to obtain:

<!-- WAS A GATHER ENVIRONMENT -->
\begin{align}
  Z = 2^N \int_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{2\pi} \sqrt{\beta\delta N} e^{Nf(x, y)} \\
  f(x, y) = \rho_A \log \left( \frac{\sinh \beta z_A}{\beta z_A} \right) + \rho_B \log \left( \frac{\sinh \beta z_B}{\beta z_B} \right) - \frac{\beta \delta}{2} \left( x^2 + y^2 \right) - \beta (1-2\varepsilon) xy
\end{align}

where $\rho_{A,B} = \frac{N_{A,B}}{N}$ is the fraction of agents in a given population, and we implicitly defined two auxiliary variables for ease of calculation: $z_A = \delta x + (1-2\varepsilon)y$ and $z_B = \delta y + (1-2\varepsilon)x$.

We expect $N$ to be large, so we approximate $f(x, y)$ around its maximum $(x^*, y^*)$ to obtain a good approximation of the integral. This is known as Laplace's method. Differentiating $f$ with respect to its variables and finding the minima, one obtains the following set of equations:

\begin{align}
	z_A^* = \rho_A \delta \left[ \coth \beta z_A^* - \frac{1}{\beta z_A^*} \right] + \rho_B (1-2\varepsilon) \left[ \coth \beta z_B^* - \frac{1}{\beta z_B^*} \right] \\
	z_B^* = \rho_B \delta \left[ \coth \beta z_B^* - \frac{1}{\beta z_B^*} \right] + \rho_A (1-2\varepsilon) \left[ \coth \beta z_A^* - \frac{1}{\beta z_A^*} \right]
\end{align}

Now we can solve this equations for several values of the parameters $(\beta, \delta, \varepsilon)$ and obtain the fixed points of the system. For simplicity we only consider the situation in which the different populations have the same size, that is, $\rho_A = 0.5 = \rho_B$.

From [@fig:phasediagram], beyond the expected behavior of an all-agreeing phase and a disagreement one, we also note that there is a region where both groups present zero magnetization. This can be seen also from the free energy plot, in [@fig:freeenergy], below, and this is due to the interplay between agreement and disagreement in the groups' interactions.

The student is still looking into the different choices of parameters on this model, and searching for a more comprehensive study of the solutions of this model.

![The phase diagram when $\beta = 10.0$ and $\rho_A = \rho_B$.](images/phasediagram-full-beta10-rho05-initial0901.png){#fig:phasediagram width='70%'}

![GET A BETTER IMAGE](images/freeenergy-beta10-delta25-eps6-rho05.png){#fig:freeenergy width='70%'}

<!-- \begin{figure}[h!]
\centering
\includegraphics[width=0.35\textwidth]{figures/freeenergy-beta10-delta75-eps4-rho05.png}
\includegraphics[width=0.35\textwidth]{figures/freeenergy-beta10-delta75-eps6-rho05.png}
\\
\includegraphics[width=0.4\textwidth]{figures/freeenergy-beta10-delta25-eps6-rho05.png}
\caption{The free energy for $\beta = 10.0$, $\rho_A = \rho_B$ and different values of $\delta, \varepsilon$, representing the 3 phases typical of the system}
\label{fig:freeenergy}
\end{figure} -->
