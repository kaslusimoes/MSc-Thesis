
## Model 3 {#sec:models:model3}
<!-- A model for a Bipartite Society -->

Both models presented before have the disadvantage of not being able to describe situations in which there is a subdivision of factions, or communities, inside a same society. Other results from our group [@Alves2016; @Alves2018] give us reason to believe that the multiplicative noise $\varepsilon$ is an important parameter to analyze this phenomena of group formation and opposition between different groups.

This has led us into developing a third model, which would capture the intuitions we obtained with the first two models and could treat this situation of opposing communities' interactions. Our first model, despite being a cumbersome model to work with, had the parameter $\varepsilon$ naturally imbued into it. However, this model only yields reasonable results for $\varepsilon < 0.5$. This is because for values of $\varepsilon > 0.5$ the society enters a frustrated state which cannot be resolved by aligning nor anti-aligning the opinions of the agents. Our second model, while being more amenable to calculations, did not have a parameter enabling the existence of antiferromagnetic interactions.

Our solution then, is to develop a model from the second model (because of ease of analytical manipulation and of interpretation of results) while still capturing the existence of a parameter that describes opposition and antiferromagnetism, $\varepsilon$.

We build upon ideas of the infinite-range Ising model with antiferromagnetic interactions, which we present below.

### Infinite-range Ising model {#sec:isingmodel}

The hamiltonian describing the infinite-range Ising model is

$$ \hamiltonian_I = - \frac{J}{N} \sum_{\langle ij \rangle} s_i s_j - h \sum_i s_i $$

Considering the constraint of the expected value of the energy $\langle\hamiltonian\rangle = E$, usual maximum entropy arguments lead us into a canonical distribution $P_I(\{s_i\}) = \frac{1}{Z_I} \exp(-\beta \hamiltonian)$. We proceed evaluating the partition function of the model.

