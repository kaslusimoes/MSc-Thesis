
## Bayesian Machine Update Learning  {#sec:bayeslearn}

Consider a machine prepared to work with a fixed (*hardcoded*) model $\mathcal{M}$ which depends on some internal variables $\mathbf{x}$. Such machine is presented with examples $y$ and seeks to update its knowledge about $\mathbf{x}$ in such a way to describe correctly (with $\mathcal{M}$) the received examples while still improving its ability to predict future inputs (also known as capability of *generalization*).

That machine needs to somehow codify which values of $\mathbf{x}$ are more appropriate to the classification task being learned. As this is an incomplete information situation (that is, we do not have full access to the optimal parameters $\hat{\mathbf{x}}$), we use probability theory tools to describe the plausibility (or beliefs) the machine attributes - through its mechanical-logical-electronic processes - to each value of $\mathbf{x}$. This we call the distribution $Q(\mathbf{x})$.

By means of practicality we are going to consider that the distribution $Q(\mathbf{x})$ belongs to some *parametric family* of probability distributions. That is, there is a set of conditions (from now on called **generators**) satisfied by and, more than that, *defining* the utilized distribution:

$$ \exists\ \{f_a(\mathbf{x})\}_{a=1}^G\ \ \text{such that} \ \ \mathbb{E}_Q[f_a] = \eta_a $$

The technological (and evolutionary) justification supporting the choice of a parametric family comes from noticing that the machine's memory (or the animal's brain, in a biology analogy) is limited and thus can only store a finite amount of information usable by its processing. Therefore it is viable that we imagine a numberless of different machines with different architectures (which differ on the parametric family used) and then compare their performances in different settings.

In possession of the generators we can do Maximum Entropy and obtain:

$$Q(\mathbf{x}) = P(\mathbf{x}|\theta) = \frac1\zeta \exp\left(- \sum_{a=1}^G \theta_a f_a(\mathbf{x}) \right)$$

where $\zeta = \int \mathrm{d}\mathbf{x}\ \exp\left(- \sum_{a=1}^G \theta_a f_a(\mathbf{x})\right)$ is the normalization of the probability distribution $Q$, also called the **partition function**. We calculate some identities that are going to be useful later on:

$$  \frac{\partial \log \zeta}{\partial \theta_b} = \frac1\zeta \frac{\partial \zeta}{\partial \theta_b} = \frac1\zeta \int \mathrm{d}\mathbf{x}\ (-f_b(\mathbf{x})) \mathrm{e}^{- \sum_a \theta_a f_a(\mathbf{x})} $$

