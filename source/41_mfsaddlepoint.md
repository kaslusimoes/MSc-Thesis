
## Calculation and Saddle-point method {#sec:mfsaddlepoint}

The relevant Hamiltoninan of a society if two groups we are going to use is:

$$  \mathcal{H} =  -\frac{\delta}{N} \sum_{\langle i, j \rangle \in A} h_i h_j -\frac{\delta}{N} \sum_{\langle i, j \rangle \in B} h_i h_j  - -\frac{(1 - 2 \varepsilon)}{N} \sum_{i \in A \\ j \in B} h_i h_j $$ {#eq:hamiltonian2}

where the $h_i \in [-1, 1]$ are the opinion fields for each of the $N$ agents

The canonical distribution when we consider the relevant constraint of the expected value of the energy $\langle\mathcal{H}\rangle_{P_B} = E$ is $P_B(\{h_i\}) = \frac1Z \exp(-\beta \mathcal{H})$. We want to evaluate the partition function:

$$ Z  \int_{-1}^1 \mathrm{d}h_1 \int_{-1}^1 \mathrm{d}h_2 \cdots \int_{-1}^1 \mathrm{d}h_N \exp(-\beta \mathcal{H}) $$
