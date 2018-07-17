
## A Mean Field society model {#sec:meanfield}

A possible strategy to study a society of the agents developed in section [@sec:bayesgaussperceptron] is to recognize relevant information that describes the model and proceed with Statistical Mechanics tools. At some point the calculation might become intractable and one must transition to approximate results and/or computational methods. In this section we develop a Mean Field approach to an specific canonical ensemble of social agents in a noisy society.

To look for the relevant information that describes the model we first look at the Update [@eq:upstudent; @eq:upc]. For simplicity we consider that the description of our "moral space" $\mathbb{R}^K$ is already one that renders the "moral dimensions" independent from one another, and we assume that $\mathbf{C}_n =  \gamma^2_n \mathbb1$. We also assume that, for a certain timescale, the evolution of $\gamma$ is frozen. Hence, the update mechanism is going to be led only by:

$$ \mathbf{J}_{n+1} = \mathbf{J}_n - \nabla_{\mathbf{J}_n} \gamma^2 \log\left[\varepsilon + \left(1 - 2\varepsilon\right) \Phi\left( \tfrac{\sigma h_n}{\gamma} \right)\right] $$ {#eq:upstudentfinal}

Under those circumstances, the only relevant information to describe the evolution of our system is going to be the term inside the differentiation, and we can consider that our society of agents $\{ \studenti \}$ can be described totally by one specific Hamiltonian $\mathcal{H}$:

$$  \mathcal{H}=  - \gamma^2 \sum_{\langle i,j \rangle} \log \left[ \varepsilon + \left(1 - 2\varepsilon\right) \Phi \left( \frac1\gamma \left( \sigma_i h_j + \sigma_j h_i \right) \right) \right] = \sum_{\langle i,j \rangle} V_{ij} $$ {#eq:hamiltonian1}

From the rules of entropic inference, we can study this society using the following canonical (Boltzmann) probability distribution:

<!-- We also suppose that the mean value of this quantity $\left\langle \mathcal{H} \right\rangle$ is conserved throughout the configuration evolution of the society, that is, $\mathcal{H}$ remains close to some fixed value $E$ of energy but has the possibility of oscillating to higher/lower energy values depending on some "temperature" parameter (which can also be seen as a "social pressure"). In a Maximum Entropy framework, we can say that the probability distribution describing this society with this information paradigm is given by the canonical (Boltzmann) distribution: -->

$$P_B(\{ \student_i \}) = \frac{1}{Z_B} \exp \left( - \beta \mathcal{H}\left( \{ \student_i \} \right)\ \right)$$ {#eq:canonicaldistribution}

This description, however, is rather complex depending on the kind of applications we want to follow. A common procedure to simplify our model is to consider a mean field approximation, which projects our solution (the probability distribution $P_B$, which depends on the whole set $\{\student_i\}$ all at once) into a a parametric family of separable probability distributions $P_0 = \Pi_i P_i(\student_i)$ much simpler to work with.

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

Unfortunately, due to the rather complex form of the potential $V_{ij}$, the equation above is intractable. In that case, instead of selecting the best mean field probability distribution family, we are going to choose one with a similar functional form.

We proceed comparing the exact mean field projection done above and the Hamiltonian in [@eq:hamiltonian1] to an approximate distribution that takes into account only an effective number of neighbors $\nu_{(i)}$ with effective interactions $m_{(i)}$ and $r_{(i)}$:

$$ P_j(\student_j) = \frac{1}{Z_j} \left[ \varepsilon + \left(1 - 2\varepsilon\right) \Phi \left( \frac1\gamma \left( r_{(i)} h_j + \sigma_j m_{(i)} \right) \right) \right]^{\beta \nu_{(j)} \gamma^2} $$

In fact, one can think of $m$ and $r$ as parameters that describe the overall behavior of the society, such that one agent $i$ receives signals from its neighbors irrespective of label $i$. This does not mean that all the agents are identical, but that they draw their moral vector from the same probability distribution (being held constant all the other parameters: $\beta, \varepsilon, \gamma$)

We can represent this self-consistently with the following set of equations to be obeyed:

\begin{align}
    m &= \int \mathrm{d}\student\ h(\student) P_{\mathrm{MF}}(\student) \\
    r &= \int \mathrm{d}\student\ \sigma(\student) P_{\mathrm{MF}}(\student)
\end{align}

Our final mean field probability distribution then becomes:

$$ P_{\mathrm{MF}}(\student) = \frac{1}{Z} \left[ \varepsilon + \left(1 - 2\varepsilon\right) \Phi \left( \frac{r}\gamma h (\student) + \frac{m}{\gamma}\sigma (\student) \right) \right]^{\beta \nu \gamma^2} $$ {#eq:meanfieldfinal}

We can now come back to the definition of our order parameters and evaluate explicitly their values by integration:

\begin{align}
    m &= \int \mathrm{d}\student_i h_i P_i = \frac{1}{Z_k} \int \mathrm{d}\student_i h_i \left[ \varepsilon + \left(1 - 2\varepsilon\right)  \Phi \left( \frac1\gamma \left( r h_i + \sigma_i m \right) \right) \right]^{\beta \nu \gamma^2} \\
    \nonumber &= \frac{1}{Z_i} \frac{1}{\sqrt{K}} \int \mathrm{d}\student_i\ \xi \cdot \student_i \left[ \varepsilon + \left(1 - 2\varepsilon\right)  \Phi \left( \frac1\gamma \left( r \frac{\xi \cdot \student_i}{\sqrt{K}} + \mathrm{sign} \left( \xi \cdot \student_i \right)  m \right) \right) \right]^{\beta \nu \gamma^2}
\end{align}

\begin{align}
    r &= \int \mathrm{d}\student_i \sigma_i P_i = \frac{1}{Z_k} \int \mathrm{d}\student_i \sigma_i \left[ \varepsilon + \left(1 - 2\varepsilon\right)  \Phi \left( \frac1\gamma \left( r h_i + \sigma_i m \right) \right) \right]^{\beta \nu \gamma^2} \\
    \nonumber &= \frac{1}{Z_i} \int \mathrm{d}\student_i\ \mathrm{sign} \left( \xi \cdot \student_i \right) \left[ \varepsilon + \left(1 - 2\varepsilon\right)  \Phi \left( \frac1\gamma \left( r \frac{\xi \cdot \student_i}{\sqrt{K}} + \mathrm{sign} \left( \xi \cdot \student_i \right)  m \right) \right) \right]^{\beta \nu \gamma^2}
\end{align}

Since we can always rotate the coordinate system to a given orientation, we choose one in which $\xi = |\xi| \hat{\mathrm{e}}_5$, so that $\xi \cdot \student_i = \sqrt{K} \cos\theta$ and all the other angular integrals are trivial besides the one in $\theta$:

\begin{align}
    \nonumber m &= \frac{1}{\zeta} \int_0^\pi \mathrm{d}\theta \sin^3 \theta \cos\theta\ B(\theta| \varepsilon, \gamma, m, r, \beta\nu)  \\
    r &= \frac{1}{\zeta} \int_0^\pi \mathrm{d}\theta \sin^3 \theta\ \mathrm{sign} \left( \cos\theta \right)\ B(\theta| \varepsilon, \gamma, m, r, \beta\nu) \label{eq:mfeqs} \\
    \nonumber \zeta &= \hspace{4mm}\int_0^\pi \mathrm{d}\theta \sin^3 \theta\ B(\theta| \varepsilon, \gamma, m, r, \beta\nu)
\end{align}

where we implicitly defined the function $B(\theta) \equiv B(\theta| \varepsilon, \gamma, m, r, \beta\nu)$ :

$$ B(\theta) = \left[ \varepsilon + \left(1 - 2\varepsilon\right)  \Phi \left( \frac1\gamma \left( r\cos\theta + \mathrm{sign} \left( \cos\theta \right)  m \right) \right) \right]^{\beta \nu \gamma^2} $$ {#eq:bfunction}

We can now use a computer to find the values of $(m, r \zeta)$ for each set of parameters $\varepsilon, \gamma, \beta\nu$, and have some insight on the behaviour of the system. We present this in [@sec:mfresults].
