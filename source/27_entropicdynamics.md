
## Entropic Dynamics {#sec:entropicdynamics}

The idea of entropic dynamics has started with work from Ariel Caticha [for an extensive treatment see e.g. @Caticha2012]. It was created as a tool to recover the laws of physics as rules of inference - which is still being pursued, as one can see in [@Ipek2018]. However, the idea has proven to be a powerful concept in other areas as well. For example, [@Alves2016] has described the existence of sympatric multiculturalism of societies using this rationale.

Here we follow [@Alves2015; @Alves2016; @Alves2018] and describe a model for perceptron agents using Entropic Dynamics. The full derivation can be found in [@sec:ch:appendix].

### Basics {#sec:edbasics}

We have a probability distribution $Q$ over the variables $\xx$ we want to study. This probability is defined by a set of generator functions $\{f^a\}_{a=1}^G$ whose expected value $\langle f^a \rangle = \eta^a$ is known. Under those conditions maximum entropy says the distribution with least biased information at a given timestep $n$ is:

$$ Q_n(\xx) = \frac1\zeta_n \exp \left( - \sum_{a=1}^G \theta^a_n f^a(\xx) \right) \equiv P(\xx|\theta_n) $$ {#eq:distq}

where $\{\theta^a\}$ are the Lagrange multipliers that enforce the constraints chosen.

We update distribution $Q$ as receives new information $y_{n+1}$ is received. The rules of maximum entropy. Entropic Dynamics provide us that this update will be as in [@eq:gradientdescent], which we reproduce below:

$$ \eta^a_{n+1} = \eta^a_{n} - \frac{\partial}{\partial \theta_a^{n}} \log Z_{n+1} $$

where $Z_{n+1} = \int \mathrm{d}\xx\ P(y_{n+1}|\xx) Q_n(\xx)$ is the evidence of the model, and the distribution $P(y_{n+1}|\xx)$ the likelihood, which describes how in our inference the data $y_n$ ought to be created from the hidden variable $\xx$.

It is not trivial to change between the representations $\{\theta_a\}$ and $\{ \eta_a\}$ in the same way that is not always trivial to change between intensive and extensive parameters in thermodynamics.
