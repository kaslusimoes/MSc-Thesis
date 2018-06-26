
## Describing a posterior for $\gamma$ {#sec:bayesgamma}

Assuming one has access to the distribution of opinions of several people from an specific political affiliation (\textit{pa}), we can make the hypothesis that all agents of that \textit{pa} have their moral opinions sampled from the same distribution $P(h|\gamma_\mathit{pa})$. This is not the same as saying that all liberals are the same, or that a liberal agent cannot have the same opinion as a conservative one in a give topic; we are only saying that there must be some similarity between people that think alike, they ought to be characterized in groups, and we can describe this using a probability distribution.

Then, one can use [@eq:mfvisujeca] and apply Bayes' theorem to it to find an estimator $\hat{\gamma}_{pa}$ given a set of data $\{h_i\}_{i \in \mathit{pa}}$:

$$  P(\gamma| \{h_i\}_{i \in \mathit{pa}}) \propto P(\gamma) \prod_{i \in \mathit{pa}} P(h_i | \gamma) $$ {#eq:bayesgamma}

Choosing a prior distribution $\gamma \sim \mathrm{Gamma}(k_0, \theta_0)$ - that is $P(\gamma) = \frac{\theta_0^{-h}}{\Gamma(k_0)} \gamma^{k_0-1} e^{-\gamma/\theta_0}$ -, we obtain the posterior $\gamma |\{h_i\}_{i \in \mathit{pa}} \sim \Gamma\left(k_0+2n, \frac{\theta_0}{1+\theta_0(n-m)}\right)$, a Gamma distribution as well:

EXPAND THE CALCULATION HERE!

$$  P(\gamma| \{h_i\}_{i \in \mathit{pa}}) = \frac{\left(\frac{1}{\theta_0} + n_{pa} - m_{pa} \right)^{k_0+2n_{pa}}}{\Gamma(k_0 + 2n_{pa})} \gamma^{k_0 - 1 + 2 n_{pa}} e^{-\gamma\left(\frac{1}{\theta_0} + n_{pa} - m_{pa} \right)} $$ {#eq:posteriorgamma}

where $n_{pa}$ is the number of respondents that defined themselves from the political affiliation $\mathit{pa}$, and $m_{pa} = \sum_{i \in \mathit{pa}} h_i$ is the magnetization of a given political group of respondents $\mathit{pa}$.

Now we can see the different gamma \textit{posteriors} for each \textit{pa}, for each choice of \textit{Zeitgeist}.
