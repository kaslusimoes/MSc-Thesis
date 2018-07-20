
\appendix

# Entropic Dynamics Calculations {#sec:ch:appendix}

Here we present the full derivation of the results shown in [@sec:entropicdynamics]

## Bayesian Machine Update Learning  {#sec:bayeslearn}

Consider a machine prepared to work with a fixed (*hardcoded*) model $\model$ which depends on some internal variables $\xx$. Such machine is presented with examples $y$ and seeks to update its knowledge about $\xx$ in such a way to describe correctly (with $\model$) the received examples while still improving its ability to predict future inputs (also known as capability of *generalization*).

That machine needs to somehow codify which values of $\xx$ are more appropriate to the classification task being learned. As this is an incomplete information situation (that is, we do not have full access to the optimal parameters $\hat{\xx}$), we use probability theory tools to describe the plausibility (or beliefs) the machine attributes - through its mechanical-logical-electronic processes - to each value of $\xx$. This we call the distribution $Q(\xx)$.

By means of practicality we are going to consider that the distribution $Q(\xx)$ belongs to some *parametric family* of probability distributions. That is, there is a set of conditions (from now on called generators) satisfied by and, more than that, *defining* the utilized distribution:

$$ \exists\ \{f^a(\xx)\}_{a=1}^G\ \ \text{such that} \ \ \mathbb{E}_Q[f^a] = \eta^a $$

The technological (and evolutionary) justification supporting the choice of a parametric family comes from noticing that the machine's memory (or the animal's brain, in a biology analogy) is limited and thus can only store a finite amount of information usable by its processing. Therefore it is viable that we imagine a numberless of different machines with different architectures (which differ on the parametric family used) and then compare their performances in different settings.

In possession of the generators we can do Maximum Entropy and obtain:

$$ Q(\xx) = P(\xx|\theta) = \frac1\zeta \exp\left(- \sum_{a=1}^G \theta_a f^a(\xx) \right) $$

where $\zeta = \int \mathrm{d}\xx\ \exp\left(- \sum_{a=1}^G \theta_a f^a(\xx)\right)$ is the normalization of the probability distribution $Q$, also called the partition function. We calculate some identities that are going to be useful later on[^einstein-summation]:

$$  \frac{\partial \log \zeta}{\partial \theta_b} = \frac1\zeta \frac{\partial \zeta}{\partial \theta_b} = \frac1\zeta \int \mathrm{d}\xx\ (-f^b(\xx)) \mathrm{e}^{- \theta_a f^a(\xx)} $$

