
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

$$ \exp\left( \frac{A^2 + B^2 +2\rho A B}{2(1-\rho^2)} \right) = \int\displaylimits_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{2\pi\sqrt{1 - \rho^2}}\ \exp\left( -\frac{ x^2 + y^2 + 2\rho x y - 2A(x+\rho y) - 2B(y+\rho x)}{2(1-\rho^2)} \right)$$

Now we can proceed

\begin{align}
  Z &= \int_{-1}^1 \mathrm{d}h_1 \int_{-1}^1 \mathrm{d}h_2 \cdots \int_{-1}^1 \mathrm{d}h_N \exp(-\beta \mathcal{H}) \\
  &= \int \mathrm{d}h \exp
\end{align}
