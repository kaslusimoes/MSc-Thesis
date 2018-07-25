
## Model 1 {#sec:results:model1}
<!-- Consensus formation in a Mean Field Society -->

Although we could not find analytical solutions to [@eq:mfeqs] in [@sec:methods:model1], they can be solved numerically by an iterative process as follows: let  $u=(m,r,\zeta)$ , then the set of equations is of the type $u= F(u)$, where $F$ is given by [@eq:mfeqs]. An initial value $u_0$ is chosen and we iterate the map below until reaching a fixed point.

$$ u_t = (1-\alpha) u_{t-1}+ \alpha F(u_{t-1}) $$ {#eq:updatemap}

Since convergence was not a problem, no attempt at optimizing $\alpha$ was made. The result can be checked by choosing different starting points $u_0$. The results are shown in [@fig:mfeqs].

![Solutions of [@eq:mfeqs]. Top: The normalization of the MF distribution $\zeta$ as a function of the social pressure and number of neighbors ($\beta \nu$). Bottom: Magnetization $m$. The other order parameter $r$ has a similar behavior to $m$.](images/orderparameter.png){#fig:mfeqs width='80%'}

It can be seen that there is a phase transition depending on the parameters $\beta\nu$ and $\gamma$. We investigate further this transition by looking at the phase diagram in [@fig:phasem].

![Phase diagram in the space $\gamma \times \beta\nu$. A phase transition separates an ordered from a disordered phase as signaled by the value of the order parameter $m$. Here, the value of $\varepsilon$  was $0.1$ and as it grows towards $0.5$ the ordered phase decreases.](images/phasetransition.png){#fig:phasem width='60%'}

[@fig:phasem] shows that, for fixed $\beta$, the phase border can be crossed by increasing the value of $\gamma$. This seems paradoxical, since larger $\gamma$ is associated to a larger norm of the covariance matrix (that is, a higher uncertainty in [@eq:multigaussian]). The explanation for this comes from the fact that the gradient of the evidence (also called _modulation function_ $F_{mod}$), which determines the dynamics in [@eq:upstudentfinal], increases in magnitude with $\gamma$ when both agents concur. This is shown in [@fig:modfunc]

![Modulation function/gradient of the evidence for different values of $\gamma$. The noise $\varepsilon$ is fixed at $0.2$, but changing to other values between $0.$ and $0.5$ does not change qualitatively the figure](images/modfunc.png){#fig:modfunc width='75%'}

High $\gamma$ agents rely not only on the novelty brought by disagreement but also learn from corroborating examples. For low $\gamma$, agents learn primordially from the novelty of disagreement. Therefore high $\gamma$ agents will keep on learning even after there is agreement on an issue, resulting in a more ordered society. This same behavior was found in previous works [see e.g. @Alves2015;@Caticha2015;@Alves2016]

In [@sec:results:model2] we show that another parameter, $g$, has a similar role in defining the "corroboration level" of a society, and we will give another interpretation closely related to this one.

We can also change variables in our mean field probability distribution. This is useful because the inner representation $\student_i$ is not readily accessible to the experimentalist, whereas the opinion field $h$ in some applications might be:

\begin{align}
    P(h|\varepsilon, \gamma, \beta\nu) &= \int \measure{\student}\ \delta\left( \frac{\student \cdot \zeitgeist}{\sqrt{K}}  - h \right) P_{\mathrm{MF}}(\student) \\
    &= \frac1C\ (1 - h^2)\ \left[ \varepsilon + \left(1 - 2\varepsilon\right) \Phi \left( \frac{r}\gamma h + \frac{m}{\gamma}\sign h  \right) \right]^{\beta \nu \gamma^2}
\end{align}

where $m$ and $r$ remain the expected values defined before: $m = \langle h \rangle$ and $r = \langle \sign h \rangle$. Now we can also compute other order parameters, such as the variance $v_m = \mean{h^2} - \mean{h}^2$.

The computational results we found are presented in [@fig:probh] and [@fig:mfvariance].

![Probability distribution $P(h|\varepsilon, \gamma, \beta\nu)$ for a set of values for the model's parameters.](images/probh.png){#fig:probh width='75%'}

![Variance of the field $h$ with respect to selected values of $\beta\nu$ and $\gamma$](images/variance.png){#fig:mfvariance width='75%'}

We note that the distribution $P(h|\varepsilon, \gamma, \beta\nu)$ ([@fig:probh]) has a discontinuity in $h=0$ due to the $\sign h$ term, which is a source of complication when trying to fit empirical data. This is one of the main reasons we discuss a different model in [@sec:methods:model2; and @sec:results:model2]

A last point to observe is that higher values of $\varepsilon$ shift the phase boundary in [@fig:phasem] upwards. This is because there is more noise in the interaction between agents therefore it is more difficult to establish agreement. However, for values $\varepsilon \geq 0.5$, the noise is large enough that the system yields no stable solution. This is the first idea that led us to pursue a different model in [@sec:methods:model3; and @sec:results:model3] with explicit antiferromagnetic interactions.
