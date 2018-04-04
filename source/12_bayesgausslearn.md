
## Gaussian Parametric Family {#sec:bayesgausslearn}


Now we analyze separately a special case of parametric family. The assumed relevant generators to make inference over a vector $\mathbf{B}\in \mathbb{R}^K$ will be

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

where $\theta^i_n = - \sum_j \left( C^{-1}_n\right)_{ij}J^{j}_n$ and $\underline{\theta_n}^{ij} =  \frac12 \left( C^{-1}_n \right)_{ij}$ are the Lagrange multipliers relevant to define the distribution.

In this section we analyze how the parameters of the gaussian distribution update under the framework developed in section [@sec:bayeslearn]. In particular, we want to find two simplified equations for the evolution of $J^{i}_n$ and $C^{ij}_n$. 

First of all, let us analyze the Lagrange multipliers associated with the former:

$$\theta^i_n = - \sum_j \left( C^{-1}_n\right)_{ij}J^{j}_n\quad \Rightarrow\quad \vec{\theta}_n =  - \mathbf{C}_n^{-1} \mathbf{J}_n\quad \Rightarrow\quad \mathbf{J}_n = - \mathbf{C}_n \vec{\theta}_n$$

From this equation we can obtain:

$$\frac{\partial}{\partial \theta_n^i} = \sum_{l=1}^K \frac{\partial J^{l}_n}{\partial \theta_n^i} \frac{\partial}{\partial J^{l}_n} = - \sum_l C_n^{li} \frac{\partial}{\partial J^{l}_n}$$

And finally:

$$ J^{i}_{n+1} = J^{i}_n + \frac{\partial \mathcal{E}_{n+1}}{\partial \theta^i_n} = J^{i}_n - \sum_l C^{li}_n \frac{\partial \mathcal{E}_{n+1}}{\partial J^{l}_n}$$ {#eq:upstudenti}

In vectorial form (noticing that $\mathbf{C}$ is symmetric):

$$ \mathbf{J}_{n+1} = \mathbf{J}_n - \mathbf{C}_n \cdot \nabla_{\mathbf{J}_n} \mathcal{E}_{n+1}$$ {#eq:upstudent}

We could follow the same procedure to study the evolution of $C^{ij}_n$ but in that case we would need to study the derivative of $\mathcal{E}_{n+1}$ with respect to $\left(C^{-1}_n\right)_{ij}$, which can be quite complicated. An easier approach is to match the generators' expected values. Either way, this evolution will not be important to the work we develop in this report so we only state the result:

$$ C^{ij}_{n+1} = C_n^{ji} - \sum_k \sum_l  C_n^{jk} C_n^{il} \frac{\partial}{\partial J^{k}_n} \frac{\partial}{\partial J^{l}_n} \mathcal{E}_{n+1}$$ {#eq:upcij}

In vectorial form (noticing that $\mathbf{C}$ is symmetric since it is a covariance matrix):

$$ \mathbf{C}_{n+1} = \mathbf{C}_n - \mathbf{C}_n \cdot \left( \mathbf{H}_{\mathbf{J}_n} \mathcal{E}_{n+1} \right) \cdot \mathbf{C}_n $$ {#eq:upc}

where $\mathbf{H}_{\mathbf{J}_n} \mathcal{E}_{n+1}$ is the Hessian matrix of second derivatives of $\mathcal{E}_{n+1}$ with respect to the elements of $\mathbf{J}_n$.
