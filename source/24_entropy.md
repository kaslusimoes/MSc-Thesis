
## Entropy and Inference {#sec:entropy}

Entropy has always been an elusive concept to physicists [@Jaynes1965; @Jaynes1980]. Starting with [@Jaynes1957; @Jaynes1957a] an understanding of entropy as a tool for making inferences about the world has began. After some developments [@Shore1980; @Skilling1988] in the theory of Maximum Entropy (ME), now we seem to be reaching a point in which people can derive more complex physics theories as an application of the ME formalism [@Caticha2017a].

### Entropy as an Inference Tool

The method to find the proper tool to update our inferences under situations of incomplete information will be the same as done with probabilities in [@sec:probability]: we start describing the problem at hand, we impose some _desiderata_ to our method, and then try to prove the existence of some method abiding by those _desiderata_. Luckily this path was already staged by many before us on the references given before, so we shall only describe the constraints desired and the tool that follows.

1. We want the method to be universal;
2. We want the update to be minimalist;
3. We want locality in the space of configurations;
4. We want invariance of labels (change of variables);
5. We want independent systems to be describes evenly together or separately

Once again we follow [@Caticha2012; @Caticha2017b]. We shall not present the full derivation due to its length and it not being the focus of this dissertation. The result obtained is:

> In order to update from a probability distribution $q(x)$ when new information arrives and forces a review of beliefs, one must choose the distribution $p(x)$ that maximizes the function $S[p|q] = - \int \mathrm{d}x\ p(x) \log\left( \frac{p(x)}{q(x)} \right)$ subject to the constraints imposed by new information.

### Statistical Mechanics from Maximum Entropy

Now, with ME at our disposal, one can obtain several interesting results as corollaries to different information settings. We show one for its relevance in physics: statistical mechanics

TALK ABOUT CANONICAL DISTRIBUTIONS

TALK ABOUT UNIFORM PRIORS AND OTHER THINGS
