
# Introduction {#sec:ch:introduction}

How can we integrate the fact that sometimes people agree on their moral valuations with one another, and other times disagree? One can naturally imagine two alternative situations: the first one, in which the whole society agrees on what is considered correct, and another one in which chaos reign, because it cannot seem to reach a consensus. How is it then that our societies maintain a considerable level of disagreement while still retaining some organization? How can there be a coexistence of a variability of opinions and still there be a cohesiveness that enables a society to thrive and develop? In times when we are haunted with cultural and political wars between people with different opinions, one cannot but wonder which are the relevant variables that describe this cohesiveness and richness of cultures in a society, and what one can expect about times to come.

Several people have investigated those questions, each with their different background and perspective into the difficult problem of understanding human organization in society. Those people came most notably from areas such as sociology, anthropology and psychology, but more recently also physics and neuroscience. We present some of the ones that influenced the research shown in this dissertation.

On the social sciences, one of those works we build solidly upon is the line of research from Jonathan Haidt and collaborators on social psychology of morality [see e.g. @Haidt2001; @Haidt2010; @Haidt2007].

It is also important to consider existing experiments and models from neurophysiology and cognitive neuroscience, specially findings about what drives human behaviour or how to categorize and understand human learning.

Both areas - social psychology and neuroscience - are deeply related, to the extent that [@Greene2009] says: "[the field of cognitive neuroscience of morality] provides a set of useful entry points into the broader problems of complex cognition and decision making". If one wants to understand the brain and human behavior, one ought to attack this problem knowing both endeavours.

For the past few decades we have seen several quantitative contributions to approach the social sciences. A constant throughout the majority of the enterprises has been the use of tools and ideas from physics (most specially statistical mechanics). This has led some to name this variety of concepts and results as _sociophysics_. One can check [@Castellano2009] for a review of those.

Here we mention some of the ideas that influenced the field and our research:

- Schelling's models for segregation [@Schelling1969; @Schelling1971];
- Axelrod's models for dissemination of culture [@Axelrod1997] and for the evolution of cooperation [@Axelrod1981];
- Caticha and Vicente's models on social consensus [@Caticha2011], morality and political affiliation descriptions [@Vicente2014; @Caticha2015] and community formation [@Alves2016]

This dissertation fits in the line of work from this last point. The tools used are those of bayesian and entropic inference, statistical physics and machine learning. Bayesian and entropic learning because we are dealing with situations of incomplete information; statistical mechanics because it is a natural extension of the first two and provides a toolbox of methods developed by physicists throughout the years (such as mean field, Laplace's method to find a partition function, among others) to solve the problems encountered; and machine learning to inform our choice of models and our understanding of learning from a quantitative perspective.

As mentioned at the beginning of this section, we are interested in the interplay between aggregation and dispersion forces in society, and how this gives rise to the social and cultural diversity we find in our societies. This being a broad question, we narrow it down to some topics:

- first, we describe a model for agents learning from their peers using entropic inference, and propose a mean field analysis for a society of this agents. This model will give us interesting results, such as a phase transition between ordered and disordered phase in the organization of the opinions of the agents, but it has many extraneous features that hinder our analysis with available data from Haidt and collaborators;
- then, we proceed to a simpler model, which still captures the relevant characteristics of the first model, while being more manageable to compare with experimental data. This will give us more intuition into the kind of predictions we can make about agents and their organization in communities (more specifically, in the data, in political affiliations). The most relevant characterizations we make are of extremists agents and of the choice of the discussed question in the society;
- finally, we proceed to a model which assumes the existence of two adversarial communities. Here we are interested in the coexistence of those communities in face of conflict and delimitation of different "cultures".

<!-- We also pursue a better understanding of the coexistence of different political groups, how they talk with each other (or do not talk), and how one can characterize and describe different political affiliations in quantitative models.  -->

Since this line of research is pioneering, the number of questions abound and many times it is difficult to narrow down specific motives and hypothesis. A good research, in that scenario, may not always answer a comprehensible and well delimited question about the system being modeled, but instead leverage understanding in what variables and descriptions better capture the phenomena under observation. For that reason, although we do not presume to be called giants, we believe that sometimes one must do this "foraging"[^schroedinger] task to support future work of greater minds.[^newton]

[^newton]:

    "If I have seen further it is by standing on the shoulders of Giants." [@Newton1675]

[^schroedinger]:

    "I can see no other escape from this dilemma (lest our true aim be lost for ever) than that some of us should venture to embark on a synthesis of facts and theories, albeit with second-hand and incomplete knowledge of some of them, and at the risk of making fool of ourselves. So much for my apology." [@Schrodinger1944]
