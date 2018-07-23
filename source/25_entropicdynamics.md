
## Entropic Dynamics {#sec:entropicdynamics}

The idea of entropic dynamics has started with work from Ariel Caticha [for a pedagogical review see e.g. @Caticha2012]. It was created as a tool to recover the laws of physics as rules of inference - which is still being pursued, as one can see in [@Ipek2018]. However, the idea has proven to be a powerful concept in other areas as well. For example, [@Alves2016] has described the existence of sympatric multiculturalism of societies using this rationale.

Here we follow [@Cesar2014; @Alves2015; @Alves2016; @Alves2018] and describe a model for perceptron agents using Entropic Dynamics. The full derivation can be found in [@sec:ch:appendix].

### The basics {#sec:edbasics}

Incomplete knowledge about the variables $\xx$ under study is represented by distribution $Q(\xx)$, which belongs to a family defined by a set of generator functions $\{f^a\}_{a=1}^G$. Once the expected values $\langle f^a \rangle = \eta^a$ are known, maximum entropy yields the distribution with least biased information at a given timestep $n$ is:

$$ Q_n(\xx) = \frac1\zeta_n \exp \left( - \sum_{a=1}^G \theta^a_n f^a(\xx) \right) \equiv P(\xx|\theta_n) $$ {#eq:distq}

where $\{\theta^a\}$ are the Lagrange multipliers that enforce the constraints chosen.

We update distribution $Q$ as new information $y_{n+1}$ is discovered. Entropic Dynamics provide us that this update will be as in [@eq:gradientdescent], reproduced below:

$$ \eta^a_{n+1} = \eta^a_{n} - \frac{\partial}{\partial \theta_a^{n}} \log Z_{n+1} $$

where $Z_{n+1} = \int \mathrm{d}\xx\ P(y_{n+1}|\xx) Q_n(\xx)$ is the evidence of the model, and the distribution $P(y_{n+1}|\xx)$ the likelihood, which describes how in our inference the data $y_n$ ought to be created from the hidden variable $\xx$.

It is not trivial to change between the representations $\{\theta_a\}$ and $\{ \eta_a\}$ in the same way that is not always trivial to change between intensive and extensive parameters in thermodynamics models.

### Perceptron model

To continue with a proper model of an agent, we must first state the universe of discourse being inferred. In our model the variable being inferred is $\xx = (\prof, \varepsilon)$ where $\xi \in \mathbb{R}^K$ and for simplicity we consider $\varepsilon$ is a known quantity between $0$ and $1$ [that hypothesis is relaxed in @Alves2018].

We also need to state what is the data $y$ that will be available to the inference. In our case, $y = (\xi, \sigma)$ with $\prof \in \mathbb{R}^K$ and $\sigma \in \{\pm 1\}$. This represents a situation in which an agent is trying to learn how to classify an issue $\xi$ with classification $\sigma$.

Then we must provide the generator functions and the likelihood distribution of the model. The generators are what define the distribution family for $Q_n$, and the likelihood describes the generation of the data $y$ from $\xx$. We assume $\prof$ and $\prof \prof^\intercal$ are the relevant generators, which will give us a Multivariate Gaussian distribution family ([@sec:bayesgausslearn]). The likelihood distribution is $P(\xi, \sigma| \prof, \varepsilon) = P(\xi| \prof, \varepsilon) P(\sigma| \xi, \prof, \varepsilon)$. For simplicity we consider $P(\xi) = \delta\left( \xi - \zeitgeist \right)$, an issue that is always being discussed in the society. The model for $P(\sigma | \xi, \prof, \varepsilon)$ comes from the Perceptron algorithm with multiplicative noise $\varepsilon$ :

\begin{align}
    P(\sigma| \zeitgeist, \prof, \varepsilon) &= \varepsilon \Theta\left( - \sigma \prof \cdot \zeitgeist \right) + (1 - \varepsilon) \Theta\left( \sigma \prof \cdot \zeitgeist \right) \nonumber \\
    &= \varepsilon + (1 - 2\varepsilon) \Theta\left( \sigma \prof \cdot \zeitgeist \right) \label{eq:likelihoodperceptron}
\end{align}

where $\Theta$ is the Heaviside step function.

This extends our learning situation: in the process of learning to classify $\xi$, the agent also has an opinion that the received classification $\sigma$ could have been corrupted by the emitter with a probability $\varepsilon$ (the multiplicative noise).

Now one can calculate the integral $Z_{n+1} = \int \mathrm{d}\xx\ P(y_{n+1}|\xx) Q_n(\xx)$ and obtain [@eq:freeenergy], reproduced below:

$$ -\log Z_{n+1} = -\log\left[\varepsilon + \left(1 - 2\varepsilon\right) \Phi\left( \tfrac{\sigma h_n}{\Gamma_n} \right)\right] $$

where we defined $h_n = \frac{1}{\sqrt{K}} \zeitgeist \cdot \student_n$ and defined $\Gamma_n^2 = \frac1K \zeitgeist \cdot \mathbf{C}_n \zeitgeist$. We are also using the cumulative distribution of a normal function $\Phi(z) = \int_{-\infty}^{z} \frac{\mathrm{d}t}{2\pi}\ e^{-\frac12 t^2}$.
