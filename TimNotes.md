# Notes on *Causal inference: what if*, by Hernán and Robins (version at 10nov2019)
Tim Morris ‘’

## General comments/gripes
* Nothing on mediation(?)
* I wish they would learn Latex properly! It's super hard to read some of the in-line equations, especially when they run across a line-break, hyperlinks would be helpful, and they appear to be using an odd version of Computer Moden/Latin Modern that does not render well on-screen.

## Introduction
Interesting that they talk about 'when data are collected on each individual in a population' straight away. I guess this rules out many econometrics things that consider a different level (though actually many of the ideas in this book would I think apply to cluster level causalilty, e.g. the Greek Gods each representing a billion people; still, it's nice that they don't oversell the generality of their work).

## Chapter 1 *A definition of causal effect*
Cool way to go about things by instantly talking in terms of counterfactuals. The conventional start would be 'Suppose we observe this association. Can we believe it is causal? What about confounding?' etc., so I find this refreshing. It means everyone is thinking in their terms from the off, rather than having to twist around from the more conventional/intuitive way of thinking.

I *think* they make no distinction between potential outcomes and counterfactuals, so Pearl's 'rung 2' and 'rung 3' in *Book of Why*. We discussed this (again) because we really struggled with the distinction in Book of Why. One point is that both potential outcomes are unobserved but one counterfactual may be observed.

Note that they use some fairly different language to what 'we' use (When I say 'we', is this the clinical trials community? Or UK/European medical research?). They use *causal effect* in the sense that the rest of us use *causal estimand*. (They later define estimand to mean 'the true value of a parameter'.) To them, *effect* is apparently less ambiguous than it is to us. I have criticised this term because it's a bit of a wild-card term for estima-; that is, it can be used to mean estimand, estimator or estimate. Their use becomes clear in e.g. 'As a consequence, "the causal effect of heart transplant on Zeus's outcome" is not well-defined when...'

Why I wonder is the convention that people write down the estimand for an avg. causal effect as E[Y^1]–E[Y^0] (*i.e.* a difference rather than just a function of the two)? Perhaps just easier to write and less mathy/intimidating, even though it doesn't explicitly mean a difference.

Potential outcomes for the Greek Gods example are written as deterministic. This means that the individual causal effects are (–1, 0, 1). They talk later about these being stochastic, with each person's PO being a realisation from a distribution.

Technical point 1.1 really interests me and is what I was hoping to get from the chapter. Key sentence: '*In general, a population causal effect can be defined as a contrast of any functional of the marginal distributions of counterfactual outcomes under different actions or treatment values.*' It's great to have this definition clearly written out. It also isn't jutified. I wonder where it comes from and how much this definition has been probed. To me, it is unclear why the word *marginal* appears.

The definition in technical point 1.1 permits the HR as a population causal effect: avg. HR to time t can be written as log[S^1(t)]/log[S^0(t)]. But they later claim that it cannot (I looked ahead to where they discuss HRs; their argument contradicts this one and lacks any rigour). I have a special interest in this one. Also in section 1.3 they say 'scale will depend on the goal of the inference'. Again, the HR *might* be appropriate (though I agree it usually is not).

1.5 talks about *association* in terms of means, but earlier they had talked about causation as *any* functional of the marginal counterfactual distribution. I assume they intended to describe association in the same generality.

## Chapter 2 *Randomised experiments*

This chapter starts with a mention of randomised trials but then goes into 'conditionally randomised experiments' as a way to talk about exchangeability, standardisation and IPW. I like much of what they say but it's a very weird chapter title!

The description of an *ideal randomized exeriment* says 'full adherence to the assigned treatment over the duration of the study'. Me: *IDEAL TO WHOM!* lol.

I really like the 'imagine what would have happened if the research assistants had misinterpreted our instructions'. It's a great way to explain exchangeability. Also nice to have the brief 'Y^a independent of A for all a'.

Question: Is 'causal' exchangability exactly the same as statistical exchangability? I think say so. People seemed to agree at the discussion.

The whole 'conditionally randomised experiment' is weird. I mean, it's fine because I realise they want to talk about conditional exchangeability and standardisation, but it's an odd thing to put in a chapter on randomised experiments. The reason I worry is that people without any background knowledge of trials frequently take this as a description of what trials are like and how they are/should be done. Would be good to have a clear disclaimer about that, or a more appropriate chapter title.

The description of standardisation is nice, though they don't seem to actually justify using it (they previously said 'the scale will depend on the goal of inference' but seem very wedded to marginal scales).

## Chapter 3 *Observational studies*

In the vignette at the beginning of the chapter, they say 'in practice, the importance of randomised experiments for the estimation of causal effects is more limited'. I think this is an empirical statement, that people attempt causal inference from observational studies far more than randomised experiments and that this is often because they are studying things where you could not justify randomising.

