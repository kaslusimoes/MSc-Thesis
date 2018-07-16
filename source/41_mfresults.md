
## Computational evaluation to Mean Field theory {#sec:mfresults}

On this section we present the solutions to [@sec:meanfield]. Although we could not find analytical solutions to those equations, they can be solved numerically by an iterative process as follows: let  $u=(m,r,\zeta)$ , then the set of equations is  of the type $u= F(u)$. An initial value $u_0$ is chosen and the map

$$ u_t=(1-\alpha) u_{t-1}+ \alpha F(u_{t-1}) $$ {#eq:updatemap}

is iterated. Since convergence did not pose us as a problem, no attempt at optimizing $\alpha$ was made. The result can be checked by choosing different starting points $u_0$, for example with a fixed-point relaxation method. The results are shown in [@fig:mfeqs].

![Solutions of [@eq:mfeqs]. Top: The normalization of the MF distribution $\zeta$ as a function of the social pressure and number of neighbors ($\beta \nu$). Bottom: The magnetization $m$. The other order parameter $r$ has a similar behavior to $m$.](images/orderparameter.png){#fig:mfeqs width='80%'}

It can be seen that there is a phase transition depending on the parameters $\beta\nu$ and $\gamma$. We investigate further this transition by looking at the phase diagram in [@fig:phasem].

![Phase diagram in the space $\gamma \times \beta\nu$. A phase transition separates an ordered from a disordered phase as signaled by the value of the order parameter $m$. Here, the value of $\varepsilon$  was $0.1$ and as it grows towards $0.5$ the ordered phase decreases.](images/phasetransition.png){#fig:phasem width='80%'}

[@fig:phasem] shows that, for fixed $\beta$, the phase border can be crossed by increasing the value of $\gamma$. This seems paradoxical, since larger $\gamma$ is associated to a larger norm of the covariance matrix. The explanation of this comes from the fact that the gradient of the evidence, which determines the dynamics in [@eq:upstudentfinal], increases in magnitude with $\gamma$ when both agents concur. That is, high $\gamma$ agents rely not only on the novelty brought by disagreement but also learn from corroborating examples. For low $\gamma$, agents learn primordially from the novelty of disagreement. Therefore high $\gamma$ agents will keep on learning even after there is agreement on an issue, resulting in a more ordered society. This same behavior was found in previous works [see e.g. @Alves2015;@Caticha2015;@Alves2016]
 <!-- when performing Monte Carlo simulations on non-simplified (that is, without the MF approximation) versions of this model. -->

We can also change variables in our mean field probability distribution. This is useful because the inner representation $\student_i$ is not readily accessible to the experimentalist, whereas the opinion field $h$ in some applications might be:

\begin{align}
    P(h) &= \int \measure{\student}\ \delta\left( \frac{1}{\sqrt{K}} \student \cdot \xx - h \right) P_{\mathrm{MF}}(\student) \\
    &= \frac1C\ (1 - h^2)\ \left[ \varepsilon + \left(1 - 2\varepsilon\right) \Phi \left( \frac{r}\gamma h + \frac{m}{\gamma}\sign h  \right) \right]^{\beta \nu \gamma^2}
\end{align}

Now we can compute other interesting order parameters, such as the variance $v_m = \mean{h^2} - \mean{h}^2$. The computational results we found are presented in [@fig:mfvariance].

![Variance of the field $h$ with respect to selected values of $\beta\nu$ and $\gamma$](images/variance.png){#fig:mfvariance width='90%'}

A last point to note is that higher values of $\varepsilon$ shift the phase boundary in [@fig:phasem] upwards. This is because there is more noise in the interaction between agents therefore it is more difficult to establish agreement. However, for values $\varepsilon \geq 0.5$, the noise is large enough that the system yields no stable solution. This is the first idea that led us to pursue a different model in [@sec:mfantiferromagnetic;@sec:mfantiresults] with explicit antiferromagnetic interactions, 
