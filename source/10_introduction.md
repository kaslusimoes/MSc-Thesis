
# Introduction {#sec:introduction}

The MaxEnt result depends on the entropic learning dynamics, so I guess it should be first (because that way I can start explaining prob, maxent, and then show the model). Maybe I should present some MCMC simulations as well? Let's see. Then I can talk about the choice of the Zeitgeist, and present extremism framework. For that I'll need to explain why I defer the MaxEnt model to the ViSuJeCa one. I guess that should be okay. Finally I can recover some distrust/antiferromagnetism with the last MF model. Yay!

Other things I have that I think do NOT fit in this thesis:

- graphical comparison between line segments and  tightness (same thing I "showed" Peter L and Gatsby);
- unfinished comparison between beta and tightness for different countries and political affiliations (maybe..? :sadface );
- unfinished analysis of the convincement problem

For the line segment/tightness thing, recall that I'm using the `moralmatrix.csv` file, not the whole `MFQ.csv` data. Also, instead of using some "arbitrary" 2 vectors from the data by hand, I can calculate the correlation matrix of it and take the 2 eigenvectors with greatest eigenvalues, can't I?

OLD ABSTRACT:

We model a society of agents who interact in pairs by exchanging for/against opinions about issues using a perceptron algorithm. Employing a maximum entropy analysis one can describe the interacting pair as a dynamics along the gradient of the logarithm of the evidence. This permits introducing an energy like quantity and an approximate global hamiltonian. Knowledge of the expected value of the hamiltonian is relevant information for the state of the society, inducing a canonical distribution by maximum entropy. We study the phase diagram of the society using a mean field approximation which indicate a phase transitions separating ordered and disordered phases depending on the society parameters.
