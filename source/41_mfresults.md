
## Computational Results {#sec:mfresults}

Although there is no analytical solution to those equations they can be solved numerically.

Equations  [@eq:mfeqs] can only be solved numerically, and we do it by an iterative process. Let  $u=(m,r,\zeta)$ , then the set of equations is  of the type $u= F(u)$. An initial value $u_0$ is chosen and the map

$$ u_t=(1-\alpha) u_{t-1}+ \alpha F(u_{t-1}) $$ {#eq:updatemap}

is iterated. This is a fairly standard procedure for solving mean field self consistent equations. Since it is quite easy to converge no attempt at optimizing $\alpha $ was made. The result can be checked by choosing different starting points $u_0$, for example with a fixed-point relaxation method. The results are shown in [@fig:mfeqs].

It can be seen that there is a phase transition depending on the parameters $\beta\nu$ and $\gamma$. We investigate further this transition by looking at the phase diagram in [@fig:phasem].

![Solutions of [@eq:mfeqs]. Top: The normalization of the MF distribution $\zeta$ as a function of the social pressure and number of neighbors ($\beta \nu$). Bottom: The magnetization $m$. The other order parameter $r$ has a similar behavior to $m$.](images/orderparameter.png){#fig:mfeqs width='80%'}

![Phase diagram in the space $\gamma \times \beta\nu$. A phase transition separates an ordered from a disordered phase as signaled by the value of the order parameter $m$. Here, the value of $\varepsilon$  was $0.1$ and as it grows towards $0.5$ the ordered phase decreases.](images/phasetransition.png){#fig:phasem width='80%'}

We can also change variables in our mean field probability distribution. This is useful because the inner representation $\student_i$ is not readily accessible to the experimentalist, whereas the opinion field $h$ in some applications might be:

\begin{align}
    P(h) &= \int \measure{\student}\ \delta\left( \frac{1}{\sqrt{K}} \student \cdot \xx - h \right) P_{\mathrm{MF}}(\student) \\
    &= \frac1C\ (1 - h^2)\ \left[ \varepsilon + \left(1 - 2\varepsilon\right) \Phi \left( \frac{r}\gamma h + \frac{m}{\gamma}\sign h  \right) \right]^{\beta \nu \gamma^2}
\end{align}

Now we can compute other interesting order parameters, such as the variance $v_m = \mean{h^2} - \mean{h}^2$. The computational results we found are presented in [@fig:mfvariance].

![Variance of the field $h$ with respect to selected values of $\beta\nu$ and $\gamma$](images/variance.png){#fig:mfvariance width='90%'}

As we vary $\varepsilon$ to values greater than $0.1$ the only change found was that the critical line appeared at larger values of $\beta\nu$ and $\gamma$, therefore being more difficult to polarize ($m \neq 0$) the mean field society.

[@fig:phasem] shows that, for fixed $\beta$, the phase border can be crossed by increasing the value of $\gamma$. This seems paradoxical, since larger $\gamma$ is associated to a larger norm of the covariance matrix. The explanation of this comes from the fact that the gradient of the evidence, which determines the dynamics in [@eq:upstudent], increases in magnitude with $\gamma$ when both agents concur. That is, high $\gamma$ agents rely not only on the novelty brought by disagreement but also learn from corroborating examples. For low $\gamma$, agents learn primordially from the novelty of disagreement. Therefore high $\gamma$ agents will keep on learning even after there is agreement on an issue, resulting in a more ordered society. This same behavior was found in previous works when performing Monte Carlo simulations on non-simplified (that is, without the MF approximation) versions of this model.
