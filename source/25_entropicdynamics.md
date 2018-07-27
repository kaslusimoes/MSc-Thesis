
## Entropic Dynamics {#sec:entropicdynamics}

<!-- The idea of entropic dynamics has started with work from Ariel Caticha [for a pedagogical review see e.g. @Caticha2012] as a tool to recover the laws of physics as rules of inference. However, -->
The idea of using entropy to update probability distributions consistently and sequentially, called henceforth _Entropic Dynamics_, has proven to be a powerful concept in physics and in other areas as well.

In our case, we follow [@Cesar2014; @Alves2015; @Alves2016; @Alves2018] and use Entropic Dynamics to describe a model for social agents. At first these agents will just be machines learning how to classify vectors into two groups in the presence of multiplicative noise, but we imbue them with a semantical meaning in [@sec:agentmodel].

### The basics

Incomplete knowledge about the variables $\xx$ under study is represented by distribution $Q(\xx)$, which belongs to a family defined by a set of generator functions $\{f^a\}_{a=1}^G$. Once the expected values $\langle f^a \rangle = \eta^a$ are known, maximum entropy yields the distribution with least biased information at a given timestep $n$ is:

$$ Q_n(\xx) = \frac1\zeta_n \exp \left( - \sum_{a=1}^G \lambda^n_a f^a(\xx) \right) \equiv P(\xx|\lambda_n) $$ {#eq:distq}

where $\lambda_n = \{\lambda^a_n\}$ are the Lagrange multipliers that enforce the constraints chosen at timestep $n$.

<!-- The technological (or evolutionary) justification supporting the choice of some parametric family comes from noticing that the machine's memory (or an animal's brain, in a biology analogy) is limited and thus can only store a finite amount of information usable by its processing. Therefore it is viable that we imagine a numberless of different machines with different architectures (that is, which differ on the parametric family used) and then compare their performances in different settings. However,  -->

At timestep $n+1$ new information $y_{n+1}$ is discovered and we update the inference $Q_n \to Q_{n+1}$ using Maximum Entropy. This will be the Entropic Dynamics ruling the learning of our agents.

Before calculating the update, we prove some identities that are going to be useful later on[^einstein-summation]:

$$ \nonumber \frac{\partial \log \zeta}{\partial \lambda_b} = \frac1\zeta \frac{\partial \zeta}{\partial \lambda_b} = \frac1\zeta \int \mathrm{d}\xx\ (-f^b(\xx)) \mathrm{e}^{- \lambda_a f^a(\xx)} $$

