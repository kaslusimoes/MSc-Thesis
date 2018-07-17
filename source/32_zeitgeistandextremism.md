
## Prediction of opinions distribution in societies {#sec:zeitgeistandextremism}

As mentioned at the beginning of [@sec:models], the model presented in [@sec:meanfield], although presenting some interesting features, is not suitable to make comparisons with data.

We proceed by following the development in [@Vicente2014], where they introduced an interaction Hamiltonian in a society as presented below:

$$  \mathcal{H} = - \frac{1+\delta}{2} \sum_{\langle ij \rangle} h_i h_j + \frac{1-\delta}{2} \sum_{\langle ij \rangle} |h_i h_j| $$ {#eq:hamiltonianvisujeca}

where $\delta$ is a "psychological cost" of agreement between agents, with $0<\delta<1$. When $\delta = 0$ the agents are called "error correctors", because they do not change their moral vectors in the case of matching opinions, and when $\delta = 1$ they are called "corroboration seekers", because they attribute the same amount of information to both cases: agreement or disagreement.

On this same paper, the authors develop a mean-field approximation using [@eq:hamiltonianvisujeca] and the Maximum Entropy method, similar to the on performed in [@sec:meanfield] to arrive at [@eq:meanfieldexact]. The information constraint on the expected value of the energy $\mean{\mathcal{H}} = E$ enforces the appearance of a Lagrange multiplier $\beta$, the "social pressure" of the society. The resulting distribution is:

$$  P_{\mathrm{MF}}(h) = \frac{g^2}{2} (1-h^2)\ e^{-g\left(1-h\right)} $$ {#eq:mfvisujeca}

where $g$ is a parameter aggregating $\beta$ and $\delta$. As before, $h$ is the dot product between the agent's inner moral representation $\student$ and a discussed query (Zeitgeist) $\zeitgeist$.

Assuming one has access to the distribution of opinions of several people from an specific political affiliation (_pa_), we can make the hypothesis that all agents of that _pa_ have their moral opinions sampled from the same distribution $P(h|g_{\mathit{pa}})$. This is not the same as saying that all liberals are the same, or that a liberal agent cannot have the same opinion as a conservative one in a give topic; we are only saying that there must be some similarity between people that think alike, they ought to be characterized in groups, and we can describe this using a probability distribution.

Then, one can use [@eq:mfvisujeca] and apply Bayes' theorem to it to find an estimator $\hat{g}_{pa}$ given a set of data $\{h_i\}_{i \in \mathit{pa}}$:

$$  P(g| \{h_i\}_{i \in \mathit{pa}}) \propto P(g) \prod_{i \in \mathit{pa}} P(h_i | g) $$ {#eq:bayesgamma}

We note that $P(h|g)$ resembles a Gamma distribution in $g$ and choose a prior distribution $g \sim \mathrm{Gamma}(k_0, \theta_0)$ - that is $P(g) = \frac{\theta_0^{-k_0}}{\Gamma(k_0)} g^{k_0-1} e^{-g/\theta_0}$. This will yield us a Gamma distribution as a posterior as well. First we evaluate the normalization factor $P(\{h\}_{pa})$

\begin{align}
    P(\{h\}) &= \int_0^\infty \mathrm{d}g\ P(\{h\}, g) \\
    &= \int_0^\infty \mathrm{d}g\ \frac{\theta_0^{-k_0}}{\Gamma(k_0)} g^{k_0-1} e^{-g/\theta_0} \prod_{i} \frac{g^2}{2} (1-h_i^2)\ e^{-g\left(1-h_i\right)} \\
    &= \int_0^\infty \mathrm{d}g\ \frac{\theta_0^{-k_0}}{\Gamma(k_0)} g^{k_0-1} e^{-g/\theta_0} \frac{g^{2n}}{2^n} e^{-g\left(n - m \right)} \prod_{i} (1-h_i^2) \\
    &= \frac{\theta_0^{-k_0}}{2^n \Gamma(k_0)} \prod_{i} (1-h_i^2) \int_0^\infty \mathrm{d}g\ g^{2n + k_0-1} e^{-g\left(n + 1/\theta_0 - m \right)}
\end{align}

where $n$ is the number of respondents in the group being considered and $m = \sum_i h_i$ is some kind of magnetization the group.
<!-- magnetization of a given political group of respondents $\mathit{pa}$.  -->

Now we recognize the Gamma integral $\Gamma(z) = \int_0^\infty \mathrm{d}t\ t^{z-1} e^{-t}$ with $z = 2n + k_0$ to solve the integral. Making the substitution $t = g\left( n - m + 1/\theta_0 \right)$, we obtain:

\begin{align}
    P(\{h\}) &= \frac{\theta_0^{-k_0}}{2^n \Gamma(k_0)} \left(n + 1/\theta_0 - m \right)^{-2n - k_0 + 1} \prod_{i} (1-h_i^2) \int_0^\infty \mathrm{d}t\ t^{2n + k_0-1} e^{-t}  \\
    &= \frac{1}{2^n} \frac{\theta_0^{-k_0}}{\left(n + \frac{1}{\theta_0} - m \right)^{2n + k_0 - 1}} \frac{\Gamma(2n + k_0)}{ \Gamma(k_0)} \prod_{i} (1-h_i^2)
\end{align}

Inserting back into the Bayes' rule, we obtain the posterior $g |\{h_i\}_{i \in \mathit{pa}} \sim \Gamma\left(k_0+2n, \frac{\theta_0}{1+\theta_0(n-m)} \right)$. Explicitly:

$$  P(g| \{h_i\}_{i \in \mathit{pa}}) = \frac{\left(\frac{1}{\theta_0} + n_{pa} - m_{pa} \right)^{k_0+2n_{pa}}}{\Gamma(k_0 + 2n_{pa})} g^{k_0 - 1 + 2 n_{pa}} e^{-g\left(\frac{1}{\theta_0} + n_{pa} - m_{pa} \right)} $$ {#eq:posteriorgamma}

Now we can see the different gamma posteriors for each _pa_ and each choice of Zeitgeist.
