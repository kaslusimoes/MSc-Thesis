
## Entropy and Inference {#sec:entropy}

Entropy has always been an elusive concept to physicists [@Jaynes1965; @Jaynes1980]. Starting with [@Jaynes1957; @Jaynes1957a] an understanding of entropy as a tool for making inferences about the world has began. After some developments [@Shore1980; @Skilling1988] in the theory of Maximum Entropy (ME), now we seem to be reaching a point in which people can derive more complex physics theories as an application of the ME formalism [@Caticha2017a].

### Entropy as an Inference Tool

The method to find the proper tool to update our inferences under situations of incomplete information will be the same as done with probabilities in [@sec:probability]: we start describing the problem at hand, we impose some _desiderata_ to our method, and then try to prove the existence of some method abiding by those _desiderata_. Luckily this path was already staged by many before us on the references given before, so we shall only describe the constraints desired and the tool that follows.

1. We want the method to be universal;
2. We want the update to be minimalist;
3. We want locality in the space of configurations;
4. We want invariance of labels (change of variables);
5. We want independent systems to be describes evenly together or separately

Once again we follow [@Caticha2017b]. We shall not present the full derivation due to its length and it not being the focus of this dissertation. The result obtained is:

> In order to _update_ from a probability distribution $q(\xx)$ when new information arrives and forces a review of beliefs, one must choose the distribution $p(\xx)$ that maximizes the functional $$S[p|q] = - \int \mathrm{d}\xx\ p(\xx) \log\left( \frac{p(\xx)}{q(\xx)} \right) \label{eq:maxentropy} $$ subject to the constraints imposed by new information.

Note there is a philosophical statement when we say that ME is a method of _updating_ probability distributions, or beliefs. Doing that we exclude the possibility of having a situation of "information emptiness". There is always a background, a context, over which we perform our inference. This is a non-trivial but central characteristic of the method developed.

### Statistical Mechanics from Maximum Entropy {#sec:statmech}

Now, with ME at our disposal, one can obtain several interesting results as corollaries to different informational settings. We show one for its relevance in physics: _Statistical Mechanics_.

We must first define what is our informational context and space of discourse, then we must impose the constraints to our update and this will lead us to the ME theory relevant to our inference. [@Caticha2012] provides good arguments based in Hamiltonian dynamics to propose that the prior distribution $q(\xx)$ must be an uniform distribution over the phase space.  <!-- The space of discourse is that of a phase space $z=(q, p)$, as usual in mechanical systems. -->

Now we can proceed with the calculation of the family of  _canonical distributions_. Consider a set of functions $f_a(\xx)$ known to provide relevant about the system one wants to study. We happen to know the expected values of those functions: $\langle f_a(\xx) \rangle = F_a$. Maximum Entropy tells us that we must maximize the function $S$ with respect to distribution $p$ taking that piece of information in consideration:

$$ \mathcal{L}[p|q] = - \int\mathrm{d}\xx\ p(\xx) \log \left( \frac{p(\xx)}{q(\xx)} \right) + \alpha \left( \int\mathrm{d}\xx\ p(\xx) - 1\right) + \sum_a \lambda_a \left( \int\mathrm{d}\xx\ p(\xx) f_a(\xx) - F_a \right) $$ {#eq:entropyforcanonical}

where the constraint for $\alpha$ comes from the fact that probability distributions must be properly normalized.

Variational calculus arguments lead us into

$$ p(\xx) = \exp \left(-1 -\alpha - \sum_a \lambda_a f_a(\xx) \right) $$ {#eq:canonical1}

The Lagrange multipliers $\alpha, \{\lambda_k\}$ still need to be calculated taking in account the constraints imposed. We proceed with the normalization constraint:

\begin{align}
    1 &= \int\mathrm{d}\xx\ p(\xx) = \int\mathrm{d}\xx\ \exp \left(-1 -\alpha - \sum_a \lambda_a f_a(\xx) \right) \\
    &= \exp(-1 -\alpha)\ \int\mathrm{d}\xx\ \exp \left(-\sum_a \lambda_a f_a(\xx) \right)
\end{align}

From which we obtain the definition of a _partition function_, or the normalization, of our distribution:

$$ Z(\lambda) \equiv \exp(1 + \alpha) = \int\mathrm{d}\xx\ \exp \left(-\sum_a \lambda_a f_a(\xx) \right) $$ {#eq:canonicalpartionfunction}

and now we can rewrite [@eq:canonical1] in a more familiar way:

$$ p(\xx) = \frac1Z \exp \left(-\sum_a \lambda_a f_a(\xx) \right) $$ {#eq:canonical2}

For the other constraints, we do:

\begin{align}
    F_a &= \langle f_a \rangle = \frac1Z \int\mathrm{d}\xx\ f_a \exp \left(-\sum_a \lambda_a f_a(\xx) \right) \\
    &=  \frac1Z \int\mathrm{d}\xx\ \left( - \Del{\lambda_a} \right) \exp \left(-\sum_a \lambda_a f_a(\xx) \right) = \frac1Z \left( - \Del{\lambda_a} \right) Z(\lambda)
\end{align}

This lead us into the following relation:

$$ F_a = - \Del{\lambda_a} \log Z $$ {#eq:canonicalexpectedvalue}

A final result we want to expose about canonical distributions is the relation we obtain when we insert the maximum entropy distribution $p$ back into the definition of entropy $S$ ([@eq:maxentropy], remembering the uniform prior):

\begin{align}
    S_{\mathrm{MAX}} &= - \int\mathrm{d}\xx\ p(\xx) \log p(\xx) \\
    &= - \int\mathrm{d}\xx\ \frac1Z \exp \left(-\sum_a \lambda_a f_a(\xx) \right) \left[ -\log Z -\sum_a \lambda_a f_a(\xx) \right]
\end{align}

Therefore, we find the usual Legendre transform used in Statistical Mechanics.

$$ S(F) = \log Z(\lambda) + \lambda \cdot F $$ {#eq:legendretransform}

We have done the calculations for a generic distribution from the canonical family. Particularizing to the typical case in which one uses only information regarding the Hamiltonian $\langle \hamiltonian \rangle = E$, the results above translate into:

\begin{align}
    & p(\{q_i, p_i\}) = \frac1Z \exp \left( - \beta \hamiltonian(\{q_i, p_i\}) \right)&  \\
    & Z = \int\prod_i\mathrm{d}q_i\mathrm{d}p_i \exp \left( - \beta \hamiltonian(\{q_i, p_i\}) \right) & \\
    & E = -\Del{\beta} \log Z\qquad S = \log Z + \beta E&
\end{align}