$$ \qquad\therefore\ \frac{\partial \log \zeta_n}{\partial \lambda_b^n} = - \eta^b_n $$ {#eq:ident1}

$$ \nonumber \frac{\partial Q}{\partial \lambda_b} = \frac1\zeta \mathrm{e}^{- \lambda_a f^a(\xx)} \left( -f^b(\xx)\right) +  \mathrm{e}^{- \lambda_a f^a(\xx)} \left( \frac{-1}{\zeta^2} \right) \frac{\partial \zeta}{\partial \lambda_b} $$

$$ \qquad\therefore\ \frac{\partial Q}{\partial \lambda_b} = [\eta^b - f^b(\xx)] Q $$ {#eq:ident2}

In possession of the prior distribution $Q_n(\xx)$ and a model for the generation of data $P(y_{n+1}|\xx)$, the best inferential update when new data $y_{n+1}$ becomes available is Bayes' Theorem:

$$ P_{n+1}(\xx) = P(\xx| y_{n+1}) = \frac{L_{n+1} Q_n}{Z_{n+1}} = \frac{P(y_{n+1}| \xx)\ P(\xx| \lambda_n)}{\int \mathrm{d}\xx\ P(y_{n+1}| \xx)\ P(\xx| \lambda_n)}$$

This update has the problem of the new distribution $P_{n+1}$ not always belonging to the parametric family initially chosen. We need an alternative step that retains the relevant information from Bayes' rule while also ensuring we obtain the same functional form as the prior. This procedure is illustrated in [@fig:updateproject].

![Schematic representation of the update procedure done to revise the distribution $Q_n$. It goes as follows: instead of using Bayes' Theorem (blue path), one updates the distribution through Maximum Entropy (red path) while retaining the expected values matching with the ones of Bayes.](images/em-updateproject.png){#fig:updateproject width='50%'}


To do that we maximize the entropy  $S[Q_{n+1}||Q_n]$ while enforcing that the new expectation values match that of $P_n$:

\begin{align}
     \label{eq:updatelagrangian} \mathcal{L}[P, Q, \{\Delta_a\}] &= \int \mathrm{d}\xx\ Q_{n+1} \log\frac{Q_{n+1}}{Q_n} -  \Delta_0 \left[ \int \mathrm{d}\xx\ Q_{n+1} - 1 \right] \\
     \nonumber &- \Delta_a \left[\int \mathrm{d}\xx\ f^a Q_{n+1} - \mathbb{E}_{P_{n+1}}[f^a(\xx)] \right]  
\end{align}

Being both $Q_n$ and $P_n$ already fixed, we can only vary the posterior distribution $Q_{n+1}$. Taking a functional derivative with respect to it, we find:

$$ \delta \mathcal{L} = \int \mathrm{d}\xx\ \delta Q_{n+1} \left[ \log Q_{n+1} + 1 - \log Q_n - \Delta_0 - \Delta_a f^a \right]$$

Equating this to zero, we obtain the expression for the Maximum Entropy (ME) posterior:

$$Q_{n+1}(\xx) = Q_n(\xx)\ \mathrm{e}^{-1 + \Delta_0 + \Delta_a f^a} = \frac{1}{\zeta_{n+1}} \exp\left(- \lambda_a^{n+1} f^a(\xx) \right)$$

where $\zeta_{n+1}$ is the new normalization factor, $\lambda^{n+1}_a$ is defined as $\lambda^n_a + \Delta_a$, and we finally get the updated distribution at timestep $n+1$.

\newpage

Taking a derivative with respect to $\Delta_b$ in [@eq:updatelagrangian] the constraint adopted becomes explicit:

$$ \mathbb{E}_{P_{n+1}}[f^b(\xx)] = \mathbb{E}_{Q_{n+1}}[f^b(\xx)] \equiv \eta^b_{n+1} $$

Subtracting $\eta^b_n$ from both sides and working out the expression with [@eq:ident1] and [@eq:ident2], we find an update rule for the parameters of the distribution.

\begin{align}
    \eta^b_{n+1} - \eta^b_n &= \mathbb{E}_{P_{n+1}}[f^b(\xx)] - \eta^b_n =  \int \mathrm{d}\xx\ f^b(\xx)\ P_{n+1} -  \eta^b_n \int \mathrm{d}\xx\ P_{n+1} \\
    &= \int \mathrm{d}\xx\ [f^b(\xx) -  \eta^b_n]\ P_{n+1}  = \int \mathrm{d}\xx\ \frac{L_{n+1}}{Z_{n+1}}\ [f^b(\xx) -  \eta^b_n]\ Q_n \\
    &=  \int \mathrm{d}\xx\ \frac{L_{n+1}}{Z_{n+1}}\ \left( - \frac{\partial Q_n}{\partial \lambda^b_n} \right) = - \frac{1}{Z_{n+1}} \frac{\partial}{\partial \lambda^b_n} \left( \int \mathrm{d}\xx\ L_{n+1} Q_n \right)
\end{align}

Finally, the schematics represented by [@fig:updateproject] can be described as one simple a gradient descent evolution:

$$ \eta^b_{n+1} = \eta^b_{n} - \frac{\partial}{\partial \lambda_b^{n}} \log Z_{n+1} $$ {#eq:gradientdescent}

where $Z_{n+1} = \int \mathrm{d}\xx\ P(y_{n+1}|\xx) Q_n(\xx)$ is the evidence of the model, and the distribution $P(y_{n+1}|\xx)$ the likelihood, which describes how in our inference the data $y_n$ ought to be created from the hidden variable $\xx$.

One can note the resemblance between [@eq:gradientdescent] and [@eq:thermo]. Both come from a constraint imposed in the probability distribution. There it was the expected value for the Hamiltonian over an uniform prior and now the constraint was the expected value of the generator functions over a known, but not constant, prior.

We also have the same difficulty than in statistical mechanics and thermodynamics of changing between intensive and extensive variables (here, $\lambda$'s and $\eta$'s, although they need not be intensive or extensive for the maximum entropy method to work). This change between representations can be a difficulty when performing the differentiation in [@eq:gradientdescent], but we surpass this problem  in our social agent model by choosing a multivariate gaussian family.

<!-- The partition function $Z_{n+1}$ depends only on the *intrinsic* mechanisms of the machine, not taking into account the generator family chosen.  -->

<!-- It is not trivial to change between the representations $\{\lambda_a\}$ and $\{ \eta_a\}$ in the same way that is not always trivial to change between intensive and extensive parameters in thermodynamics models. -->

\newpage

### Agent model definition {#sec:agentmodel}

To continue with a model for an agent, we must first state the learning scenario over which the inference is being made. In our model the variable being inferred is a vector $\xx = \prof \in \mathbb{R}^K$.

The information available to perform the inference comes in the form of data $y = (\xi, \sigma)$ with $\xi \in \mathbb{R}^K$ and $\sigma \in \{\pm 1\}$. This represents a situation in which an agent is trying to learn how to classify an issue $\xi$ with an opinion $\sigma$. This classification task induces a separation of $\mathbb{R}^K$ by a hyperplane and is consistent with the idea that the agents are evaluating whether they agree ($+1$) or disagree ($-1$) with the issue $\xi$.

We also hypothesize to have background information about a multiplicative noise $\varepsilon$ with value between $0$ and $1$.

The likelihood distribution of the model, which is the distribution that describes the data generation process, is $P(\xi, \sigma| \prof, \varepsilon) = P(\xi| \prof, \varepsilon) P(\sigma| \xi, \prof, \varepsilon)$. For simplicity we consider $P(\xi) = \delta\left( \xi - \zeitgeist \right)$, an issue that is always being discussed in the society.

As mentioned before, the model for $P(\sigma | \xi, \prof, \varepsilon)$ is that of binary linear classifier subject to multiplicative noise:

\begin{align}
    P(\sigma| \zeitgeist, \prof, \varepsilon) &= \varepsilon \Theta\left( - \sigma \prof \cdot \zeitgeist \right) + (1 - \varepsilon) \Theta\left( \sigma \prof \cdot \zeitgeist \right) \nonumber \\
    &= \varepsilon + (1 - 2\varepsilon) \Theta\left( \sigma \prof \cdot \zeitgeist \right) \label{eq:likelihoodperceptron}
\end{align}

where $\Theta$ is the Heaviside step function.

Finally we must provide the generator functions of the model. We assume $\mathbb{E}_n[B^{i}] = J^{i}_n$ and $\mathbb{E}_n[B^{i}B^{j}] = C^{ij}_n + J^{i}_n J^{j}_n$ are the relevant generators, which yields a Multivariate Gaussian distribution family:

<!-- $$\begin{cases}
    \mathbb{E}_n[B^{i}] &= J^{i}_n \\  
    \mathbb{E}_n[B^{i}B^{j}] &= C^{ij}_n + J^{i}_n J^{j}_n
\end{cases}$$ -->

\begin{align}
    \label{eq:multigaussian}
      Q_n(\prof) &\equiv \mathcal{N}(\prof| \student_n, \mathbf{C}_n) = |2\pi \mathbf{C}_n|^{-1/2} \exp\left[ -\frac12 (\prof- \student_n) \cdot \mathbf{C}_n^{-1} (\prof- \student_n) \right] \\
    &= \frac{1}{Z_{\mathcal{N}_n}} \exp\left[ -\vec{\lambda}_n\cdot \prof- \prof\cdot \underline{\lambda_n} \prof\right]
\end{align}

where $\lambda^i_n = - \left( C^{-1}_n\right)_{ij}J^{j}_n$ and $\underline{\lambda_n}^{ij} =  \frac12 \left( C^{-1}_n \right)_{ij}$ are the Lagrange multipliers that constrain the distribution.

\newpage

One can think of this model as $\student$ being an _student_ learning how to imitate a _professor_ $\prof$. It has information about the classifications the professor emits about several issues: $\mathcal{D}_n = \{ (\xi_\mu, \sigma_\mu)_{\mu=1}^n \}$, which is also called learning set at time $n$. This is where we start to see our understanding of a **social agent**: when we couple many of these machines together they start learning from one another, being both students and professors at different timesteps.   <!-- maybe talk something about C? -->

<!-- The inference model described above can be interpreted as follows: consider a pair of vectors $\student, \prof\in \mathbb{R}^K$ where $\prof$ is called professor and $\student$ is called student. The student $\student$ will learn to imitate the professor $\prof$ through examples $(\xi_\mu, \sigma_\mu)$, where $\xi_\mu \in \mathbb{R}^K$ is typically called an issue and $\tau_\mu = \mathrm{sign}(\prof\cdot \xi_\mu)$ is the professor's opinion over the respective question. The student assumes the opinion can be corrupted by a multiplicative noise $\varepsilon$ (a distrust) when it is received from the professor. The set of $n$ pairs issue-opinion $\mathcal{D}_n = \{ (\xi_\mu, \sigma_\mu)_{\mu=1}^n \}$ is called learning set at time $n$. -->

Luckily we can invert the derivatives with respect to the Lagrange multiplers to a derivative with respect to the expected values of our generator functions[^einstein-reminder]:

$$\frac{\partial}{\partial \lambda_n^i} = \frac{\partial J^{l}_n}{\partial \lambda_n^i} \frac{\partial}{\partial J^{l}_n} = - C_n^{li} \frac{\partial}{\partial J^{l}_n}$$

Now we can come back to [@eq:gradientdescent] and find

$$ J^{i}_{n+1} = J^{i}_n - \frac{\partial \log Z_{n+1}}{\partial \lambda^i_n} = J^{i}_n - C^{li}_n \frac{\partial \log Z_{n+1}}{\partial J^{l}_n}$$ {#eq:upstudenti}

Noticing that $\mathbf{C}$ is symmetric because it is a covariance matrix, we can write in vectorial form:

\vspace{-3mm}

$$ \student_{n+1} = \student_n + \mathbf{C}_n \nabla_{\student_n} \log Z_{n+1}$$ {#eq:upstudent}

We could follow the same procedure to study the evolution of $C^{ij}_n$ but in that case we would need to study the derivative of $\log Z_{n+1}$ with respect to $\left( C^{-1}_n \right)_{ij}$, which can be a complicated endeavour. We prefer to study the update through the analogous procedure of matching the generators' expected values:

\vspace{-5mm}

\begin{align}
    \mathbb{E}_{Q_{n+1}} \left[ \profi \profi[j] \right] &\equiv C^{ij}_{n+1} + \studenti_{n+1} \studenti[j]_{n+1} \\ \label{eq:upc1}
    \nonumber &= \frac{1}{Z_{n+1}} \int \mathrm{d}\prof\ \profi \profi[j]\ L_{n+1} Q_{n+1} \equiv \mathbb{E}_{P_{n+1}}\left[\profi \profi[j] \right]
\end{align}

In order to proceed with this calculation  we must find an useful result:

\begin{align}
    \nonumber \del{Q_n}{\studenti[k]_n} &= Q_n \left[ - \frac12 \sum_{i,j}\ \left(C_n^{-1}\right)_{ij} \left( (-2) \profi \del{\studenti[j]_n}{\studenti[k]_n} + \Del{\studenti[k]} (\studenti \studenti[j]) \right) \right] \\
    &= Q_n \left[ \sum_i \left( C_n^{-1} \right)_{ik} (\profi - \studenti_n) \right]
\end{align}

From that, we obtain

\vspace{-5mm}


\begin{align}
    \nabla_{\student_n} Q_n = Q_n \mathbf{C}_n^{-1} (\prof - \student_n) \\
    \mathbf{C}_n \nabla_{\student_n} Q_n = Q_n(\prof - \student_n) \\
    \nonumber \\
    \profi Q_n = \studenti_n Q_ + \sum_k C_n^{ik} \del{Q_n}{\studenti[k]_n} \label{eq:auxiliary}
\end{align}

Now we can go back to [@eq:upc1] and use the result obtained in [@eq:auxiliary] to get:

\vspace{-5mm}

\begin{align}
    C^{ij}_{n+1} &+ \studenti_{n+1} \studenti[j]_{n+1} = \frac{1}{Z_{n+1}} \int \mathrm{d}\prof L_{n+1} B_i \left( \studenti[j]_n Q_n + \sum_k C_n^{jk} \del{Q_n}{\studenti[k]_n} \right) \\
    &= \frac{1}{Z_{n+1}} \left( \studenti[j]_n \int \mathrm{d}\prof L_{n+1} B_i Q_n + \sum_k C_n^{jk} \Del{\studenti[k]_n} \int \mathrm{d}\prof L_{n+1} B_i Q_n \right) \\
    \nonumber &= \frac{1}{Z_{n+1}} \left[ \studenti[j]_n \int \mathrm{d}\prof L_{n+1} \left( \studenti_n Q_n + \sum_k C_n^{ik} \del{Q_n}{\studenti[k]_n} \right) \right. \\
    &\qquad \left. + \sum_k C_n^{jk} \Del{\studenti[k]_n} \int \mathrm{d}\prof L_{n+1}  \left( \studenti_n Q_n + \sum_l C_n^{il} \del{Q_n}{\studenti[l]_n} \right) \right]
\end{align}

Applying the derivatives and substituting the integrals as the definition for $Z$, we obtain:

<!--
Now one has to solve each of the four integrals separately to proceed:

\vspace{-5mm}

\begin{align}
    &\studenti[j]_n \int \mathrm{d}\prof L_{n+1} \studenti_n Q_n = \studenti_n \studenti[j]_n Z_{n+1} \\
    &\studenti[j]_n \int \mathrm{d}\prof L_{n+1} \sum_k C_n^{ik} \del{Q_n}{\studenti[k]_n} = \studenti[j]_n \sum_k C_n^{ik} \Del{\studenti[k]_n} Z_{n+1} \\
    \nonumber &\sum_k C_n^{jk} \Del{\studenti[k]_n} \int \mathrm{d}\prof L_{n+1} \studenti_n Q_n = \sum_k C_n^{jk} \left[ Z_{n+1} \del{\studenti_n}{\studenti[k]_n} + \studenti_n \Del{\studenti[k]_n} Z_{n+1} \right] \\
    &\,\, = C_n^{ji} Z_{n+1} + \studenti_n \sum_k C_n^{jk} \Del{\studenti[k]_n} Z_{n+1} \\
    &\sum_k C_n^{jk} \Del{\studenti[k]_n} \int \mathrm{d}\prof L_{n+1} \sum_l C_n^{il} \del{Q_n}{\studenti[l]_n} = \sum_k \sum_l  C_n^{jk} C_n^{il} \Del{\studenti[k]_n} \Del{\studenti[l]_n} Z_{n+1}
\end{align}

Solving them and going back to the original equation, we have: -->

\begin{align}
    \nonumber C^{ij}_{n+1} + \studenti_{n+1} \studenti[j]_{n+1} = \frac{1}{Z_{n+1}} &\left[ \studenti_n \studenti[j]_n Z_{n+1} + \studenti[j]_n \sum_k C_n^{ik} \Del{\studenti[k]_n} Z_{n+1} + \studenti_n \sum_k C_n^{jk} \Del{\studenti[k]_n} Z_{n+1} + \right. \\
    &\qquad+ \left. C_n^{ji} Z_{n+1} + \sum_k \sum_l  C_n^{jk} C_n^{il} \Del{\studenti[k]_n} \Del{\studenti[l]_n} Z_{n+1} \right]
\end{align}

Now we cancel the $Z_{n+1}$ terms that can be canceled and incorporate the others into the derivatives, using the fact that the derivative of $\log Z_n$ is $\frac{1}{Z_n}$:

\begin{align}
    \nonumber C^{ij}_{n+1} + \studenti_{n+1} \studenti[j]_{n+1} &= C_n^{ji} + \studenti_n \studenti[j]_n  - \studenti[j]_n \sum_k C_n^{ik} \del{\log Z_{n+1}}{\studenti[k]_n} - \studenti_n \sum_k C_n^{jk} \del{\log Z_{n+1}}{\studenti[k]_n} \\
    &\qquad + \frac{1}{Z_{n+1}} \sum_k \sum_l  C_n^{jk} C_n^{il} \Del{\studenti[k]_n} \Del{\studenti[l]_n} Z_{n+1}
\end{align}

In order to simplify this expression we can appeal to two different results. First of all, we can go back to [@eq:upstudenti] and apply it into the left-hand side of the equation above:

\begin{align}
    \nonumber \studenti_{n+1} \studenti[j]_{n+1} &= \left( \studenti_n - \sum_k C^{ki}_n \del{\log Z_{n+1}}{\studenti[k]_n} \right) \left( \studenti[j]_n - \sum_k C^{kj}_n \del{\log Z_{n+1}}{\studenti[k]_n} \right) \\
    \nonumber &= \studenti_n \studenti[j]_n - \studenti_n \sum_k C^{kj}_n \del{\log Z_{n+1}}{\studenti[k]_n} - \studenti[j]_n \sum_k C^{ki}_n \del{\log Z_{n+1}}{\studenti[k]_n} \\
    &\qquad + \sum_k \sum_l C^{li}_n C^{kj}_n \del{\log Z_{n+1}}{\studenti[k]_n} \del{\log Z_{n+1}}{\studenti[l]_n}
\end{align}

Substituting back:

<!-- C^{ij}_{n+1} &+ \sum_k \sum_l C^{li}_n C^{kj}_n \del{\log Z_{n+1}}{\studenti[k]_n} \del{\log Z_{n+1}}{\studenti[l]_n} = C_n^{ji} + \frac{1}{Z_{n+1}} \sum_k \sum_l  C_n^{jk} C_n^{il} \Del{\studenti[k]_n} \Del{\studenti[l]_n} Z_{n+1} -->

$$ C^{ij}_{n+1} = C_n^{ji} + \sum_k \sum_l  C_n^{jk} C_n^{il} \left[ \frac{1}{Z_{n+1}} \Del{\studenti[k]_n} \Del{\studenti[l]_n} - \del{\log Z_{n+1}}{\studenti[k]_n} \del{\log Z_{n+1}}{\studenti[l]_n} \right] $$

Now we can calculate and invoke a second result:

\begin{align}
    - \Del{\studenti[k]_n} \Del{\studenti[l]_n} \log Z_{n+1} &= \Del{\studenti[k]_n} \Del{\studenti[l]_n} \log Z_{n+1} = \Del{\studenti[k]_n} \left( \frac{1}{Z_{n+1}} \Del{\studenti[l]_n} Z_{n+1} \right) \\
    &= \frac{1}{Z_{n+1}} \Del{\studenti[k]_n} \Del{\studenti[l]_n} Z_{n+1} - \frac{1}{Z_{n+1}^2} \Del{\studenti[k]_n} Z_{n+1} \Del{\studenti[l]_n} Z_{n+1} \\
    &= \frac{1}{Z_{n+1}} \deldel{Z_{n+1}}{\studenti[k]_n }{\studenti[l]_n} - \left( \Del{\studenti[k]_n} \log Z_{n+1} \right) \left( \Del{\studenti[l]_n} \log Z_{n+1} \right)
\end{align}

And finally, we have that:

$$ C^{ij}_{n+1} = C_n^{ji} - \sum_k \sum_l  C_n^{jk} C_n^{il} \Del{\studenti[k]_n} \Del{\studenti[l]_n} \log Z_{n+1} $$ {#eq:upcij}

Again, in vectorial form:

$$ \mathbf{C}_{n+1} = \mathbf{C}_n + \mathbf{C}_n \left( \mathbf{H}_{\student_n} \log Z_{n+1} \right) \mathbf{C}_n $$ {#eq:upc}

where $\mathbf{H}_{\student_n} \log Z_{n+1}$ is a notation for the matrix of second derivatives of $\log Z_{n+1}$ with respect to the elements of $\student_n$

Finally, [@eq:upstudent; @eq:upc] describe the update for the expected values $\student_n$ and $\mathbf{C}_n$, respectively. Now we only need to calculate the $Z_{n+1}$ term to complete our entropic dynamics inference describing social agents.

### Calculating $Z_{n+1}$

At last we can calculate the evidence of the model $Z_{n+1}$
<!-- = \int \mathrm{d}\xx\ P(y_{n+1}|\xx) Q_n(\xx)$ -->

\vspace{-3mm}

\begin{align}
    Z_{n+1} &= \int \mathrm{d}\xx\ P(\mathcal{D}_{n+1}| \xx) P(\xx| \theta_n) = \int \mathrm{d}\prof\ P(\xi) P(\sigma| \xi, \prof) Q_n(\prof) \\
    & = P(\xi) \left\langle P(\sigma| \xi, \prof) \right\rangle_{Q_n(\prof)}
\end{align}

where $P(\xi)$ is independent of $\prof$ so we can take it off the integral; it will not contribute when we differentiate $\log Z_{n+1}$.

<!-- \begin{align}
    P(\sigma| \zeitgeist, \prof, \varepsilon) &= \varepsilon \Theta\left( - \sigma \prof \cdot \zeitgeist \right) + (1 - \varepsilon) \Theta\left( \sigma \prof \cdot \zeitgeist \right) \nonumber \\
    &= \varepsilon + (1 - 2\varepsilon) \Theta\left( \sigma \prof \cdot \zeitgeist \right) \label{eq:likelihoodperceptron}
\end{align} -->

Remembering the likelihood distribution from [@eq:likelihoodperceptron], we now proceed to calculate the expected value of the Heaviside function:

\vspace{-3mm}

\begin{align}
    \left\langle \Theta( \sigma \xi \cdot \prof) \right\rangle_{Q_n(\prof)} &= \int \mathrm{d}\prof\ \Theta\left( \sigma \xi \cdot \prof\right) \frac{1}{\left| 2\pi \mathbf{C_n}\right|^{\frac12}} \exp \left[ -\frac12 (\prof- \student_n) \cdot \mathbf{C}_n^{-1} (\prof- \student_n) \right] \\
    = \int \mathrm{d}b\ \Theta(\sigma b)\ &\int \frac{\mathrm{d}\prof}{\left| 2\pi \mathbf{C_n}\right|^{\frac12}}\ \exp \left[ -\frac12 (\prof- \student_n) \cdot \mathbf{C}_n^{-1} (\prof- \student_n) \right] \delta \left( b - \frac{1}{\sqrt{K}} \xi \cdot \prof\right) \\
    = \int \mathrm{d}b\ \Theta(\sigma b)\ &\int \frac{\mathrm{d}\hat{b}}{2\pi} e^{i\hat{b}b} \int \frac{\mathrm{d}\prof}{\left| 2\pi \mathbf{C_n}\right|^{\frac12}} \exp \left[ -\frac12 (\prof- \student_n) \cdot \mathbf{C}_n^{-1} (\prof- \student_n) - \frac{i\hat{b}}{\sqrt{K}} \xi \cdot \prof\right] \\
    = \int \mathrm{d}b\ \Theta(\sigma b)\ &\int \frac{\mathrm{d}\hat{b}}{2\pi} e^{ib\hat{b}}\ \exp \left[ -\frac12 \left( \frac{\hat{b}^2}{K} \xi \cdot \mathbf{C}_n \xi + \frac{2i\hat{b}}{\sqrt{K}} \xi \cdot \student_n \right) \right] \\
    = \int \mathrm{d}b\ \Theta(\sigma b)\ &\int \frac{\mathrm{d}\hat{b}}{2\pi} \exp \left[ -\frac12 \left( \hat{b}^2\Gamma_n^2 + 2i\hat{b} (h_n - b) \right) \right] \\
    = \int \mathrm{d}b\ \Theta(\sigma b)\ &\frac{1}{\sqrt{2\pi \Gamma_n^2}} \exp \left[ -\frac12 \left( \frac{h_n - b}{\Gamma_n} \right)^2 \right]
\end{align}

where we defined $h_n = \frac{1}{\sqrt{K}} \zeitgeist \cdot \student_n$ and defined $\Gamma_n^2 = \frac1K \zeitgeist \cdot \mathbf{C}_n \zeitgeist$.

Analysing each case $\sigma = \pm 1$ separately, we end up with:

$$ Z_{n+1} = P(\xi) \left[ \varepsilon + \left( 1 - 2\varepsilon \right)\Phi\left( \frac{\sigma h_n}{\Gamma_n}\right)\right] $$ {#eq:partitionbayesgaussperceptron}

where $\Phi$ is the cumulative distribution function of the gaussian distribution.

Finally, taking the logarithm (and discarding the constant part $P(\xi)$ which will not contribute to our inference when we take derivatives):

$$ -\log Z_{n+1} = -\log\left[\varepsilon + \left(1 - 2\varepsilon\right) \Phi\left( \tfrac{\sigma h_n}{\Gamma_n} \right)\right] $$ {#eq:freeenergy}

This quantity is highly important because of [@eq:gradientdescent; @eq:upstudent; @eq:upc]. It functions as a cost function, generating the dynamics of the model. Although it is not an energy, it will have the same role a Hamiltonian has in statistical mechanical systems (see [@sec:statmech]): it is relevant and sufficient information to describe the evolution of our system.

[^einstein-summation]:

    Here we start using Einstein summation convention $$ x_a y^a \equiv \sum_a x_a y_a $$


[^einstein-reminder]:

    Remember Einstein summation convention: $\dfrac{\partial J^{l}_n}{\partial \lambda_n^i} \dfrac{\partial}{\partial J^{l}_n}$ implies a sum $\sum_{l=1}^K$
