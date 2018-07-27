
## Model 2 {#sec:methods:model2}
<!-- Distribution of opinions in societies -->

As mentioned at the beginning of [@sec:ch:models], the model presented in [@sec:methods:model1], although presenting some interesting features, is not suitable to make comparisons with data. In this second model we look at the same problem of characterizing the distribution of opinions in a society, but now with a different approach. We proceed by following the development in [@Vicente2014], where following interaction Hamiltonian in a society was introduced:

$$  \hamiltonian = - \frac{1+\delta}{2} \sum_{\langle ij \rangle} h_i h_j + \frac{1-\delta}{2} \sum_{\langle ij \rangle} |h_i h_j| $$ {#eq:hamiltonianvisujeca}

where $\delta$ is a "psychological cost" of agreement between agents, with $0<\delta<1$. When $\delta = 0$ the agents are called "error correctors", because they do not change their moral vectors in the case of matching opinions, and when $\delta = 1$ they are called "corroboration seekers", because they attribute the same amount of information to both cases: agreement or disagreement.

On this same paper, the authors develop a mean-field approximation using [@eq:hamiltonianvisujeca] and the Maximum Entropy method, similar to the one performed in [@sec:methods:model1] to arrive at [@eq:meanfieldexact]. The information constraint on the expected value of the energy $\mean{\hamiltonian} = E$ enforces the appearance of a Lagrange multiplier $\beta$, the "social pressure" of the society. The resulting distribution is:

$$  P_{\mathrm{MF}}(h) = \frac{\tilde{\beta}^2}{2} (1-h^2)\ e^{-\tilde{\beta}\left(1-h\right)} $$ {#eq:mfvisujeca}

where $\tilde{\beta}$ is a parameter aggregating $\beta$ and $\delta$. As before, $h$ is the dot product between the agent's inner moral representation $\student$ and a discussed query (Zeitgeist) $\zeitgeist$.

We should also note there is an assumption that $h>0$ made to get to [@eq:mfvisujeca]. This enforces a cohesive society, because the magnetization $\langle h \rangle$ will be positive as well. To some extent we break this hypothesis later in [@sec:methods:model3].

Assuming one has access to responses from several people of one same group $g$. This group is a collective of people that shares similar cultural and moral values. We make the hypothesis that all responses obtained from subjects of that were sampled from the same distribution $P(h|\tilde{\beta}_g)$. In our case, we are going to use the different political affiliations (_pa_) the respondents of the MFQ attribute to themselves. The distribution we sample from, therefore, is $P(h|\tilde{\beta}_{\mathit{pa}})$ for a given political affiliation _pa_.

This choice of groups is not the same as saying that all liberals are identical, or that a liberal agent cannot have the same opinion as a conservative one on a specific topic; we are only saying that there must be some similarity between people that think alike, they ought to be characterized in groups, and we can describe this using a probability distribution.

Then, one can use [@eq:mfvisujeca] and apply Bayes' theorem to it to find an estimator for $\tilde{\beta}$ given a set of data $\{h_i\}_{i \in \mathit{pa}}$:

$$  P(\tilde{\beta}| \{h_i\}_{i \in \mathit{pa}}) \propto P(\tilde{\beta}) \prod_{i \in \mathit{pa}} P(h_i | \tilde{\beta}) $$ {#eq:bayesgamma}

We note that $P(h|\tilde{\beta})$ resembles a Gamma distribution in $\tilde{\beta}$ and choose a prior distribution $\tilde{\beta} \sim \mathrm{Gamma}(k_0, \theta_0)$, that is:

$$ P(\tilde{\beta}) = \frac{\theta_0^{-k_0}}{\Gamma(k_0)} \tilde{\beta}^{k_0-1} e^{-\tilde{\beta}/\theta_0} $$

This yields a Gamma distribution as a posterior as well. First we evaluate the normalization factor $P(\{h_i\}_{pa})$:

\begin{align}
    P(\{h_i\}) &= \int_0^\infty \mathrm{d}\tilde{\beta}\ P(\{h_i\}, \tilde{\beta}) \\
    &= \int_0^\infty \mathrm{d}\tilde{\beta}\ \frac{\theta_0^{-k_0}}{\Gamma(k_0)} \tilde{\beta}^{k_0-1} e^{-\tilde{\beta}/\theta_0} \prod_{i} \frac{\tilde{\beta}^2}{2} (1-h_i^2)\ e^{-\tilde{\beta}\left(1-h_i\right)} \\
    &= \int_0^\infty \mathrm{d}\tilde{\beta}\ \frac{\theta_0^{-k_0}}{\Gamma(k_0)} \tilde{\beta}^{k_0-1} e^{-\tilde{\beta}/\theta_0} \frac{\tilde{\beta}^{2n}}{2^n} e^{-\tilde{\beta}\left(n - m \right)} \prod_{i} (1-h_i^2) \\
    &= \frac{\theta_0^{-k_0}}{2^n \Gamma(k_0)} \prod_{i} (1-h_i^2) \int_0^\infty \mathrm{d}\tilde{\beta}\ \tilde{\beta}^{2n + k_0-1} e^{-\tilde{\beta}\left(n + 1/\theta_0 - m \right)}
\end{align}

where $n$ is the number of respondents in the group being considered and $m = \sum_i h_i$ is analogous to a magnetization of the group.
<!-- magnetization of a given political group of respondents $\mathit{pa}$.  -->

Recognize the Gamma integral $\Gamma(z) = \int_0^\infty \mathrm{d}t\ t^{z-1} e^{-t}$ with $z = 2n + k_0$ to do the integration. Making the substitution $t = \tilde{\beta}\left( n - m + 1/\theta_0 \right)$, we obtain:

\begin{align}
    P(\{h_i\}) &= \frac{\theta_0^{-k_0}}{2^n \Gamma(k_0)} \left(n + 1/\theta_0 - m \right)^{-2n - k_0 + 1} \prod_{i} (1-h_i^2) \int_0^\infty \mathrm{d}t\ t^{2n + k_0-1} e^{-t}  \\
    &= \frac{1}{2^n} \frac{\theta_0^{-k_0}}{\left(n + \frac{1}{\theta_0} - m \right)^{2n + k_0 - 1}} \frac{\Gamma(2n + k_0)}{ \Gamma(k_0)} \prod_{i} (1-h_i^2)
\end{align}

\newpage

Inserting back into Bayes' rule, we obtain the posterior $\tilde{\beta} |\{h_i\}_{i \in \mathit{pa}} \sim \Gamma\left(k_0+2n, \frac{\theta_0}{1+\theta_0(n-m)} \right)$. Explicitly:

$$  P(\tilde{\beta}| \{h_i\}_{i \in \mathit{pa}}) = \frac{\left(\frac{1}{\theta_0} + n_{pa} - m_{pa} \right)^{k_0+2n_{pa}}}{\Gamma(k_0 + 2n_{pa})} \tilde{\beta}^{k_0 - 1 + 2 n_{pa}} e^{-\tilde{\beta}\left(\frac{1}{\theta_0} + n_{pa} - m_{pa} \right)} $$ {#eq:posteriorgamma}

This posterior is used to predict $\tilde{\beta}$ for a given dataset. The advantage of using a posterior distribution instead of a point estimate is that we have more information about the inference being made. In a case where one finds a bimodal posterior distribution, for example, one knows that a mean value estimate would not describe well the data. In the specific case of [@sec:results:model2] we use it on MFQ data for different political affiliations, and luckily we obtained as a sharp distribution, which justifies a maximum a posteriori or a mean value estimates.
