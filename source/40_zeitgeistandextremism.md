# Zeitgeist and extremism in Societies {#sec:zeitgeistandextremism}

This study is motivated by the following questions: Are all extremists the same? Are conservative people more extremists than liberal ones? How can we characterize those groups?

In [see @Vicente2014] the authors introduced a hamiltonian of interactions inside a society with a \textit{psychological cost} $\delta$ of agreement between agents:

$$  \mathcal{H} = - \frac{1+\delta}{2} \sum_{\langle ij \rangle} h_i h_j + \frac{1-\delta}{2} \sum_{\langle ij \rangle} |h_i h_j| $$ {#eq:hamiltonianvisujeca}

When $\delta = 0$ they call the agents "error correctors", because they do not change their moral vectors in the case of matching opinions, and when $\delta = 1$ the agents are called "corroboration seekers", because they attribute the same amount of information to both cases: agreement or disagreement.

In the same paper, the authors developed a mean-field approximation using [@eq:hamiltonianvisujeca] and the Maximum Entropy method. The constraint that the energy is conserved $\mean{\mathcal{H}} = E$ enforces the appearance of a Lagrange multiplier $\beta$, the "social pressure" of the society. The resulting distribution is:

$$  P_{\mathrm{MF}}(h) = \frac{\gamma^2}{2} (1-h^2)\ e^{-\gamma(1-h)} $$ {#eq:mfvisujeca}

where $\gamma$ is a parameter aggregating $\beta$ and $\delta$. Similarly to [@eq:meanfieldfinal], here $h$ is also the dot product of the agent's inner moral representation $\student$ and a discussed query (\textit{Zeitgeist}) $\xx$.

From the Moral Foundations Questionnaire ([see @Graham2009]), one can obtain the empirical values for the $\{\student_i\}_{i=1}^N$, vectors in some $5$ dimensional space. The agents $\{\student_i\}$ are going to be the answers each respondent gave to the questionnaire. The issue $\xx$ remains to be defined, also from the data, but we must make an additional hypothesis. For example, one can take the Zeitgeist as the mean value of liberals, or the mean value of conservatives, or even the sum of this two last vectors. In [see @Vicente2014] they chose $\xx$ as the mean vector of Conservative respondents.

After we obtained the vectors, we make the additional hypothesis that all agents of a given political affiliation (\textit{pa}) have their moral opinions sampled from the same distribution $P(h|\gamma_\mathit{pa})$. This is not the same as saying that all liberals are the same, or that a liberal agent cannot have the same opinion as a conservative one in a give topic; we are only saying that there must be some similarity between people that think alike, they ought to be characterized in groups, and we can describe this using a probability distribution.

NEED TO FIX A COMMENTED TEXT BELOW

<!--
Then, one can use [@eq:mfvisujeca] and apply Bayes' theorem to it to find an estimator $\tilde{\gamma}_\mathit{pa}$ given a set of data $\{h_i\}_{i \in \mathit{pa}}$:

$$  P(\gamma| \{h_i\}_{i \in \mathit{pa}}) \propto P(\gamma) \prod_{i \in \mathit{pa}} P(h_i | \gamma) $$ {#eq:bayesgamma}

Choosing a prior distribution $\gamma \sim \mathrm{Gamma}(k_0, \theta_0)$ - that is $P(\gamma) = \frac{\theta_0^{-h}}{\Gamma(k_0)} \gamma^{k_0-1} e^{-\gamma/\theta_0}$ -, we obtain the posterior $\gamma |\{h_i\}_{i \in \mathit{pa}} \sim \Gamma\(k_0+2n, \frac{\theta_0}{1+\theta_0(n-m)}\)$, a Gamma distribution as well:

$$     P(\gamma| \{h_i\}_{i \in \mathit{pa}}) = \frac{\(\frac{1}{\theta_0} + n_\mathit{pa} - m_\mathit{pa} \)^{k_0+2n_\mathit{pa}}}{\Gamma(k_0+2n_\mathit{pa})} \gamma^{k_0+2n_\mathit{pa}-1} e^{-\gamma\(\frac{1}{\theta_0} + n_\mathit{pa} - m_\mathit{pa} \)} $$ {#eq:posteriorgamma} -->

Now we can see the different gamma \textit{posteriors} for each \textit{pa}, for each choice of \textit{Zeitgeist}. We test 4 different hypothesis for $\xx$: mean of conservatives $\xx_C$, mean of liberals $\xx_L$, mean of moderates $\xx_M$ and mean of all agents $\xx_T$. All the vectors were normalized $\|x\| = 1$.

![The 4 different Zeitgeist hypothesis considered. All extracted from data.](images/4zeitgeists.png){#fig:zeitgeists width='75%'}

We can see clear from [@fig:zeitgeists], as [see @Graham2009] already mentioned, that one can differentiate between Conservatives and Liberals by the different relevance each group gives to each moral dimension. Liberals tend to give more importance to Harm and Fairness whereas Conservatives give almost equal importance to all $5$ dimensions, attributing slightly more relevance to Ingroup, Authority and Purity dimensions. Additionally, the mean vector for the whole population tends more towards the Liberals due to a greater number of respondents with this political affiliation.

One last important fact to consider is that Moderates can be seen as a kind of transition between Liberals and Conservatives, as expected. %In fact, although not being shown here, the mean vectors of the $7$ political affiliations can be arranged in a linear dispersion along a curve, with $\mathit{pa} = 1$ (Very Liberal) and $\mathit{pa} = 7$ (Very Conservative) at the extremes of this curve.

The different posteriors of $\gamma$ due to each choice of those Zeitgeists are presented in [@fig:posteriorgamma]

![Different posteriors for $\gamma$ given the chosen Zeitgeist and the political affiliation of the responses $\{h\}$. DO A BOXPLOT HERE AS FELIPPE TOLD ME](images/posteriorgamma4zeitgeists.png){#fig:posteriorgamma width='80%'}

One can see that the choice of the Zeitgeist matters greatly when searching for a distribution $P(h|\gamma)$ that matches the data. More specifically, one can see from [@fig:posteriorgamma] that the same group, for example $\mathit{pa} = 1$, can have different values of $\gamma$ for different choices of the Zeitgeist.

![FIX THIS FIGURE. AGGREGATE ALL 4](images/phconservatives.png){#fig:probh width='40%'}


<!-- FIX THIS FIGURE

 \begin{figure}[h!]
\centering
\includegraphics[width=0.45\textwidth]{figures/phconservatives.png}
\includegraphics[width=0.45\textwidth]{figures/phliberals.png}
\\

\includegraphics[width=0.45\textwidth]{figures/phmoderates.png}
\includegraphics[width=0.45\textwidth]{figures/phtotalpop.png}
\caption{The histogram of opinions $h$ for a given \textit{pa} group considering an specific Zeitgeist and the corresponding best fit of the model $P(h|\gamma)$ given the data}
\label{fig:probh}
\end{figure} -->

Looking at [@fig:probh] we can observe that the model fits the data better for higher values of $\gamma$, which come naturally from the posterior with more moderate Zeitgeists, which do not align exactly with Conservatives nor with Liberals.

From the analysis presented above, we would like to propose $2$ ideas for future models:

1. The model's parameter $\gamma$, more than a characterization of the Liberal-Conservative spectrum, it is a description of the \textit{extremism} of a society. As a given political group has moral beliefs $\student_i$ more aligned with the chosen Zeitgeist, more concentrated they will become and more "extremist" (with less room for a change of opinion) they will behave;
2. The choice of the Zeitgeist - the \textit{question} being asked to the agents - is a highly relevant characteristic of the model presented, and is not a feature we can extract from the Moral Foundations data alone. One must have additional hypothesis, which ought to be validated by other means.
