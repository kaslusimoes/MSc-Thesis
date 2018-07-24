
# Conclusion and Perspectives {#sec:ch:conclusion}

On this dissertation we were interested in studying some features of agents learning and interaction in society. We pursued this through the motif of morality, known to be a highly relevant element of discussion in society, and which provides good experimental and theoretical scaffold to develop our models.

To pursue that goal we presented 3 different models derived from the same maximum entropy inference procedure, each appealing to some level of description of the problem at hand.

## Discussion of the results

In the first model we tried to be as faithful as possible to the results obtained from the maximum entropy agents model. We completed a mean field approximation, but not without some compromises to the model. We found a phase transition between an ordered phase and a disordered one, representing two different states the society of agents could be.

The phases can be characterized by the product $\gamma \times \beta\nu$, with higher $\gamma$ and higher $\beta\nu$ being the consensus society (the one with non-zero magnetization). We explain more the parameters in light of the results obtained:

- $\gamma$ being the variance of the inference being made ($\mathbf{C}_n =  \gamma^2_n \mathbb1$ in [@eq:multigaussian]), it represents the uncertainty when reasoning incomplete information about the classifier vector $\prof$. Higher $\gamma$ is related to an agent more open to learning and adapting to the opinion of their peers. We saw that in [@fig:modfunc];
- $\beta\nu$ came with the statistical mechanical model and the mean field approximation: it is a condensate of $\beta$, the pressure that constraints the learning to an specific behaviour, and $\nu$, the effective number of peers each agent has. Higher $\beta\nu$ thus represent a greater peer pressure forcing the agent to adapt to the overall environment, therefore it is also a polarizing force.

We mentioned before that the mean field approximation came with compromises, and that could be seen in [@fig:probh]. This model clarifies much of the relevance and utility of each parameter, but some of its features render unfeasible the task of comparing model with data.

The second model, built upon the work by [@Vicente2014], was dedicated to establishing a comparison to data available from the MFQ. We offered a simple bayesian method to calculate the best parameter $g$ to a given dataset using Gamma distributions, and we challenged some of the assumptions presented before in the literature.

We showed how the choice of zeitgeist from the MFQ's data is not an immediate nor trivial one, and that one must have additional hypothesis to support that choice. The choice of a zeitgeist aligned with conservatives may have overall good support from experimental evidence, but one can think in a hypothetical scenario in which the most discussed topic may be aligned with liberals, or with any other direction of the space. In that case we could not think of conservatives as behaving "conservatively", since the group would have more spread opinions and would accept novelty more than corroboration.

<!-- (see Table 1 of [@Caticha2015]) -->
In sum, what we propose on this dissertation is that what has been called before a feature of "conservatism" must be re-framed to "_agents with strong agreement with the zeitgeist_". For example, agents with a strong agreement to the zeitgeist are the ones who give the same importance to novelty or to corroborations, not conservatives (in the case when the zeitgeist is mostly aligned with conservatives then the conservatives behave like that).
<!-- We propose we start thinking of them as **extremist** groups, for those set of reasons. -->

We like to call those groups **extremists** because their behaviour is similar to what we would think of those in society. Imagine a polemic contemporary topic being discussed in society. We note the discussion and the groups in it being typically:

- highly polarized, is as if there are only two positions one can hold;
- both sides do not have much variability on their opinions, either you agree with them or you are from "the other group";
- both sides focus much on posting on and propagating through their social networks situations and arguments that corroborate their opinions (much more than those that challenge their beliefs).

<!--  talvez falar sobre tópico polêmico, como aborto

- pessoas muito polarizadas, não mudam muito de opinião
- elas focam na corroboração (mas não tanto na novidade, talvez o model precise incorporar isso)
- as opinioões polarizadas são muito concentradas com o zeitgeist, nunca são posições "médias" (não tem pico de P(h) em 0.7, só em 1)
-->

In the third model we tried to describe the framing presented above: two opposite groups discussing some issue and the struggle between agreeing with my trusted peers and disagreeing with my (possibly) untrusted peers.

We saw that the two obvious outcomes were present: the "_polarized_ society" and the "_consensus_ society". However, the model also presented a third situation not entirely expected: a "_frustrated_ society". The phase diagram in [@fig:phasediagram] shows the parameters' regime for each of the phases. We describe them below

- High $\delta$ and high $\varepsilon$: _polarized_ society

    This is because we have high intra-group support for agreeing with my trusted peers but we also have strong inter-group antiferromagnetic interactions, which polarizes the society;

- High $\delta$ and low $\varepsilon$: _consensus_ society

    Now, with low modulation in the antiferromagnetic interactions, the agents minimize the energy by simply agreeing throughout the whole society;

- Low $\delta$ and low $\varepsilon$: _frustrated_ society

    The non-trivial case is one in which there is weak intra-group and inter-group interactions. This leads into an situation which only minimizes the energy by depolarizing the society

## Final Remarks

We present several small results that advance the understanding of the agent-models one can develop with Maximum Entropy and the framework shown here, but there are many more ideas worth pursuing using those models or even inventing others.

For example, we have reasons to believe that it is possible to find regimes of the parameters in the third model that yield an analytical solution to the expression for the partition function. One could also investigate the behaviour of the system when $\rho_A \neq \rho_B$, and see whther the model agree with the effects of a majority group encountered experimentally by [@Asch1956]. Those two ideas were not pursued due to the time constraint the student was subject to.

As for new initiatives, we name a few perspectives for the future:

- There has been some research in our group (possibly [@Alves2018]) to understand situations in which the society discusses more than one question. This could lead into richer structures of organization in the society;

- Another possibility that was investigated by the student but so far found inconclusive results is the comparison of the peer pressure parameter in the first model, $\beta$, with the _tightness_ measure presented in [@Gelfand2011]. There has been some work on this by [@Cesar2014], but we have reasons to believe that our new concept of extremists may help have further insights on this topic;

- Closely related to the last point, one could also do the inference $P(g|country, \mathit{pa}, question)$ and try to generalize something about the countries, the political groups and the questions being asked. This would require looking into the data of the MFQ differently;

- One last idea we would like to propose is a re-framing of the problem: instead of performing inference over the learning of one agent, and extrapolating it to a society of agents, one could try to think on an inference over the society as a whole. We believe this could provide alternative intuitions on the evolution of the system.
