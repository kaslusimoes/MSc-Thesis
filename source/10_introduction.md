
# Introduction {#sec:introduction}

Here I shall present some introduction to the topics being worked on this dissertation. No idea about hat should be those yet

Well, I have some results about conservatioliberalism vs. extremism that are nice to include somewhere (Felippe convinced me). I also have the MF result presented at the MaxEnt 2017, which definitely I must include (some result :yay). Lastly, I have the "new" MF antiferromagnetic model that I'm solving, which can be nice to include as well.

The MaxEnt result depends on the entropic learning dynamics, so I guess it should be first (because that way I can start explaining prob, maxent, and then show the model). Maybe I should present some MCMC simulations as well? Let's see. Then I can talk about the choice of the Zeitgeist, and present extremism framework. For that I'll need to explain why I defer the MaxEnt model to the ViSuJeCa one. I guess that should be okay. Finally I can recover some distrust/antiferromagnetism with the last MF model. Yay!

Other things I have that I think do not fit in this thesis:

- graphical comparison between line segments and  tightness (same thing I "showed" Peter L and Gatsby);
- unfinished comparison between beta and tightness for different countries and political affiliations (maybe..? :sadface );
- unfinished analysis of the convincement problem

For the line segment/tightness thing, recall that I'm using the moralmatrix.csv file, not the whole data MFQ.csv. Also, instead of using some "arbitrary" 2 vectors from the data by hand, I can calculate the correlation matrix of it and take the 2 eigenvectors with greatest eigenvalues, can't I?


ABSTRACT IDEAS:

This project deals with the study of dynamics of learning in a society. We approach mainly two points: the first one is to understand how the question being discussed by the agents in a given society influences the outcomes of the discussion, and how this reflects in the overall organization of the group; the second point is dedicated to study the possible different interactions between opposing parties and to which extent disagreement affects the overall cohesiveness of the society, having the discussed question fixed.

For that we employ techniques from statistical mechanics, machine learning and probability theory. Both agent-based models and typical statistical physics ones can be constructed with Maximum Entropy methods, and the results are interpreted with the usual tools from statistical mechanics and thermodynamics.

On this dissertation, we present two different studies:

- The first one analyzes the importance of the questions being discussed by the agents in a given society, comparing with data from Moral Foundation group of [@Graham2009];
- The second study is a bipartite society model in which we have ferromagnetic interactions inside each group, and possibly antiferromagnetic interactions between agents of the two groups.
