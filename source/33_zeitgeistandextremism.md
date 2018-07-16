
## Zeitgeist and extremism in Societies {#sec:zeitgeistandextremism}

In [@Vicente2014] they introduced the following interaction hamiltonian in a society:

$$  \mathcal{H} = - \frac{1+\delta}{2} \sum_{\langle ij \rangle} h_i h_j + \frac{1-\delta}{2} \sum_{\langle ij \rangle} |h_i h_j| $$ {#eq:hamiltonianvisujeca}

where $\delta$ is a \textit{psychological cost} of agreement between agents. When $\delta = 0$ the agents are called "error correctors", because they do not change their moral vectors in the case of matching opinions, and when $\delta = 1$ they are called "corroboration seekers", because they attribute the same amount of information to both cases: agreement or disagreement.

In the same paper, the authors developed a mean-field approximation using [@eq:hamiltonianvisujeca] and the Maximum Entropy method. The constraint that the energy is conserved $\mean{\mathcal{H}} = E$ enforces the appearance of a Lagrange multiplier $\beta$, the "social pressure" of the society. The resulting distribution is:

CAREFUL! ARE THE GAMMAS THE SAME?? (section above and this one)

$$  P_{\mathrm{MF}}(h) = \frac{\gamma^2}{2} (1-h^2)\ e^{-\gamma\left(1-h\right)} $$ {#eq:mfvisujeca}

where $\gamma$ is a parameter aggregating $\beta$ and $\delta$. Similarly to [@eq:meanfieldfinal], here $h$ is also the dot product of the agent's inner moral representation $\student$ and a discussed query (\textit{Zeitgeist}) $\xx$.

Assuming one has access to the distribution of opinions of several people from an specific political affiliation (\textit{pa}), we can make the hypothesis that all agents of that \textit{pa} have their moral opinions sampled from the same distribution $P(h|\gamma_{\mathit{pa}})$. This is not the same as saying that all liberals are the same, or that a liberal agent cannot have the same opinion as a conservative one in a give topic; we are only saying that there must be some similarity between people that think alike, they ought to be characterized in groups, and we can describe this using a probability distribution.

Then, one can use [@eq:mfvisujeca] and apply Bayes' theorem to it to find an estimator $\hat{\gamma}_{pa}$ given a set of data $\{h_i\}_{i \in \mathit{pa}}$:

$$  P(\gamma| \{h_i\}_{i \in \mathit{pa}}) \propto P(\gamma) \prod_{i \in \mathit{pa}} P(h_i | \gamma) $$ {#eq:bayesgamma}

We note that $P(h|\gamma)$ resembles a Gamma distribution in $\gamma$ and choose a prior distribution $\gamma \sim \mathrm{Gamma}(k_0, \theta_0)$ - that is $P(\gamma) = \frac{\theta_0^{-k_0}}{\Gamma(k_0)} \gamma^{k_0-1} e^{-\gamma/\theta_0}$. This will yield us a Gamma distribution as a posterior as well. First we evaluate the normalization factor $P(\{h\}_{pa})$

\begin{align}
    P(\{h\}) &= \int_0^\infty \mathrm{d}\gamma\ P(\{h\}, \gamma) \\
    &= \int_0^\infty \mathrm{d}\gamma\ \frac{\theta_0^{-k_0}}{\Gamma(k_0)} \gamma^{k_0-1} e^{-\gamma/\theta_0} \prod_{i} \frac{\gamma^2}{2} (1-h_i^2)\ e^{-\gamma\left(1-h_i\right)} \\
    &= \int_0^\infty \mathrm{d}\gamma\ \frac{\theta_0^{-k_0}}{\Gamma(k_0)} \gamma^{k_0-1} e^{-\gamma/\theta_0} \frac{\gamma^{2n}}{2^n} e^{-\gamma\left(n - m \right)} \prod_{i} (1-h_i^2) \\
    &= \frac{\theta_0^{-k_0}}{2^n \Gamma(k_0)} \prod_{i} (1-h_i^2) \int_0^\infty \mathrm{d}\gamma\ \gamma^{2n + k_0-1} e^{-\gamma\left(n + 1/\theta_0 - m \right)}
\end{align}

where $n$ is the number of respondents in the group being considered and $m = \sum_i h_i$ is some kind of magnetization the group.
<!-- magnetization of a given political group of respondents $\mathit{pa}$.  -->

Now we recognize the Gamma integral $\Gamma(z) = \int_0^\infty \mathrm{d}t\ t^{z-1} e^{-t}$ with $z = 2n + k_0$ to solve the integral. Making the substitution $t = \gamma\left( n -  + 1/\theta_0 \right)$, we obtain:

\begin{align}
    P(\{h\}) &= \frac{\theta_0^{-k_0}}{2^n \Gamma(k_0)} \left(n + 1/\theta_0 - m \right)^{-2n - k_0 + 1} \prod_{i} (1-h_i^2) \int_0^\infty \mathrm{d}t\ t^{2n + k_0-1} e^{-t}  \\
    &= \frac{1}{2^n} \frac{\theta_0^{-k_0}}{\left(n + \frac{1}{\theta_0} - m \right)^{2n + k_0 - 1}} \frac{\Gamma(2n + k_0)}{ \Gamma(k_0)} \prod_{i} (1-h_i^2)
\end{align}

Inserting back into the Bayes' rule, we obtain the posterior $\gamma |\{h_i\}_{i \in \mathit{pa}} \sim \Gamma\left(k_0+2n, \frac{\theta_0}{1+\theta_0(n-m)} \right)$. Explicitly:

$$  P(\gamma| \{h_i\}_{i \in \mathit{pa}}) = \frac{\left(\frac{1}{\theta_0} + n_{pa} - m_{pa} \right)^{k_0+2n_{pa}}}{\Gamma(k_0 + 2n_{pa})} \gamma^{k_0 - 1 + 2 n_{pa}} e^{-\gamma\left(\frac{1}{\theta_0} + n_{pa} - m_{pa} \right)} $$ {#eq:posteriorgamma}

Now we can see the different gamma \textit{posteriors} for each \textit{pa} and each choice of \textit{Zeitgeist}.
