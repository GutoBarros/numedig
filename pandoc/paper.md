# Political Institutions and Economic Development
Sebastian Barfort

## Section 1 
At least two problems prevent clear identification of the effect of institutions on economic growth: first, we lack a clear understanding of what constitutes an *institution*. Relying on North's (1990) *humanly devised constraints* definition of formal and informal rules does not give us much in terms of meaningful empirical identification. Second, we have no accepted theory of endogenous institutional change, and thus no unified growth model in which we can evaluate different institutions. In a recent paper, Jones and Romer (2009, p. 4) note that 

> we follow the example of the neoclassical model and treat institutions the way the neoclassical model treated technology, as an important force that enters the formalism but which evolves according to a dynamic that is not explicitly modelled. Out on the horizon, we can expect that current research on the dynamics of institutions and politics will ultimately lead to a simple formal representation of endogenous institutional dynamics as well.



## Section 2
A simplified textbook approach to causality looks something like the following:\footnote{Notation as in Angriest and Pischke (2009)} for simplicity, assume our institutional treatment variable, $D$, can only take two values: $D_i \in \{0,1\}$ 
for all $i$. Thus, we can write the potential outcome for individual/municipality/nation (from now on: individual) $i$. For each individual in the population we observe either $Y_{1i}$, or $Y_{0i}$, bot never both. Thus, we need to engage in a thought experiment; we simply ask ourselves what the effect would have been on individual $i$ had she not been treated, and vice versa. The following highlights the counterfactual nature of a causal effect: Because statistical inference requires a certain quantity of observations, it is impossible to measure causal effects at the individual level. Researchers therefore focus on average causal effects. The two most frequently used in the literature is the Average Treatment Effect (ATE): $E[Y_{1i}-Y_{0i}]$ and the Average Treatment Effect on the Treated (ATET): $E[Y_{1i}-Y_{0i}
|D_i=1 ]$, where $E[\cdot]$ is the well known expectations operator. Note that the latter can be rewritten as

$E[Y_{1i}-Y_{0i}|D_i=1 ]=E[Y_{1i}
|D_i=1 ]-E[Y_{0i}
|D_i=1 ]$

Equation (2) illustrates the counterfactual aspect of causal inference: The first term captures the expected value of the treated, whereas the second term asks what the expected value of the treated would be *had they not been treated*. The fact that the counterfactual term is (by definition) never observed has caused a lively debate about the validity of causal inference among statisticians, most prominently represented by Dawid's Popperian argument that 


> counterfactual theories are essentially metaphysical, 

and it has inspired Przeworski (2006) to ask whether 

>the science of comparative politics is possible?



