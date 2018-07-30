
## Probability Theory {#sec:probability}

Probability theory is often an underestimated tool in a scientist career. Much of the failure to see the importance of probability theory comes from an incorrect understanding of what it is.[^laplace] Therefore we present the outline of a derivation of the rules of probability and explain what they are meant to be and what one is meant to do with them.[^refderivation]

We begin by defining the problem at hand: we want a mathematical tool to reason in situations of incomplete information and that is an extension to Boolean logic. That is, we want a tool that incorporate the concepts of **True**, **False**, **and**, **or**, **not** and extend them to deal with inference settings in which we cannot be certain about the veracity or falsehood of assertions $a, b, \cdots$; we must be able to say whether some assertion is more "plausible" $\succ$ than another one or not.

Another necessary characteristic is that this tool has to work by default with variable contexts of information, otherwise we could not talk about "incomplete information". We denote this idea of "background information" by the backlash symbol "$|$", e.g. "$a|c$" means "consider the plausibility of assertion $a$ given that we know $c$ is true".

\newpage

The requirements above are only the ground construction of our "plausibilities" theory. So far we could have many tools fulfilling those. That is why we constrain our theory with a set of _desiderata_ (desires) that our method must also obey:

1. We want "plausibilities" to be _transitive_, that is, if $a|b \succ a|c$ and $a|c \succ a|d$, then it must follow that $a|b \succ a|d$;
2. We want that for every possible way of composing a given assertion the plausibilities of them all must be the same;
3. There must be 2 numbers $v_T$ and $v_F$, at first unknown, that represent the concepts of **True** and **False**, respectively; that is, $a|a = v_T$ and $a| \mathbf{not}\ a = v_F$;
4. There must be 2 functions $F$ and $G$, at first unknown, to represent the logical operators **and** and **or**.

As much as is may sound absurd, it can be proved [as is in fact done in e.g. @Cox2001; @Jaynes2003; @Caticha2012], that the rules of probability theory follow from these 4 _desiderata_.

To be more explicit, the rules are as follows:

\begin{align}
    & p(a | a ) = v_T = 1, \qquad  p( a | \bar{a}) = v_F = 0 \\
    & p(a + b|c) = p(a|c) + p(b|c) - p(ab|c) \\
    & p(ab|c) = p(a|c)p(b|ac) = p(b|c)p(a|bc) = p(ab|c) \label{eq:productrule}\\
    & p(a|c) + p(\bar{a}|c) = 1
\end{align}

and from these simple rules we can obtain all the other known relations for probabilities.

The advantage of the method we outlined is that, instead of describing a mathematical tool first and then trying to interpret and understand its function, we start by defining the purpose of our tool and from that the functioning comes naturally.

Now that we know that probabilities are the mathematical object describing plausibilities of assertions in face of incomplete knowledge, one can develop other insights using them.

For example, one can take the product rule ([@eq:productrule]) to prove the Bayes' rule:

$$ p(b|ac) = \frac{p(a|bc) p(b|c)}{p(a|c)} = \frac{p(a|bc) p(b|c)}{\sum_b p(a|bc) p(b|c)} $$ {#eq:bayesrule}

Let us illustrate: consider $b=$"it will rain today", the assertion we want to reason about; $c=$"I am in São Paulo in January, a city where there is on average 15 rainy days in that time of the year"[^saopaulo], our background information; and $a=$"there are dark clouds in the sky", the new experimental data to which we have access. In that informational scenario, a person using [@eq:bayesrule] most certainly would not leave the house without an umbrella. That is because the new data $a$ (provided we have background information $c$ ), produces further insight into assertion $b$, rendering $p(b|ac) > p(b|c)$.

This understanding of probability theory will permeate our assumptions and developments throughout this dissertation, and we also employ Bayes' rule in [@sec:entropicdynamics; @sec:models:model2].

[^laplace]:

    We agree with the vision Laplace had: "Probability theory is nothing but common sense reduced to calculation" [@Sivia1998]

[^refderivation]:

    We follow mostly the expositions by [@Caticha2012], built on work by [@Cox2001; @Jaynes2003 and several others]

[^saopaulo]:

    Taken from <https://en.wikipedia.org/wiki/S%C3%A3o_paulo#Climate>