$$ \qquad\therefore\ \frac{\partial \log \zeta}{\partial \theta_b} = - \eta^b $$ {#eq:ident1}

$$  \frac{\partial Q}{\partial \theta_b} = \frac1\zeta \mathrm{e}^{- \theta_a f^a(\xx)} \left( -f^b(\xx)\right) +  \mathrm{e}^{- \theta_a f^a(\xx)} \left( \frac{-1}{\zeta^2} \right) \frac{\partial \zeta}{\partial \theta_b} $$

$$ \qquad\therefore\ \frac{\partial Q}{\partial \theta_b} = [\eta^b - f^b(\xx)] Q $$ {#eq:ident2}

Knowing the probability distribution the machine attributes to the parameters of its interior model, we might calculate how it is that the "knowledge" of the machine will change when a new example is presented to it. Using Bayes' Theorem:

$$ P_{n+1}(\xx) = P(\xx| y_{n+1}) = \frac{L_{n+1} Q_n}{Z_{n+1}} = \frac{P(y_{n+1}| \xx)\ P(\xx| \theta_n)}{\int \mathrm{d}\xx\ P(y_{n+1}| \xx)\ P(\xx| \theta_n)}$$

Although this update is exact, it does not suit our needs since the new distribution $P_{n+1}$ usually will not belong to the initial parametric family. We need an alternative step that takes into account the relevant data from Bayes' rule and remains with the same functional form as the prior.

To do that one can minimize the distance (maximize the entropy) between the distributions $D_{KL}[Q_{n+1}||Q_n]$ while enforcing the expectation values of $P_n$ with $\mathbb{E}_{P_n}[f^a(\xx)] = \eta^a$. We want to minimize the following Lagrangian:


\begin{align}
     \Lambda[P, Q, \{\Delta_a\}] = &\int \mathrm{d}\xx\ Q_{n+1} \log\frac{Q_{n+1}}{Q_n} - \Delta_a \left[\int \mathrm{d}\xx\ f^a Q_{n+1} - \eta^a \right] \\
    &\quad - \Delta_0 \left[ \int \mathrm{d}\xx\ Q_{n+1} - 1 \right]
\end{align}

Since both $Q_n$ and $P_n$ are already fixed, one can only minimize the Lagrangian varying the posterior distribution $Q_{n+1}$. Taking a functional derivative, one finds:

$$ \frac{\delta \Lambda}{\delta Q_{n+1}} = \int \mathrm{d}\xx\ \delta Q_{n+1} \left[ \log Q_{n+1} + 1 - \log Q_n - \Delta_a f^a - \Delta_0 \right]$$

![Schematic representation of the update procedure done to revise the distribution $Q_n$. It goes as follows: one uses Bayes' Theorem (blue path) to get the new constraints and then updates the distribution through maximum entropy (red path), therefore minimizing the distance relative to the prior while enforcing the new expected values of the posterior.](images/em-updateproject.png){#fig:updateproject width='55%'}

Equating this to zero, one finds the expression for the Maximum Entropy (ME) posterior:

$$Q_{n+1}(\xx) = Q_n(\xx)\ \mathrm{e}^{-1 + \Delta_0 + \Delta_a f^a} = \frac{1}{\zeta_{n+1}} \exp\left(- \theta_a^{n+1} f^a(\xx) \right)$$

where $\theta^{n+1}_a = \theta^n_a + \Delta_a$ and $\zeta_{n+1}$ is the new normalization factor. If one takes a derivative with respect to $\Delta_b$ it becomes evident that the constraint adopted was:

$$\mathbb{E}_{Q_{n+1}}[f^b(\xx)] \equiv \eta^b_{n+1} = \mathbb{E}_{P_{n+1}}[f^b(\xx)]$$

Subtracting $\eta^b_n$ from both sides and working out the equation with
results in [@eq:ident1] and [@eq:ident2] we find an update rule to the parameters of the distribution.

\begin{align}
  \eta^b_{n+1} - \eta^b_n &= \mathbb{E}_{P_{n+1}}[f^b(\xx)] - \eta^b_n =  \int \mathrm{d}\xx\ f^b(\xx)\ P_{n+1} -  \eta^b_n \int \mathrm{d}\xx\ P_{n+1} \\
  &= \int \mathrm{d}\xx\ [f^b(\xx) -  \eta^b_n]\ P_{n+1}  = \int \mathrm{d}\xx\ \frac{L_{n+1}}{Z_{n+1}}\ [f^b(\xx) -  \eta^b_n]\ Q_n \\
  &=  \int \mathrm{d}\xx\ \frac{L_{n+1}}{Z_{n+1}}\ \left( - \frac{\partial Q_n}{\partial \theta^b_n} \right) = - \frac{1}{Z_{n+1}} \frac{\partial}{\partial \theta^b_n} \left( \int \mathrm{d}\xx\ L_{n+1} Q_n \right)
\end{align}

Remarkably, the schematics represented by [@fig:updateproject] can be described as a gradient descent evolution:

$$ \eta^b_{n+1} = \eta^b_{n} - \frac{\partial}{\partial \theta_b^{n}} \log Z_{n+1} $$ {#eq:gradientdescent}

<!-- ACTUALLY THIS IS NOT REMARKABLE AT ALL, JUST REMEMBER FROM STATMECH E=-d/db logZ. MAYBE WE COULD ELIMINATE THE DERIVATION ABOVE? -->

The partition function $Z_{n+1}$ depends only on the *intrinsic* mechanisms of the machine, not taking into account the generator family chosen. We will deal more with this topic in [@sec:bayesgaussperceptron].


## Gaussian Parametric Family {#sec:bayesgausslearn}

In this subsection we analyze how the parameters of a Multivariate Gaussian distribution update under the framework developed in [@sec:bayeslearn]. We chose it due to its generality, importance and easy of use.

The set of generators we assume to be relevant to draw an inference over a vector $\prof\in \mathbb{R}^K$, will be:

$$\begin{cases}
    \mathbb{E}_n[B^{i}] &= J^{i}_n \\  
    \mathbb{E}_n[B^{i}B^{j}] &= C^{ij}_n + J^{i}_n J^{j}_n
    \end{cases}$$

and the resulting ME distribution is a Multivariate Gaussian:

\begin{align}
    \label{eq:multigaussian}
      Q_n(\prof) &\equiv \mathcal{N}(\prof| \mathbf{J}_n, \mathbf{C}_n) = |2\pi \mathbf{C}_n|^{-1/2} \exp\left[ -\frac12 (\prof- \mathbf{J}_n) \cdot \mathbf{C}_n^{-1} (\prof- \mathbf{J}_n) \right] \\
    &= \frac{1}{Z_{\mathcal{N}_n}} \exp\left[ -\vec{\theta}_n\cdot \prof- \prof\cdot \underline{\theta_n} \prof\right]
\end{align}

where $\theta^i_n = - \left( C^{-1}_n\right)_{ij}J^{j}_n$ and $\underline{\theta_n}^{ij} =  \frac12 \left( C^{-1}_n \right)_{ij}$ are the Lagrange multipliers relevant to define the distribution.

Remembering that in the [@eq:gradientdescent], the update equation, we had to evaluate a derivative with respective to the Lagrange multipliers, we transform that derivative in another, more tractable, one:

$$\theta^i_n = - \left( C^{-1}_n\right)_{ij}J^{j}_n\quad \Rightarrow\quad \vec{\theta}_n =  - \mathbf{C}_n^{-1} \mathbf{J}_n\quad \Rightarrow\quad \mathbf{J}_n = - \mathbf{C}_n \vec{\theta}_n$$

From this equation we can obtain[^einstein-reminder]:

$$\frac{\partial}{\partial \theta_n^i} = \frac{\partial J^{l}_n}{\partial \theta_n^i} \frac{\partial}{\partial J^{l}_n} = - C_n^{li} \frac{\partial}{\partial J^{l}_n}$$

And finally:

$$ J^{i}_{n+1} = J^{i}_n - \frac{\partial \log Z_{n+1}}{\partial \theta^i_n} = J^{i}_n - C^{li}_n \frac{\partial \log Z_{n+1}}{\partial J^{l}_n}$$ {#eq:upstudenti}

In vectorial form (noticing that $\mathbf{C}$ is symmetric):

$$ \mathbf{J}_{n+1} = \mathbf{J}_n + \mathbf{C}_n \cdot \nabla_{\mathbf{J}_n} \log Z_{n+1}$$ {#eq:upstudent}

Similarly, one can follow the same procedure to study the evolution of $C^{ij}_n$:

$$ C^{ij}_{n+1} = C_n^{ji} + C_n^{jk} C_n^{il} \frac{\partial}{\partial J^{k}_n} \frac{\partial}{\partial J^{l}_n} \log Z_{n+1}$$ {#eq:upcij}

In vectorial form (noticing that $\mathbf{C}$ is symmetric since it is a covariance matrix):

$$ \mathbf{C}_{n+1} = \mathbf{C}_n + \mathbf{C}_n \cdot \left( \mathbf{H}_{\mathbf{J}_n} \log Z_{n+1} \right) \cdot \mathbf{C}_n $$ {#eq:upc}

where $\mathbf{H}_{\mathbf{J}_n} \log Z_{n+1}$ is the Hessian matrix of second derivatives of $\log Z_{n+1}$ with respect to the elements of $\mathbf{J}_n$.


## Bayesian & Gaussian Perceptron {#sec:bayesgaussperceptron}

Proceeding a bit further, we consider the following machine $\model$ hardcoded to infer the value of $\prof\in \mathbb{R}^K$ (what we have been calling $\xx$) and make predictions $\sigma$ about $\xi \in \mathbb{R}^K$ using the following mechanisms:

$$
\model: \begin{cases}
    \mathit{input/data:}  & y = \left( \xi \in \mathbb{R}^K;\ \sigma \in \{ -1, +1 \} \right) \\
    \mathit{architecture:}& \tau = \mathrm{sign} (\xi \cdot \prof) \\
                        & \sigma =
    \begin{cases} -\tau\ &\text{with probability}\ \ \ \varepsilon \\
    \ \ \tau\vphantom{\frac{0}{0}}\ &\text{with probability}\ 1 - \varepsilon
    \end{cases} \\
\mathit{inference:}& \mathbb{E}[B^{i}] = J^{i},\  \mathbb{E}[B^{i}B^{j}] = C_{ij} + J^{i}J^{j}
\end{cases}
$$ {#eq:model}

Since the set of generators being used is the same as last section's, we know that the Maximum Entropy distribution will be a multivariate gaussian as given by [@eq:multigaussian] and the update equations will be given by [@eq:upstudent] and [@eq:upc].

The learning situation described by $\model$ can be interpreted as follows: consider a pair of vectors (*perceptrons*) $\mathbf{J}, \prof\in \mathbb{R}^K$ where $\prof$ is called professor and $\mathbf{J}$ is called student. The student $\mathbf{J}$ will learn to imitate the professor $\prof$ through examples $(\xi_\mu, \sigma_\mu)$, where $\xi_\mu \in \mathbb{R}^K$ is typically called an issue and $\tau_\mu = \mathrm{sign}(\prof\cdot \xi_\mu)$ is the professor's opinion over the respective question. The student assumes the opinion can be corrupted by a multiplicative noise $\varepsilon$ (a distrust) when it is received from the professor. The set of $n$ pairs issue-opinion $\mathcal{D}_n = \{ (\xi_\mu, \sigma_\mu)_{\mu=1}^n \}$ is called learning set at time $n$.


As we have already laid out our inference problem in [@sec:bayeslearn] and solved it for the gaussian parametric family in [@sec:bayesgausslearn], all that is left is to calculate $\log Z_n$.

\begin{align}
     Z_{n+1} &= \int \mathrm{d}\xx\ P(\mathcal{D}_{n+1}| \xx) P(\xx| \theta_n) = \int \mathrm{d}\prof\ P(\xi) P(\sigma| \xi, \prof) Q_n(\prof) \\
    & = k_\xi \left\langle P(\sigma| \xi, \prof) \right\rangle_{Q_n(\prof)}
\end{align}

where $k_\xi = P(\xi)$ is a constant because we are considering the issues $\xi$ are sampled uniformly over some manifold (for example, the $K$-sphere) and are independent of $\prof$.

Under this learning paradigm we also postulate the likelihood distribution to be:

\begin{align}
     P( \sigma | \xi, \prof, \varepsilon) &= \varepsilon \Theta( -\sigma \xi \cdot \prof) + (1-\varepsilon)\Theta( \sigma \xi \cdot \prof) \\
    &= \varepsilon + (1 - 2\varepsilon) \Theta( \sigma \xi \cdot \prof)
\end{align}

The only part depending on $\prof$ will be the Heaviside function $\Theta$, therefore we proceed to calculate its expected value:

\begin{align}
     \left\langle \Theta( \sigma \xi \cdot \prof) \right\rangle_{Q_n(\prof)} &= \int \mathrm{d}\prof\ \Theta\left( \sigma \xi \cdot \prof\right) \frac{1}{\left| 2\pi \mathbf{C_n}\right|^{\frac12}} \exp \left[ -\frac12 (\prof- \mathbf{J}_n) \cdot \mathbf{C}_n^{-1} (\prof- \mathbf{J}_n) \right] \\
     = \int \mathrm{d}b\ \Theta(\sigma b)\ &\int \frac{\mathrm{d}\prof}{\left| 2\pi \mathbf{C_n}\right|^{\frac12}}\ \exp \left[ -\frac12 (\prof- \mathbf{J}_n) \cdot \mathbf{C}_n^{-1} (\prof- \mathbf{J}_n) \right] \delta \left( b - \frac{1}{\sqrt{K}} \xi \cdot \prof\right) \\
     = \int \mathrm{d}b\ \Theta(\sigma b)\ &\int \frac{\mathrm{d}\hat{b}}{2\pi} e^{i\hat{b}b} \int \frac{\mathrm{d}\prof}{\left| 2\pi \mathbf{C_n}\right|^{\frac12}} \exp \left[ -\frac12 (\prof- \mathbf{J}_n) \cdot \mathbf{C}_n^{-1} (\prof- \mathbf{J}_n) - \frac{i\hat{b}}{\sqrt{K}} \xi \cdot \prof\right] \\
     = \int \mathrm{d}b\ \Theta(\sigma b)\ &\int \frac{\mathrm{d}\hat{b}}{2\pi} e^{ib\hat{b}}\ \exp \left[ -\frac12 \left( \frac{\hat{b}^2}{K} \xi \cdot \mathbf{C}_n \xi + \frac{2i\hat{b}}{\sqrt{K}} \xi \cdot \mathbf{J}_n \right) \right] \\
     = \int \mathrm{d}b\ \Theta(\sigma b)\ &\int \frac{\mathrm{d}\hat{b}}{2\pi} \exp \left[ -\frac12 \left( \hat{b}^2\Gamma_n^2 + 2i\hat{b} (h_n - b) \right) \right]
\end{align}

$$\left\langle \Theta( \sigma \xi \cdot \prof) \right\rangle_{Q_n(\prof)} = \int \mathrm{d}b\ \Theta(\sigma b)\ \frac{1}{\sqrt{2\pi \Gamma_n^2}} \exp \left[ -\frac12 \left( \frac{h_n - b}{\Gamma_n} \right)^2 \right]$$

where we used the definition of $h_n$ (a projection of the issue $\xi$ over the mean value $\mathbf{J}_n$) and defined a new variable $\Gamma_n^2 = \frac1K \xi \cdot \mathbf{C}_n \xi$, as the norm of the issue presented to the student weighted by its correlation matrix $\mathbf{C}_n$.

Analyzing each case $\sigma = \pm 1$ separately we end up with:

$$ Z_{n+1} = k_\xi \left[ \varepsilon + \left( 1 - 2\varepsilon \right)\Phi\left( \frac{\sigma h_n}{\Gamma_n}\right)\right] $$ {#eq:partitionbayesgaussperceptron}

where $\Phi$ is the cumulative distribution function of the gaussian distribution.

Finally, taking the logarithm (and discarding the constant part $k_\xi$ which does not contribute to our inference):

$$ -\log Z_{n+1} = -\log\left[\varepsilon + \left(1 - 2\varepsilon\right) \Phi\left( \tfrac{\sigma h_n}{\Gamma_n} \right)\right] $$ {#eq:freeenergy}


[^einstein-summation]:

    Here we start using Einstein summation convention $$ x_a y^a \equiv \sum_a x_a y_a $$


[^einstein-reminder]:

    Remember Einstein summation convention: $\dfrac{\partial J^{l}_n}{\partial \theta_n^i} \dfrac{\partial}{\partial J^{l}_n}$ implies a sum $\sum_{l=1}^K$
