
## Model 2 {#sec:results:model2}
<!-- Comparison with MFQ opinions data -->

Recall that in [@sec:methods:model2] we had two important results: [@eq:mfvisujeca], which describes the model's main prediction $P(h|\tilde{\beta})$; and [@eq:posteriorgamma] which enables us to estimate the parameter $\tilde{\beta}$ given an histogram of opinions $\{h_i\}$ for a given population _pa_ and a fixed Zeitgeist $\zeitgeist$.

The Moral Foundations Questionnaire[see @Graham2009] has answers given from subjects to $30$ different questions in a scale from $0$ to $5$ assessing the importance the attribute to a certain statement aligned with one of the moral foundations. Because of this format, we had to perform a first processing on the data. We grouped the responses a subject gave to a moral foundation into a mean value of the answers aligned with that foundation. After that we normalized the $5$-vector of an individual to $1$. From that preprocessed data from the MFQ we could then obtain values for the moral vectors $\{\student_i\}_{i=1}^N$.

To have a dataset comparable to the model - which predicts only the distribution of opinions $h$ of the agents -, we must make an additional hypothesis on how to choose the issue $\zeitgeist$ also from MFQ. Then the inner product between the chosen $\zeitgeist$ and $\{\student_i\}$ give us $\{h_i\}$. In [@Vicente2014] they chose $\zeitgeist$ as the mean vector of Conservative respondents. Here we test 4 different hypothesis: mean of Conservatives $\zeitgeist_C$, mean of Liberals $\zeitgeist_L$, mean of Moderates $\zeitgeist_M$ and mean of all agents $\zeitgeist_T$. All the vectors were normalized $\|\zeitgeist\| = 1$.

![The 4 different Zeitgeist hypothesis shown for comparison. All extracted from MFQ's respondents data.](images/4zeitgeists.png){#fig:4zeitgeists width='70%'}

We can see from [@fig:4zeitgeists], as mentioned in [@Haidt2007], that one can differentiate through all $7$ political affiliations (although here we show only Conservatives, Moderates and Liberals) by looking at the relevance each group attributes to each moral dimension. Liberals tend to give more importance to Harm and Fairness whereas Conservatives give almost equal importance to all $5$ dimensions (slightly more to Ingroup, Authority and Purity dimensions). Additionally, the mean vector for the whole population tends somewhat more towards the Liberals due to a greater number of respondents with this political affiliation (_pa_).

The different estimates for $\tilde{\beta}$ for each of the Zeitgeists presented above were evaluated using [@eq:posteriorgamma] and can be seen in [@fig:posteriorgamma].

![Different posteriors for $\tilde{\beta}$ given the chosen Zeitgeist and the political affiliation of the responses $\{h\}$. Since the distributions are sharp, the error bars in the $y$-axis fall inside the markers (which are centered around the mean values)](images/posteriorgamma4zeitgeists.png){#fig:posteriorgamma width='75%'}

One can note that the choice of the Zeitgeist matters greatly when searching for a distribution $P(h|\tilde{\beta})$ that matches the data. More specifically, one can see from [@fig:posteriorgamma] that the same group, for example $\mathit{pa} = 1$ (the Very Liberals), can have different values of $\tilde{\beta}$ for different choices of the Zeitgeist.

The comparison of the fit $P(h|\tilde{\beta})$ with the histograms $\{h_i\}$ can be seen at [@fig:4groupsph]. This figure provides further insight: the model describes more accurately the data when the estimate values for $\tilde{\beta}$ are higher. This is probably because back in [@eq:mfvisujeca] we assumed positive opinions $h>0$, so we selected a model that better describes a consensus situation. The lower $\tilde{\beta}$ values, on the other hand, describe communities with a greater variance of opinions and less consensus.

Another information we can extract from the figures shown is that lower $\tilde{\beta}$ values appear when we choose Zeitgeists of Conservatives or Liberals, while the fit using Zeitgeists of Moderates or of the Total Population yield predictions more comparable with the data. We believe that - being the Conservatives and Liberals far from each other on the _pa_ spectrum - choosing a Zeitgeist along one of those groups forces the other group to have widely spread opinions. It is a geometric feature of MFQ's data.

<!-- Linux command: `montage -mode concatenate -geometry 1210x850 -tile 2x2 ph-*.png 4groupsph.png` -->
![The histogram of opinions $h$ for a given _pa_ group considering an specific Zeitgeist and the corresponding best fit of the model $P(h|\tilde{\beta})$ given the data](images/4groupsph.png){#fig:4groupsph width='100%'}

From the analysis presented above, we propose $2$ ideas for future models:

1. The choice of the question being discussed by the agents, the Zeitgeist, is a highly relevant characteristic of the model presented, and is not a feature we can extract from the Moral Foundations data alone. One must have additional hypothesis, which ought to be validated by other means.
2. The model's parameter $\tilde{\beta}$, more than a characterization of the Liberal-Conservative spectrum, as was thought before, is a description of the extremism of a community. As a given political group has moral beliefs $\student_i$ more aligned with the Zeitgeist being discussed, more gathered around the issue they will become and more "extremist" (with less room for a change of opinion) they will behave; __REESCREVER YODA__


<!-- One can also note a resemblance between this model's $\tilde{\beta}$ and last model's $\gamma$. Both describe the cohesiveness of a society/community THINK MORE ABOUT THIS -->
