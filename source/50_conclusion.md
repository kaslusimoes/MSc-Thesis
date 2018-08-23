
# Conclusion and Perspectives {#sec:ch:conclusion}

On this dissertation we were interested in studying some features of agents learning and interaction in society. We pursued this through the motif of morality, known to be a highly relevant element of discussion in society, and which provides good experimental and theoretical scaffold to develop our models.

To pursue that goal we presented 3 different models derived from the same maximum entropy inference procedure, each appealing to some level of description of the problem at hand.

## Discussion of the results

In the first model we tried to be as faithful as possible to the results obtained from entropic dynamics ([@sec:entropicdynamics]). This model takes an entropic inference model of what a learning procedure of a social agent should be and extrapolates it to a society of agents.

We completed a mean field approximation, but not without some compromises to the model. We found a phase transition between an ordered phase and a disordered one, representing two different states the society of agents could be.

The phases can be characterized by parameters $\gamma$ and $\beta\nu$. Respectively, they are the variance of distribution $Q_n(\prof)$ - the entropic dynamics inference being made in [@sec:entropicdynamics] - and the product of the lagrange multiplier $\beta$ of the statistical mechanical model in [@sec:models:model1] with the effective number of peers $\nu$ of the mean field approximation.

Higher $\gamma$ and higher $\beta\nu$ being the consensus society (ordered society, the one with non-zero magnetization). Lower values for both give us a society without any consensus (disordered, with zero magnetization).

Now, in light of the results obtained, we can better interpret the parameters:

- $\gamma$ represents the uncertainty when dealing with incomplete information about the classifier vector $\prof$. Higher $\gamma$ is related to an agent being more open to learning from errors and adapting to the opinion of their peers. We saw that in [@fig:modfunc];
- $\beta\nu$ came from the statistical mechanical model and the mean field approximation: it arises from $\beta$, the pressure that constraints the learning to an specific behaviour, and $\nu$, the effective number of peers each agent has. Higher $\beta\nu$ thus represents a greater peer pressure forcing the agent to adapt to the overall environment, therefore it is also a polarizing force.

Now we have a characterization of the type of agent that contributes to a society in which consensus reigns: first, it is an agent open to learning from corroboration of opinions as much as with novelty. This behaviour creates a kind of "echo chamber", because the agents emit similar opinions repeatedly and change their internal beliefs (the moral vectors $\student$) even in situations where there is already agreement between the interacting pair; secondly, the typical agent in consensus societies is also one highly connected, because the strength of the pressure peers exert over each other grows with the number of connections made, $\nu$.

We are convinced that the other kind of society described by this model, the one without magnetization, does not exist in reality (at least, not usually and not for a long period of time). This is because it should be unsustainable to have a society in which all the agents do not share common values about the only thing that is discussed between them. In that scenario the agents have strictly held opinions (low $\gamma$) and are isolated from one another, not being pressured much by their peers (low $\beta\nu$). In the third model we look more deeply into this problem from a perspective of a _normless_ society.
<!-- In a future extension [also pursued by @Alves2018], we shall include the discussion of a set of issues, instead of only one, and this we bring more attention to this topic. -->

<!-- We mentioned before that the mean field approximation came with compromises, and that could be seen in [@fig:probh]. Despite that inadequacy, this model clarifies much of the relevance and utility of each parameter, and gave us intuitions into the directions to follow: simpler models which still captured the important parameters and behaviours; a closer look into the -->

The second model, built upon the work by [@Vicente2014], was dedicated to establishing a comparison to data available from the MFQ. We offered a simple bayesian method to calculate the best parameter $\tilde{\beta}$ to a given dataset using Gamma distributions, and we challenged some of the assumptions presented before in the literature.

We showed how the choice of zeitgeist from the MFQ's data is not an immediate nor trivial one, and that one must have additional hypothesis to support that choice. The choice of a zeitgeist aligned with conservatives may have overall good support from experimental evidence, but one can think in a hypothetical scenario in which the most discussed topic may be aligned with liberals, or with any other direction of the space. In that case we could not think of conservatives as behaving "conservatively", since the group would have more spread opinions and would accept novelty more than corroboration.

