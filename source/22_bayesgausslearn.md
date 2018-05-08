
## Gaussian Parametric Family {#sec:bayesgausslearn}

Due to its generality, importance and easy of use, we analyze a special case of parametric family: the Gaussian distributions family. We will start with the univariate case, so that we can build our intuition on it, and then we shall proceed to the multivariate one.

In this section we analyze how the parameters of the gaussian distribution update under the framework developed in section [@sec:bayeslearn].

### Univariate Case

The generators we assume to be relevant to draw inference over $x\in \mathbb{R}$ will be

$$\begin{cases}
    \mathbb{E}_n[x]   &= \mu_n \\  
    \mathbb{E}_n[x^2] &= \sigma^2_n + \mu^2_n
  \end{cases}$$

and the resulting ME distribution is a **Univariate Gaussian**, or Normal distribution:

\begin{align}
    \label{eq:multigaussian}
      Q_n(x) &\equiv \mathcal{N}(x| \mu_n, \sigma^2_n) = (2\pi \sigma_n^2)^{-1/2} \exp\left[ -\frac12 \frac{(x- \mu_n)^2}{\sigma^2} \right] \\
             &= \frac{1}{Z_{\mathcal{N}_n}} \exp\left[ -\theta^{(1)}_n x- \theta^{(2)}_n x^2 \right]
\end{align}

where $\theta^{(1)}_n = -\dfrac{\mu_n}{\sigma_n^2}$ and $\theta^{(2)}_n =  \dfrac{1}{2\sigma_n^2}$ are the relevant Lagrange multipliers to define the distribution.

FINISH THE INFERENCE

### Multivariate Case

The next set of generators we assume to be relevant to draw an inference, now over a vector $\mathbf{B}\in \mathbb{R}^K$, will be

$$\begin{cases}
    \mathbb{E}_n[B^{i}] &= J^{i}_n \\  
    \mathbb{E}_n[B^{i}B^{j}] &= C^{ij}_n + J^{i}_n J^{j}_n
    \end{cases}$$

and the resulting ME distribution is a **Multivariate Gaussian**:

\begin{align}
    \label{eq:multigaussian}
      Q_n(\mathbf{B}) &\equiv \mathcal{N}(\mathbf{B}| \mathbf{J}_n, \mathbf{C}_n) = |2\pi \mathbf{C}_n|^{-1/2} \exp\left[ -\frac12 (\mathbf{B}- \mathbf{J}_n) \cdot \mathbf{C}_n^{-1} (\mathbf{B}- \mathbf{J}_n) \right] \\
    &= \frac{1}{Z_{\mathcal{N}_n}} \exp\left[ -\vec{\theta}_n\cdot \mathbf{B}- \mathbf{B}\cdot \underline{\theta_n} \mathbf{B}\right]
\end{align}

where $\theta^i_n = - \left( C^{-1}_n\right)_{ij}J^{j}_n$ and $\underline{\theta_n}^{ij} =  \frac12 \left( C^{-1}_n \right)_{ij}$ are the Lagrange multipliers relevant to define the distribution.

Remembering that in the update equation [@eq:gradientdescent] we had to evaluate a derivative with respective to the Lagrange multipliers, we transform that derivative in another, more tractable, one:

$$\theta^i_n = - \left( C^{-1}_n\right)_{ij}J^{j}_n\quad \Rightarrow\quad \vec{\theta}_n =  - \mathbf{C}_n^{-1} \mathbf{J}_n\quad \Rightarrow\quad \mathbf{J}_n = - \mathbf{C}_n \vec{\theta}_n$$

From this equation we can obtain[^einstein-reminder]:

$$\frac{\partial}{\partial \theta_n^i} = \frac{\partial J^{l}_n}{\partial \theta_n^i} \frac{\partial}{\partial J^{l}_n} = - C_n^{li} \frac{\partial}{\partial J^{l}_n}$$

And finally:

$$ J^{i}_{n+1} = J^{i}_n + \frac{\partial -Z_{n+1}}{\partial \theta^i_n} = J^{i}_n - C^{li}_n \frac{\partial -Z_{n+1}}{\partial J^{l}_n}$$ {#eq:upstudenti}

In vectorial form (noticing that $\mathbf{C}$ is symmetric):

$$ \mathbf{J}_{n+1} = \mathbf{J}_n - \mathbf{C}_n \cdot \nabla_{\mathbf{J}_n} -Z_{n+1}$$ {#eq:upstudent}

Similarly, one can follow the same procedure to study the evolution of $C^{ij}_n$:

$$ C^{ij}_{n+1} = C_n^{ji} - C_n^{jk} C_n^{il} \frac{\partial}{\partial J^{k}_n} \frac{\partial}{\partial J^{l}_n} -Z_{n+1}$$ {#eq:upcij}

In vectorial form (noticing that $\mathbf{C}$ is symmetric since it is a covariance matrix):

$$ \mathbf{C}_{n+1} = \mathbf{C}_n - \mathbf{C}_n \cdot \left( \mathbf{H}_{\mathbf{J}_n} -Z_{n+1} \right) \cdot \mathbf{C}_n $$ {#eq:upc}

where $\mathbf{H}_{\mathbf{J}_n} -Z_{n+1}$ is the Hessian matrix of second derivatives of $-Z_{n+1}$ with respect to the elements of $\mathbf{J}_n$.


[^einstein-reminder]:

    Remember Einstein summation convention: $\dfrac{\partial J^{l}_n}{\partial \theta_n^i} \dfrac{\partial}{\partial J^{l}_n}$ implies a sum $\sum_{l=1}^K$
