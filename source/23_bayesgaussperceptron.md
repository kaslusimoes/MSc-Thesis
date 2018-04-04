
## Bayesian & Gaussian Perceptron {#sec:bayesgaussperceptron}


Proceeding a bit further, we consider the following machine $\mathcal{M}$ hardcoded to infer the value of $\mathbf{B}\in \mathbb{R}^K$ (what we have been calling $\mathbf{x}$) and make predictions $\sigma$ about $\xi \in \mathbb{R}^K$ using the following mechanisms:

$$
\mathcal{M}: \begin{cases}
    \emph{input/data:}  & y = \left( \xi \in \mathbb{R}^K;\ \sigma \in \{ -1, +1 \} \right) \\
    \emph{architecture:}& \tau = \mathrm{sign} (\xi \cdot \mathbf{B}) \\
                        & \sigma = 
    \begin{cases} -\tau\ &\text{with probability}\ \ \ \varepsilon \\ 
    \ \ \tau\vphantom{\frac{0}{0}}\ &\text{with probability}\ 1 - \varepsilon 
    \end{cases} \\
\emph{inference:}& \mathbb{E}[B^{i}] = J^{i},\  \mathbb{E}[B^{i}B^{j}] = C_{ij} + J^{i}J^{j}
\end{cases}
$$ {#eq:model}

Since the set of generators being used is the same as last section's, we know that the Maximum Entropy distribution will be a multivariate gaussian as given by [@eq:multigaussian] and the update equations will be given by [@eq:upstudent] and [@eq:upc].

The learning situation described by $\mathcal{M}$ can be interpreted as follows: consider a pair of vectors (*perceptrons*) $\mathbf{J}, \mathbf{B}\in \mathbb{R}^K$ where $\mathbf{B}$ is called **professor** and $\mathbf{J}$ is called **student**. The student $\mathbf{J}$ will learn to imitate the professor $\mathbf{B}$ through examples $(\xi_\mu, \sigma_\mu)$, where $\xi_\mu \in \mathbb{R}^K$ is typically called an **issue** and $\tau_\mu = \mathrm{sign(\mathbf{B}\cdot \xi_\mu)}$ is the professor's **opinion** over the respective question. This opinion can be corrupted by a multiplicative noise $\varepsilon$ (a **distrust**) when it is passed to the student. The set of $n$ pairs issue-opinion $\mathcal{D}_n = \{ (\xi_\mu, \sigma_\mu)_{\mu=1}^n \}$ is called **learning set** at time $n$.


As we have already laid out our inference problem in section [@sec:bayeslearn] and solved it for the gaussian parametric family in section [@sec:bayesgausslearn], all that is left is to calculate the free energy $\mathcal{E}_n = - \log Z_n$.

\begin{align}
     Z_{n+1} &= \int \mathrm{d}\mathbf{x}\ P(\mathcal{D}_{n+1}| \mathbf{x}) P(\mathbf{x}| \theta_n) = \int \mathrm{d}\mathbf{B}\ P(\xi) P(\sigma| \xi, \mathbf{B}) Q_n(\mathbf{B}) \\
    & = k_\xi \left\langle P(\sigma| \xi, \mathbf{B}) \right\rangle_{Q_n(\mathbf{B})}
\end{align}

where $k_\xi = P(\xi)$ is a constant because we are considering the issues $\xi$ are sampled uniformly over some manifold (for example, the $K$-sphere) and are independent of $\mathbf{B}$.

Under this learning paradigm we also postulate the likelihood distribution to be:

\begin{align}
     P( \sigma | \xi, \mathbf{B}, \varepsilon) &= \varepsilon \Theta( -\sigma \xi \cdot \mathbf{B}) + (1-\varepsilon)\Theta( \sigma \xi \cdot \mathbf{B}) \\
    &= \varepsilon + (1 - 2\varepsilon) \Theta( \sigma \xi \cdot \mathbf{B})
\end{align}

The only part depending on $\mathbf{B}$ will be the Heaviside function $\Theta$, therefore we proceed to calculate its expected value:

\begin{align}
     \left\langle \Theta( \sigma \xi \cdot \mathbf{B}) \right\rangle_{Q_n(\mathbf{B})} &= \int \mathrm{d}\mathbf{B}\ \Theta\left( \sigma \xi \cdot \mathbf{B}\right) \frac{1}{\left| 2\pi \mathbf{C_n}\right|^{\frac12}} \exp \left[ -\frac12 (\mathbf{B}- \mathbf{J}_n) \cdot \mathbf{C}_n^{-1} (\mathbf{B}- \mathbf{J}_n) \right] \\
     = \int \mathrm{d}b\ \Theta(\sigma b)\ &\int \frac{\mathrm{d}\mathbf{B}}{\left| 2\pi \mathbf{C_n}\right|^{\frac12}}\ \exp \left[ -\frac12 (\mathbf{B}- \mathbf{J}_n) \cdot \mathbf{C}_n^{-1} (\mathbf{B}- \mathbf{J}_n) \right] \delta \left( b - \frac{1}{\sqrt{K}} \xi \cdot \mathbf{B}\right) \\
     = \int \mathrm{d}b\ \Theta(\sigma b)\ &\int \frac{\mathrm{d}\hat{b}}{2\pi} e^{i\hat{b}b} \int \frac{\mathrm{d}\mathbf{B}}{\left| 2\pi \mathbf{C_n}\right|^{\frac12}} \exp \left[ -\frac12 (\mathbf{B}- \mathbf{J}_n) \cdot \mathbf{C}_n^{-1} (\mathbf{B}- \mathbf{J}_n) - \frac{i\hat{b}}{\sqrt{K}} \xi \cdot \mathbf{B}\right] \\
     = \int \mathrm{d}b\ \Theta(\sigma b)\ &\int \frac{\mathrm{d}\hat{b}}{2\pi} e^{ib\hat{b}}\ \exp \left[ -\frac12 \left( \frac{\hat{b}^2}{K} \xi \cdot \mathbf{C}_n \xi + \frac{2i\hat{b}}{\sqrt{K}} \xi \cdot \mathbf{J}_n \right) \right] \\
     = \int \mathrm{d}b\ \Theta(\sigma b)\ &\int \frac{\mathrm{d}\hat{b}}{2\pi} \exp \left[ -\frac12 \left( \hat{b}^2\Gamma_n^2 + 2i\hat{b} (h_n - b) \right) \right]
\end{align}

$$\left\langle \Theta( \sigma \xi \cdot \mathbf{B}) \right\rangle_{Q_n(\mathbf{B})} = \int \mathrm{d}b\ \Theta(\sigma b)\ \frac{1}{\sqrt{2\pi \Gamma_n^2}} \exp \left[ -\frac12 \left( \frac{h_n - b}{\Gamma_n} \right)^2 \right]$$

where we used the definition of $h_n$ (a projection of the issue $\xi$ over the mean value $\mathbf{J}_n$) and defined a new variable $\Gamma_n^2 = \frac1K \xi \cdot \mathbf{C}_n \xi$, as the norm of the issue presented to the student *weighted by it's correlation matrix* $\mathbf{C}_n$.

Analyzing each case $\sigma = \pm 1$ separately we end up with:

$$ Z_{n+1} = k_\xi \left[ \varepsilon + \left( 1 - 2\varepsilon \right)\Phi\left( \frac{\sigma h_n}{\Gamma_n}\right)\right] $$ {#eq:partitionbayesgaussperceptron}

where $\Phi$ is the cumulative distribution function of the gaussian distribution.

Finally, our "free energy" cost function (discarding the constant part $k_\xi$) will be:

$$ \mathcal{E}_{n+1} = -\log\left[\varepsilon + \left(1 - 2\varepsilon\right) \Phi\left( \tfrac{\sigma h_n}{\Gamma_n} \right)\right] $$ {#eq:costbayesgaussperceptron}