$$ Z_I = \sum_{\{s\}} \exp \left( \frac{\beta J}{N} \sum_{\langle ij \rangle} s_i s_j + \beta h \sum_i s_i \right) $$ {#eq:partitionising1}

We cannot do the sum to solve $Z_I$ with the quadratic terms ($s_i s_j$) in the exponential, so we use the following expression taken from the normalization of a gaussian distribution:

$$ \exp\left(\frac{\beta J N \mu^2}{2}\right) = \intinf \frac{\mathrm{d}M}{\sqrt{2\pi/(\beta J N)}} \exp \left( - \frac12 \beta J N M^2 + \beta J N \mu M \right) $$ {#eq:gaussiantrick1d}

Now we define $\mu = \frac1N \sum_i s_i$ and substitute [@eq:gaussiantrick1d] into [@eq:partitionising1] to perform the sum and obtain:

\begin{align}
    Z_I &= 2^N \intinf \frac{\mathrm{d}M}{\sqrt{2\pi/(\beta J N)}} \exp \left( - \frac12 \beta J N M^2 \right) \exp \left( N \log \cosh (\beta J M + \beta h ) \right) \\
    &= c_N \intinf \mathrm{d}M\ e^{\beta J N f(M)} \label{eq:partitionising2}
\end{align}

where $c_N$ is a collection of the constants and $f(M) = - \frac12 M^2 + \frac{1}{\beta J} \log \cosh (\beta J M + \beta h)$ can be associated to the free energy of the model.

We expect $N$ to be large, so we expand $f(M)$ around its maximum $M^*$ to obtain a good approximation of the integral. This is known as Laplace's method. Differentiating $f$ with respect to $M$ and finding the maximum, one obtains the known relation of Curie-Weiss:

$$ M^* = \tanh [\beta J M^* + \beta h)] $$ {#eq:curieweiss}

\newpage

Back to the partition function in [@eq:partitionising2], we approximate the integral and obtain the free energy of the model, $-f(M^*)$:

$$ \frac{1}{\beta J N} \log Z_I = f(M^*) + \mathrm{constant\ terms} $$ {#eq:thermoising}

One caveat of this calculation is that, for it to work properly, it depends on the fact that $J>0$. This is because, when the external field $h$ is zero, if we force $J<0$ at [@eq:curieweiss], the only solution becomes a zero magnetization system, the same as mentioned about our the first model with $\varepsilon > 0.5$.
<!-- If we considered antiferromagnetic interactions, that is $J<0$, the gaussian substitution needed to find the final solution would not be valid. Also,  -->

This motivates the separation of the Ising spins into 2 groups: inside each group the interaction is ferromagnetic and between spins of different groups it is antiferromagnetic. The new hamiltonian then is:

$$ \hamiltonian_{AI} = - \frac{J_+}{N} \sum_{\langle ij \rangle \in A} s_i s_j - \frac{J_+}{N} \sum_{\langle ij \rangle \in B} s_i s_j + \frac{J_-}{N} \sum_{\substack{i \in A \\ j \in B}} s_i s_j - H_A \sum_{i \in A} s_i  - H_B \sum_{j \in B} s_j $$

where $J_+, J_- > 0$.

Using the definitions $\mu_A = \frac1N \sum_{i \in A} s_i$ and $\mu_B = \frac1N \sum_{j \in B} s_j$, we can rewrite it as:

$$ \hamiltonian_{AI} = - \frac{N}{2} \left[ J_+ \mu_A^2 + J_+ \mu_B^2 - 2J_- \mu_a \mu_B \right] - N H_A \mu_A - N H_B \mu_B $$

We recognize that once more the squared terms in the Hamiltonian render the evaluation of the partition function difficult. We employ the following identity from the normalization of a multivariate gaussian distribution:

$$ \exp \left( \frac12 \vec{\mu} \cdot \Sigma^{-1} \vec{\mu} \right) = \int \frac{\mathrm{d}\xx}{\sqrt{|2\pi\Sigma|}} \exp \left( -\frac12 \xx \cdot \Sigma^{-1} \xx \right) \exp \left( \xx \cdot \Sigma^{-1} \vec{\mu}  \right) $$ {#eq:gaussiantrick2d}

where $|\Sigma|$ means the determinant of matrix $\Sigma$.

Matching $$\Sigma^{-1} = \beta N \begin{bmatrix} J_+ & -J_- \\ -J_- & J_+ \end{bmatrix}\qquad \vec{\mu} = \begin{pmatrix} \mu_A \\ \mu_B \end{pmatrix}$$ we rewrite the partition function and perform the sum over spins to obtain: <!-- in the same way as did for the ferromagnetic case -->

$$ Z = \frac{\beta N \sqrt{J_+^2 - J_-^2}}{2\pi} \int \mathrm{d}x\mathrm{d}y\ e^{\beta N f(x, y)} $$

\begin{align}
    \nonumber &f(x, y) = - \frac12 \begin{pmatrix} x, & y \end{pmatrix} \begin{bmatrix} J_+ & -J_- \\ -J_- & J_+ \end{bmatrix} \begin{pmatrix} x \\ y \end{pmatrix} + \frac{N_A}{\beta N} \log \cosh \left[ \beta \left( H_A + J_+x - J_- y \right) \right] \\
    &\qquad\qquad + \frac{N_B}{\beta N} \log \cosh \left[ \beta \left( H_B + J_+y - J_- x \right) \right]
\end{align}

Differentiating and finding the maxima $f(x^*, y^*)$:

\begin{align}
    \nonumber J_+ x^* - J_- y^* &= \frac{J_+ N_A}{N} \tanh \left[ \beta \left( H_A + J_+x^* - J_- y^* \right) \right] - \frac{J_- N_B}{N} \tanh \left[ \beta \left( H_B + J_+y^* - J_- x^* \right) \right] \\
    \nonumber J_+ y^* - J_- x^* &= \frac{J_+ N_B}{N} \tanh \left[ \beta \left( H_B + J_+y^* - J_- x^* \right) \right] - \frac{J_- N_A}{N} \tanh \left[ \beta \left( H_A + J_+x^* - J_- y^* \right) \right]
\end{align}

After some steps, those are the same as the ones below, for null external fields $H_A, H_B$:

\begin{align}
    x^* = \frac{N_A}{N} \tanh \left( \beta J_+ x^* - \beta J_- y^* \right) \\
    y^* = \frac{N_B}{N} \tanh \left( \beta J_+ y^* - \beta J_- x^* \right)
\end{align}

which now yields non-trivial results for $(x^*, y^*)$ when $J_- > J_+$, the situation in which the antiferromagnetic interaction is stronger than the ferromagnetic one.

### Bipartite Society {#sec:bipartitesociety}

Both because of our interest in investigating groups' interactions in society and because of the drawback of the first model for $\varepsilon > 0.5$ just mentioned, we proceed in the same way of the infinite-range Ising model: we separate the agents into 2 groups, which we call _communities_. These communities have ferromagnetic interactions within them and antiferromagnetic ones between elements of different groups (depicted in [@fig:antiferro2groups]).

![Exemplification of the interactions between and inside the 2 communities in a bipartite society](images/antiferromagnetic-2groups.png){#fig:antiferro2groups width='55%'}

We borrow [@eq:hamiltonianvisujeca] from [@sec:models:model2], and consider two different situations to build the Hamiltonian of a bipartite society: the first one, in which the agents interacting are agreeing $h_ih_j>0$; and a second one, in which the agents are disagreeing $h_ih_j<0$. These two situations yield different contributions: $-\delta h_ih_j$ and $-h_ih_j$, respectively. The first term will be the interaction term inside a given community, whereas the second one will be the interaction term between communities.

\newpage

After modulating the antiferromagnetic interaction with a noise level $\varepsilon$, the Hamiltonian describing our bipartite society will become:

$$  \hamiltonian =  -\frac{\delta}{N} \sum_{\langle i, j \rangle \in A} h_i h_j -\frac{\delta}{N} \sum_{\langle i, j \rangle \in B} h_i h_j - \frac{(1 - 2 \varepsilon)}{N} \sum_{\substack{i \in A \\ j \in B}} h_i h_j $$ {#eq:hamiltonian2}

where the subscript $b$ stands for bipartite and the $h_i \in [-1, 1]$ are the opinion fields for each of the $N$ agents. Both parameters $\delta$ and $\varepsilon$ can have values on the interval $[-1, 1]$. We note that $\delta$ describes the intensity of the in-group ferromagnetic interactions, whereas $\varepsilon$ describes the inter-group antiferromagnetic ones.

First, let us rewrite the Hamiltonian using the definitions $\mu_A = \frac1N \sum_{i \in A} h_i$ and $\mu_B = \frac1N \sum_{j \in B} h_j$:

\begin{align}
  \nonumber \hamiltonian_{b} &= -\frac{N}{2} \left[ \delta \left( \frac1N \sum_{i \in A} h_i \right)^2 + \delta \left( \frac1N \sum_{j \in B} h_i \right)^2 + 2(1 - 2 \varepsilon) \left( \frac1N \sum_{i \in A} h_i \right) \left( \frac1N \sum_{j \in B} h_j \right) \right] \\
  &= - \frac{N}{2} \left[ \delta \mu_A^2 + \delta \mu_B^2 + 2(1- 2\varepsilon) \mu_a \mu_B \right]
  \label{eq:modhamiltonian}
\end{align}

Once again we have squared terms in the Hamiltonian, which hinders the evaluation of $Z_{b}$. We use the gaussian identity from [@eq:gaussiantrick2d] to simplify our expression for $Z_{b}$.

\newpage

The terms being compared are:

\vspace{-5mm}

\begin{align}
    \mu_A = \frac1N \sum_{i\in A} h_i\ \qquad\ \mu_B = \frac1N \sum_{j\in B} h_j \\
    \Sigma^{-1} = \beta N \begin{bmatrix} \delta & 1 - 2\varepsilon \\ 1 - 2\varepsilon & \delta \end{bmatrix}
\end{align}

Then, making the substitution above, the partition function becomes:

\begin{align}
    Z_{b} &= \int_{-1}^1 \mathrm{d}h_1 \int_{-1}^1 \mathrm{d}h_2 \cdots \int_{-1}^1 \mathrm{d}h_N\ \exp(-\beta \hamiltonian) = \int \mathrm{d}h\ \exp(-\beta \hamiltonian) \\
    &= \int \mathrm{d}h\ \exp \left\{ \frac{\beta N}{2} \left[ \delta \mu_A^2 + \delta \mu_B + 2(1 - 2 \varepsilon) \mu_a \mu_B \right] \right\} \\
    &= \int \mathrm{d}h\ \int_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{\sqrt{|2\pi\Sigma|}}\ \exp \left( -\frac12 \xx \cdot \Sigma^{-1} \xx + \xx \cdot \Sigma^{-1} \vec{\mu}  \right) \\
    &= \int_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{\sqrt{|2\pi\Sigma|}} \exp\left(-\frac12 \xx \cdot \Sigma^{-1} \xx \right) \int \mathrm{d}h\ \exp\left( \xx \cdot \Sigma^{-1} \vec{\mu}  \right) \\
    \nonumber &= \int_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{\sqrt{|2\pi\Sigma|}} \exp\left(-\frac{\beta N}{2} \left( \delta x^2 + \delta y^2 + 2 (1 - 2\varepsilon) xy \right) \right) \\
    &\hspace{20mm} \times \int \mathrm{d}h\ \exp\left( \beta N \mu_A \left[ \delta x + (1-2\varepsilon)y \right] + \beta N \mu_B \left[ \delta y + (1-2\varepsilon) x \right]  \right)
\end{align}

Now we evaluate the integral over $h$ separating into contributions from each group:

<!-- I_h &= \int \mathrm{d}h\ \exp\left( \beta \left[ \delta x + (1-2\varepsilon)y \right] \sum_{i \in A} h_i + \beta \left[ \delta y + (1-2\varepsilon)x \right] \sum_{j \in B} h_j \right) \\ -->

\begin{align}
    I_h &= \int \mathrm{d}h_A\ \exp\left( \beta \left[ \delta x + (1-2\varepsilon)y \right] \sum_{j \in A} h_i \right)\int \mathrm{d}h_B\ \exp\left( \beta \left[ \delta y + (1-2\varepsilon)x \right] \sum_{j \in B} h_j \right) \\
    &= \left[ \int_{-1}^1 \mathrm{d}h_i\ \exp\left( \beta \left[ \delta x + (1-2\varepsilon)y \right] h_i \right) \right]^{N_A} \left[ \int_{-1}^1 \mathrm{d}h_j\ \exp\left( \beta \left[ \delta y + (1-2\varepsilon)x \right] h_j \right) \right]^{N_B} \\
    &= 2^N \left[ \frac{\sinh \beta \left[ \delta x + (1-2\varepsilon)y \right]}{\beta \left[ \delta x + (1-2\varepsilon)y \right]} \right]^{N_A} \left[ \frac{\sinh \beta \left[ \delta y + (1-2\varepsilon)x \right]}{\beta \left[ \delta y + (1-2\varepsilon)x \right]} \right]^{N_B}
\end{align}

\newpage

Inserting this result back into $Z$, one obtains:

$$ Z_{b} = 2^N \int_{R^2} \frac{\mathrm{d}x\mathrm{d}y}{2\pi} \sqrt{\beta\delta N} e^{Nf(x, y)} $$ {#eq:zantiferro}

where $f$ will be associated to the free energy of the model:

\begin{align}
    f(x, y) &= \frac{N_A}{N} \log \left( \frac{\sinh \beta \left[ \delta x + (1-2\varepsilon)y \right]}{\beta \left[ \delta x + (1-2\varepsilon)y \right]} \right) + \frac{N_B}{N} \log \left( \frac{\sinh \beta \left[ \delta y + (1-2\varepsilon)x \right]}{\beta \left[ \delta y + (1-2\varepsilon)x \right]} \right) \\
    \nonumber &\qquad - \frac{\beta \delta}{2} \left( x^2 + y^2 \right) - \beta (1-2\varepsilon) xy
\end{align}

<!-- We expect $N$ to be large, so we expand $f(x, y)$ around its maximum $(x^*, y^*)$ to obtain a good approximation of the integral. This is known as Laplace's method. Differentiating $f$ with respect to its variables and finding the maxima, one obtains the following set of equations: -->
Once again, we employ Laplace's method for approximation an integral by the maximum of its argument. Differentiating $f$ with respect to its arguments, $x$ and $y$, yields the following set of consistent equations to be satisfied at the maximum:

\begin{align}
	\label{eq:fmaxima1} N \left[ \delta x^* + (1-2\varepsilon)y^* \right] &= N_A \delta \left[ \coth \beta \delta x^* + (1-2\varepsilon)y^* - \frac{1}{\beta \delta x^* + (1-2\varepsilon)y^*} \right] \\
    \nonumber +& N_B (1-2\varepsilon) \left[ \coth \beta \delta y^* + (1-2\varepsilon)x^* - \frac{1}{\beta \delta y^* + (1-2\varepsilon)x^*} \right] \\
	\label{eq:fmaxima2} N \left[ \delta y^* + (1-2\varepsilon)x^* \right] &= N_B \delta \left[ \coth \beta \delta y^* + (1-2\varepsilon)x^* - \frac{1}{\beta \delta y^* + (1-2\varepsilon)x^*} \right] \\
    \nonumber +& N_A (1-2\varepsilon) \left[ \coth \beta \delta x^* + (1-2\varepsilon)y^* - \frac{1}{\beta \delta x^* + (1-2\varepsilon)y^*} \right] \nonumber
\end{align}

One can then come back to [@eq:zantiferro], continue Laplace's method extracting the term $e^{Nf(x^*, y^*)}$ from the integral and taking the logarithm to obtain:

$$ \log Z_{b}(\beta, \delta, \varepsilon) = N f(x^*, y^*, \beta, \delta, \varepsilon) + \mathrm{const.} + \mathcal{O}(N) $$ {#eq:finallogzanti}

Now, with the partition function, we have the thermodynamical model and we can understand the behaviour of the system under different regimes of the parameters.
