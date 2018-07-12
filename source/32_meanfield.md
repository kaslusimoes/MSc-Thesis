
## Mean Field society {#sec:meanfield}

A possible strategy to study a society of the agents developed in section [@sec:bayesgaussperceptron] is to define conserved quantities - such as the Hamiltonian associated with the interaction potential of those agents - and proceed with the usual Statistical Mechanics tools. At some point the calculation might become intractable and that is when one must transition to approximate results and/or computational methods. In this section we develop a Mean Field approach to an specific canonical ensemble of social agents in a noisy society.


### Calculation and Approximation {#sec:mfcalculation}

Let us consider that a society of agents $\{ \studenti \}$ which we suppose can be described mostly by one specific Hamiltonian $\mathcal{H}$:

$$  \mathcal{H}=  - \Gamma^2 \sum_{\langle i,j \rangle} \log \left[ \varepsilon + \left(1 - 2\varepsilon\right) \Phi \left( \frac1\Gamma \left( \sigma_i h_j + \sigma_j h_i \right) \right) \right] = \sum_{\langle i,j \rangle} V_{ij} $$ {#eq:hamiltonian1}

We also suppose that the mean value of this quantity $\left\langle \mathcal{H} \right\rangle$ is conserved throughout the configuration evolution of the society, that is, $\mathcal{H}$ remains close to some fixed value $E$ of energy but has the possibility of oscillating to higher/lower energy values depending on some "temperature" parameter (which can also be seen as a "social pressure"). In a Maximum Entropy framework, we can say that the probability distribution describing this society with this information paradigm is given by the canonical (Boltzmann) distribution:

$$P_B(\{ \student_i \}) = \frac{1}{Z_B} \exp \left( - \beta \mathcal{H}\left( \{ \student_i \} \right)\ \right)$$ {#eq:canonicaldistribution}

This description, however, is rather complex depending on the kind of applications we want to follow. A common procedure to simplify our model is to consider a *mean field approximation*, which projects our solution (the probability distribution $P_B$, which depends on the whole set $\{\student_i\}$ all at once) into a a parametric family of separable probability distributions $P_0 = \Pi_i P_i(\student_i)$ much simpler to work with.

In that case, we do not wish to choose a separable distribution indiscriminately; we want to pick as close as possible the specific $P_0$ which best approximates $P_B$ given the constraints we have assigned to it. That is a calculation we can do maximizing the entropy $S$ (or minimizing the Kullback-Leibler divergence), as follows:

\begin{align}
      S[P_0 || P_B] &= - \iint \left( \prod_{i=1}^N \mathrm{d}\student_i \right) P_0 \log \left( \frac{P_0}{P_B} \right) \\
      &= - \iint \left( \prod_i \mathrm{d}\student_i \right) P_0 \left[ \log \left( Z_B \right) + \beta \mathcal{H}+ \log \left(\Pi_i P_i \right) \right] \\
     &= \left\langle \log Z_B  - \beta \mathcal{H}- \sum_i \log P_i \right\rangle_{P_0}
\end{align}

We want to find $P_0$ so that variations of $S$ equals to zero, $\delta S = 0$. Usual functional calculus arguments lead to:

$$ \delta S = \int \mathrm{d} J_k\ \delta P_k \left[ \log Z_B + \log P_k + 1 + \beta \sum_{i \in \partial k} \int \mathrm{d}\student_i P_i V_{ik} \right] $$

This result can only be possible for any variation $\delta P_k$ if the term in brackets $\left[ \cdots \right]$ is identically zero itself, so we get the following result:

$$ P_k(\student_k) = \frac{1}{Z_k} \exp \left( - \beta \sum_{i \in \partial k} \int \mathrm{d}\student_i P_i V_{ik} \right)$$ {#eq:meanfieldexact}

Unfortunately, due to the rather complex form of the potential $V_{ij}$, the equation above is intractable. In that case we are going to *choose* a mean field probability distribution family (instead of *selecting* the best one).

We proceed comparing the exact mean field projection done above and the hamiltonian in [@eq:hamiltonian1] to an approximate distribution that takes into account only an effective number of neighbors $\nu_{(i)}$ with effective interactions $m_{(i)}$ and $r_{(i)}$:

$$ P_j(\student_j) = \frac{1}{Z_j} \left[ \varepsilon + \left(1 - 2\varepsilon\right) \Phi \left( \frac1\Gamma \left( r_{(i)} h_j + \sigma_j m_{(i)} \right) \right) \right]^{\beta \nu_{(j)} \Gamma^2} $$

In fact, one can think of $m$ and $r$ as parameters that describe the overall behavior of the society, such that one agent $i$ receives signals from its neighbors irrespective of label $i$. This does not mean that all the agents are identical, but that they draw their moral vector from the same probability distribution.

We can represent this self-consistently with the following set of equations to be obeyed:

\begin{align}
    m &= \int \mathrm{d}\student\ h(\student) P_{\mathrm{MF}}(\student) \\
    r &= \int \mathrm{d}\student\ \sigma(\student) P_{\mathrm{MF}}(\student)
\end{align}

Then the mean field probability distribution becomes:

$$ P_{\mathrm{MF}}(\student) = \frac{1}{Z} \left[ \varepsilon + \left(1 - 2\varepsilon\right) \Phi \left( \frac{r}\Gamma h (\student) + \frac{m}{\Gamma}\sigma (\student) \right) \right]^{\beta \nu \Gamma^2} $$ {#eq:meanfieldfinal}

We can now come back to the definition of our order parameters and evaluate explicitly their values by integration:

\begin{align}
     m &= \int \mathrm{d}\student_i h_i P_i = \frac{1}{Z_k} \int \mathrm{d}\student_i h_i \left[ \varepsilon + \left(1 - 2\varepsilon\right)  \Phi \left( \frac1\Gamma \left( r h_i + \sigma_i m \right) \right) \right]^{\beta \nu \Gamma^2} \\
    &= \frac{1}{Z_i} \frac{1}{\sqrt{K}} \int \mathrm{d}\student_i\ \xi \cdot \student_i \left[ \varepsilon + \left(1 - 2\varepsilon\right)  \Phi \left( \frac1\Gamma \left( r \frac{\xi \cdot \student_i}{\sqrt{K}} + \mathrm{sign} \left( \xi \cdot \student_i \right)  m \right) \right) \right]^{\beta \nu \Gamma^2}
\end{align}

\begin{align}
     r &= \int \mathrm{d}\student_i \sigma_i P_i = \frac{1}{Z_k} \int \mathrm{d}\student_i \sigma_i \left[ \varepsilon + \left(1 - 2\varepsilon\right)  \Phi \left( \frac1\Gamma \left( r h_i + \sigma_i m \right) \right) \right]^{\beta \nu \Gamma^2} \\
    &= \frac{1}{Z_i} \int \mathrm{d}\student_i\ \mathrm{sign} \left( \xi \cdot \student_i \right) \left[ \varepsilon + \left(1 - 2\varepsilon\right)  \Phi \left( \frac1\Gamma \left( r \frac{\xi \cdot \student_i}{\sqrt{K}} + \mathrm{sign} \left( \xi \cdot \student_i \right)  m \right) \right) \right]^{\beta \nu \Gamma^2}
\end{align}

Since we can always rotate the coordinate system to a given orientation, we choose one in which $\xi = |\xi| \hat{\mathrm{e}}_5$, so that $\xi \cdot \student_i = \sqrt{K} \cos\theta$ and all the other angular integrals are trivial besides the one in $\theta$:

\begin{align}
    \nonumber m &= \frac{1}{\zeta} \int_0^\pi \mathrm{d}\theta \sin^3 \theta \cos\theta\ B(\theta| \varepsilon, \Gamma, m, r, \beta\nu)  \\
    r &= \frac{1}{\zeta} \int_0^\pi \mathrm{d}\theta \sin^3 \theta\ \mathrm{sign} \left( \cos\theta \right)\ B(\theta| \varepsilon, \Gamma, m, r, \beta\nu) \label{eq:mfeqs} \\
    \nonumber \zeta &= \hspace{4mm}\int_0^\pi \mathrm{d}\theta \sin^3 \theta\ B(\theta| \varepsilon, \Gamma, m, r, \beta\nu)
\end{align}

where we implicitly defined the function $B(\theta) \equiv B(\theta| \varepsilon, \Gamma, m, r, \beta\nu)$ :

$$ B(\theta) = \left[ \varepsilon + \left(1 - 2\varepsilon\right)  \Phi \left( \frac1\Gamma \left( r\cos\theta + \mathrm{sign} \left( \cos\theta \right)  m \right) \right) \right]^{\beta \nu \Gamma^2} $$ {#eq:bfunction}

Although there is no analytical solution to those equations they can be solved numerically.
