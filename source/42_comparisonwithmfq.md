
## Comparison with MFQ opinions data {#sec:comparisonmfq}

From the Moral Foundations Questionnaire [see @Graham2009], one can obtain the empirical values for the $\{\student_i\}_{i=1}^N$, vectors in some $5$ dimensional space. The agents $\{\student_i\}$ are going to be the answers each respondent gave to the questionnaire. The issue $\zeitgeist$ remains to be defined, also from the data, but we must make an additional hypothesis. For example, one can take the Zeitgeist as the mean value of liberals, or the mean value of conservatives, or even the sum of this two last vectors. In [@Vicente2014] they chose $\zeitgeist$ as the mean vector of Conservative respondents.

We test 4 different hypothesis for $\zeitgeist$: mean of conservatives $\zeitgeist_C$, mean of liberals $\zeitgeist_L$, mean of moderates $\zeitgeist_M$ and mean of all agents $\zeitgeist_T$. All the vectors were normalized $\|\zeitgeist\| = 1$.

![The 4 different Zeitgeist hypothesis considered. All extracted from data.](images/4zeitgeists.png){#fig:zeitgeists width='75%'}

We can see clear from [@fig:zeitgeists], as [@Graham2009] already mentioned, that one can differentiate between Conservatives and Liberals by the different relevance each group gives to each moral dimension. Liberals tend to give more importance to Harm and Fairness whereas Conservatives give almost equal importance to all $5$ dimensions, attributing slightly more relevance to Ingroup, Authority and Purity dimensions. Additionally, the mean vector for the whole population tends more towards the Liberals due to a greater number of respondents with this political affiliation.

One last important fact to consider is that "Moderates" can be seen as a kind of transition between "Liberals" and "Conservatives", as expected.
<!-- In fact, although not being shown here, the mean vectors of the $7$ political affiliations can be arranged in a linear dispersion along a curve, with $\mathit{pa} = 1$ ("Very Liberal") and $\mathit{pa} = 7$ ("Very Conservative") at the extremes of this curve. -->

The different posteriors of $g$ due to each choice of those Zeitgeists are presented in [@fig:posteriorgamma]

![Different posteriors for $g$ given the chosen Zeitgeist and the political affiliation of the responses $\{h\}$. Since the distributions are sharp, for most points the error bars cannot be distinguished from the mean values, so we can use the latter to describe the posteriors](images/posteriorgamma4zeitgeists.png){#fig:posteriorgamma width='95%'}

One can see that the choice of the Zeitgeist matters greatly when searching for a distribution $P(h|g)$ that matches the data. More specifically, one can see from [@fig:posteriorgamma] that the same group, for example $\mathit{pa} = 1$, can have different values of $g$ for different choices of the Zeitgeist.

<!-- Linux command: `montage -mode concatenate -geometry 1210x850 -tile 2x2 ph-*.png 4groupsph.png` -->
![The histogram of opinions $h$ for a given _pa_ group considering an specific Zeitgeist and the corresponding best fit of the model $P(h|g)$ given the data](images/4groupsph.png){#fig:4groupsph width='90%'}

Looking at [@fig:probh] we can observe that the model fits the data better for higher values of $g$, which come naturally from the posterior with more moderate Zeitgeists, which do not align exactly with Conservatives nor with Liberals.

From the analysis presented above, we would like to propose $2$ ideas for future models:

1. The model's parameter $g$, more than a characterization of the Liberal-Conservative spectrum, is a description of the extremism of a society. As a given political group has moral beliefs $\student_i$ more aligned with the chosen Zeitgeist, more concentrated they will become and more "extremist" (with less room for a change of opinion) they will behave;
2. The choice of the Zeitgeist - the question being asked to the agents - is a highly relevant characteristic of the model presented, and is not a feature we can extract from the Moral Foundations data alone. One must have additional hypothesis, which ought to be validated by other means.