$$ \qquad\therefore\ \frac{\partial \log \zeta}{\partial \theta_b} = - \eta_b $$ {#eq:ident1}

$$  \frac{\partial Q}{\partial \theta_b} = \frac1\zeta \mathrm{e}^{- \sum_a \theta_a f_a(\mathbf{x})} \left( -f_b(\mathbf{x})\right) +  \mathrm{e}^{- \sum_a \theta_a f_a(\mathbf{x})} \left( \frac{-1}{\zeta^2} \right) \frac{\partial \zeta}{\partial \theta_b} $$

$$ \qquad\therefore\ \frac{\partial Q}{\partial \theta_b} = [\eta_b - f_b(\mathbf{x})] Q $$ {#eq:ident2}

Knowing the probability distribution the machine attributes to the parameters of its interior model, we might calculate how it is that the "knowledge" of the machine will change when a new example is presented to it. Using Bayes' Theorem:

$$ P_{n+1}(\mathbf{x}) = P(\mathbf{x}| y_{n+1}) = \frac{L_{n+1} Q_n}{Z_{n+1}} = \frac{P(y_{n+1}| \mathbf{x})\ P(\mathbf{x}| \theta_n)}{\int \mathrm{d}\mathbf{x}\ P(y_{n+1}| \mathbf{x})\ P(\mathbf{x}| \theta_n)}$$

Although this update is exact, it does not suit our needs since the new distribution $P_{n+1}$ usually will not belong to the initial parametric family. We need an alternative step that takes into account the relevant data from Bayes' rule and remains with the same functional form as the prior.

To do that one can minimize the distance (maximize the entropy) between the distributions $D_{KL}[Q_{n+1}||Q_n]$ while enforcing the expectation values of $P_n$ with $\mathbb{E}_{P_n}[f_a(\mathbf{x})] = \eta_a$. We want to minimize the following Lagrangian[^einstein-summation]:


\begin{align}
     \Lambda[P, Q, \{\Delta_a\}] = &\int \mathrm{d}\mathbf{x}\ Q_{n+1} \log\frac{Q_{n+1}}{Q_n} - \Delta^a \left[\int \mathrm{d}\mathbf{x}\ f_a Q_{n+1} - \eta_a \right] \\
    &\quad - \Delta_0 \left[ \int \mathrm{d}\mathbf{x}\ Q_{n+1} - 1 \right]
\end{align}

Since both $Q_n$ and $P_n$ are already fixed, one can only minimize the Lagrangian varying the posterior distribution $Q_{n+1}$. Taking a functional derivative, one finds:

$$ \frac{\delta \Lambda}{\delta Q_{n+1}} = \int \mathrm{d}\mathbf{x}\ \delta Q_{n+1} \left[ \log Q_{n+1} + 1 - \log Q_n - \Delta^a f_a - \Delta_0 \right]$$

![Schematic representation of the update procedure done to revise the distribution $Q_n$. It goes as follows: one uses Bayes' Theorem (blue path) to get the new constraints and then updates the distribution through maximum entropy (red path), therefore minimizing the distance relative to the prior while enforcing the new expected values of the posterior.](images/em-updateproject.png){#fig:updateproject width='55%'}

Equating this to zero, one finds the expression for the Maximum Entropy (ME) posterior:

$$Q_{n+1}(\mathbf{x}) = Q_n(\mathbf{x})\ \mathrm{e}^{-1 + \Delta_0 + \Delta^a f_a} = \frac{1}{\zeta_{n+1}} \exp\left(- \sum_{a=1}^G \theta_a^{n+1} f_a(\mathbf{x}) \right)$$

where $\theta^{n+1}_a = \theta^n_a + \Delta_a$ and $\zeta_{n+1}$ is the
new normalization factor. If one takes a derivative with respect to
$\Delta_b$ it becomes evident that the constraint adopted was:

$$\mathbb{E}_{Q_{n+1}}[f_b(\mathbf{x})] \equiv \eta^b_{n+1} = \mathbb{E}_{P_{n+1}}[f_b(\mathbf{x})]$$

Subtracting $\eta^b_n$ from both sides and working out the equation with
results [@eq:ident1] and [@eq:ident2] we find an update rule to the parameters of the distribution.

\begin{align}
  \eta^b_{n+1} - \eta^b_n &= \mathbb{E}_{P_{n+1}}[f_b(\mathbf{x})] - \eta^b_n =  \int \mathrm{d}\mathbf{x}\ f_b(\mathbf{x})\ P_{n+1} -  \eta^b_n \int \mathrm{d}\mathbf{x}\ P_{n+1} \\
  &= \int \mathrm{d}\mathbf{x}\ [f_b(\mathbf{x}) -  \eta^b_n]\ P_{n+1}  = \int \mathrm{d}\mathbf{x}\ \frac{L_{n+1}}{Z_{n+1}}\ [f_b(\mathbf{x}) -  \eta^b_n]\ Q_n \\
  &=  \int \mathrm{d}\mathbf{x}\ \frac{L_{n+1}}{Z_{n+1}}\ \left( - \frac{\partial Q_n}{\partial \theta^b_n} \right) = - \frac{1}{Z_{n+1}} \frac{\partial}{\partial \theta^b_n} \left( \int \mathrm{d}\mathbf{x}\ L_{n+1} Q_n \right)
\end{align}

Remarkably, the schematics represented by [@fig:updateproject] is simply a **gradient descent** equation:

$$ \eta^b_{n+1} = \eta^b_{(n)} - \frac{\partial \log Z_{n+1}}{\partial \theta_b^{(n)}} = \eta^b_{(n)} + \frac{\partial \mathcal{E}_n}{\partial \theta_b^{(n)}} $$ {#eq:gradientdescent}

where we defined $\mathcal{E}_n = - \log Z_n$ the cost function of our problem. This cost function, or *"free energy"*, depends on the *intrinsic* mechanisms of the machine, not taking into account the generator family chosen. We will deal more with this topic in section [@sec:bayesgaussperceptron].


[^einstein-summation]:

    Here we start using Einstein summation convention $$ x_a y^a \equiv \sum_a x_a y_a $$