<!-- (see Table 1 of [@Caticha2015]) -->
In sum, what we propose on this dissertation is that what has been called before a feature of "conservatism" must be re-framed to "_agents with strong agreement with the zeitgeist_". For example, agents with a strong agreement to the zeitgeist are the ones who give the same importance to novelty or to corroborations, not conservatives (in the case when the zeitgeist is mostly aligned with conservatives then the conservatives behave like that).

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

The concepts of societies in which there is overall consensus or polarized societies are easy to grasp, but the concept of a frustrated one deserves more attention. Here we start to understand some of the results mentioned in [@sec:socialinfluence] in view of the model presented:

- first, [@Sherif1937] noted that norms established in a group were important for a subject to retain a certain opinion in a next trial;
- secondly, [@Deutsch1955] made a distinction between "normative" and "informational" types of influence, the first kind being the stronger of the two;
- and lastly, [@Abrams1990] emphasized the importance of categorization: perceiving to which group I and my peers belong, and adapting accordingly.

All the studies mentioned highlight the importance of norms in a group to guarantee its cohesiveness and to protect the groups' opinions from another group. Without strong norms inside a group it is easy for an external, rival, group to inject concepts and beliefs and co-opt the first group. It is also a strong set of norms that gives people the sense of belonging to something, and stimulates them to work towards some collective ideal.

In our third model, a frustrated society is a society in which the communities are not well established, there is no categorization, neither defining who is my friend nor who is my enemy. This is in contrast with the results found in the works mentioned, because in those works there were clear categories, and groups of individuals influencing other subjects (or not, when these did not trust the peers to be from their group).

We believe that this behaviour in our model can be attributed to a society with a weak set of norms. This can be seen in both variables: $\delta$ defines the strength of the moral norm required to be categorized as a member of one group; and $\varepsilon$ the strength of the moral norm of _not_ being part of the _other_ group. If both variables have low values, then the agents perform poor categorization and we have zero magnetization throughout the society. This is a worse situation for the community than a polarized society, because now the group is vulnerable to a hypothetical third party to arrive and "attack" its weak moral or cultural identity.

## Final Remarks

We presented several small results that advance the understanding of the agent-models that can be developed with Maximum Entropy and the framework shown here, but there are many more ideas worth pursuing using those models or even inventing others.

For example, we have reasons to believe that it is possible to find regimes of the parameters in the third model that yield an analytical solution to the expression for the partition function. One could also investigate the behaviour of the system when $N_A \neq N_B$, and see whether the model agree with the effects of a majority group encountered experimentally by [@Asch1956]. Those two ideas were not pursued due to the time constraint the student was subject to.

As for new initiatives, we name some perspectives for the future:

- There has been some research in our group [possibly @Alves2018] to understand situations in which the society discusses more than one question. This could lead into richer structures of organization in the society;

- Another possibility that was investigated by the student but so far found inconclusive results is the comparison of the peer pressure parameter in the first model, $\beta$, with the _tightness_ measure presented in [@Gelfand2011]. There has been some work on this by [@Cesar2014], but we think that our new concept of extremists may help develop further insights on this topic;

- Closely related to the last point, one could also do the inference performed in the second model taking into account the other variables the MFQ had and we ignored on a first approach, such as country, age, and the variability inside the $30$ questions. Now, with a model for $P(g|\mathrm{country}, \mathit{pa}, \mathrm{question})$, one could try to generalize something about the differences between countries, the political groups and the questions being asked. This would require a different preprocessing of the MFQ data, instead of taking the mean value of several questions at once;

- An idea that emerges from the topic of norms and categorization discussed in the third model is the existence of _convincing strategies_ that can co-opt one group into thinking like another group. We believe this is an important problem worth investigating due to several relevant situations that can be cast into this frame, namely: external agent influencing an election, mass opinion manipulation, cultural, moral and religious colonialism, among others;

- One last idea we would like to propose is a re-framing of the problem: instead of performing inference over the learning of one agent, and extrapolating it to a society of agents, one could try to think on an inference over the society as a whole. We believe this could provide alternative intuitions on the evolution of the system.

We believe this line of work is only flourishing, with many possible avenues still worth exploring. The problem is complex, rich in details, and difficult, which only stimulates further research in the area. The tools presented have proved to have great descriptive power and reasonable interpretations to deal with the problem at hand.
<!-- We hope many will find this enterprise enthusiastic and will  -->