3.1 Are they using *exchangeability* in the sense of full- or mean-? Can't remember what they said in the previous chapter!

3.1 Again, they introduce a phrase without explaining or justifying it. 'Well-defined-interventions'. I'd like to understand why this is used in their informal characterisation of an observational study as a randomised experiment. (Ok, they do go into it later on - signpost this?)

3.1 Did anyone else see Oliver Maclaren's paper on identifiability vs. estimability? It's *hard* but formalises some statistical intuition. Anyway, Hernan & Robins seem to think *identifiability* and *estimability* are synonymous.

3.1 I didn't understand why condition 1 was called 'consistency' here. Wasn't this to do with not being affected by others' treatment values in chapter 1? Or is that just part of consistency. You could have a well-defined intervention that is also affected by others, surely?

3.1 Condition 3: 'the probability of receiving every value of treatment conditional on L is greater than zero, i.e., positive' - the word 'every' is ambiguous (the probability of receiving *every* value of treatment is usually 0!) – should be *any* value [relevant to estimation of a specific causal estimand].

3.2 discussion of exchangeability jumps between talking about L being balanced within treatment and treatment being balanced by L. Could confuse?

3.2 Still finding it odd that they continually refer back to 'conditionally randomised experiments' as though that's a thing people do! In my head I'm calling them 'conditionally randomised *thought* experiments'.

Fine point 3.2 Glad that they have revisited crossover trials - now the assumptions in the previous chapter make more sense: apparently they weren't previously assuming the order was randomised! Given this discussion, I wonder if they would regard Balaam's design (http://www.jstor.org/stable/2528460) as able to estimate individual causal effects, which does produce data on r_i both for A=1 and A=0? The design facilitates makes various types of carryover testable (deacribed nicely in Jones and Kenward's book on crossover trials). Is this like testing whether an estimand can be regarded as individual or average? Surely not. [We discussed this and Amy pointed out that we don't have r_i in Balaam's design; we have \bar{r}. So it weakens the 'no carryover of any form' assumption but does not mean we are estimating individual-level causal estimands.]

3.2 Interesting that they talk about being able to assume conditional exchangability 'within strata'. This leads to e.g. 2^p strata, where D-separation would surely say 'condition on the p variables'.

3.2 Clemence pointed out that it says there is a fine point that elucidates the link between confounding and exchangeability, but the fine poinit it references is actually the one on crossover trials. Is this left over from a previous version? We couldn't locate the fine point on confounding and exchangeability.

3.3 Nitpicking but positivity definition should also include the causal contrast of interest. Suppose there are 3 possible values of A and we are comparing 2 of them. Probability needs to be positive only for these two.

3.3 The P(...)>0 definition of positivity is interesting. The way they discuss it is by reference to the observed data, which doesn't correspond to a probability. I think the observed data gives you a type of non-positivity, but this is not *structural*. Which one do we need and when?

3.4 Their discussion of consistency seems close to unit-treatment additivity. At this stage I don't understand why, for example, the *precise* form of treatment matters. What if my specification of the superscript *a* is 'where doctors use their favoured heart transplant technique'? I don't  believe that the causal effect is identical for that technique but I am interested in this average causal effect (an average over the distribution of techniques actually used), which has a counterfactual distribution.

3.4 I find the obesity example more compelling as not corresponding to a well-defined intervention. Being obese at 40 doesn't! For me, a well-defined intervention is one that you could write down in a protocol (specifying which parts are fixed). The inconsistency 
Aah, the Zeus example on P33 is great for understanding why they are talking about this! Wow, they really set me up well here!

3.4 I also really like the notion of 'sufficiently well-defined interventions'. This is great BUT 'sufficiently' is different to different people and does lead to intense arguments in the design of RCTs. This is a really important distinction between randomised and observational studies that I didn't appreciate until now. What they say about this is really interesting (and pragmatic) - I like it.

3.4 Clemence made the great point on 'sufficiently well-defined interventions', that the *lack of intervention* (i.e. A=0) also needs to be sufficiently well-defined, not just A=1! Again, this is something that is argued about a huge amount at the design stage in the RCT world.

3.4 There is a (positive IMO) practical implication of changing the causal question. Suppose we somehow answer the original causal question on obesity. Unless obesity is an intervention, answering this question is a stub. The thing we need to know is what we could manipulate to cause the counterfactuals in a future population to be better than they would have been in that population without this manipulation. Without this, causal inference is a bit 'so what?' It just tells you what you would need to change with something you can manipulate.

Fine point 3.3. The 'possible worlds' notion surely doesn't rely so much on the assumption of no interference. You can contrast a functional of the (possible) counterfactual distributions where interference occurs. (Was this part of *consistency* in ch 1?)

[I didn't finish this chapter but plan to]

## Chapter 4 **
