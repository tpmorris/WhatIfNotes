# Notes on *Causal inference: what if*, by Hernán and Robins (version at 10nov2019)
Tim Morris ‘’

## General comments/gripes
* Figures need to have captions! So many times you just want to flick back and can't remember which one you were thinking about.
* Nothing on mediation(?)
* Slightly odd notation: always *A* for exposure and *L* for covariates and sometimes other things; most literature uses *Z* and *X* respectively, with *U* for something unmeasured.
* Someone needs to go through the .tex file and fix some things. Some of the in-line equations are hard to read, especially when they run across a line-break; hyperlinks would be helpful;  they appear to be using an odd version of Computer Moden/Latin Modern that renders poorly on-screen (looks like Scientific Word output).
* They insist on always referring to unspecified people as 'she'/'her'/'he'/'him'. It seems to be a US thing to be uncomfortable with using 'they'/'them'.
* Someone commented 'This book doesn't use two words when 10 will do!' It is pretty verbose and I find some of the language imprecise.

## First chunk of comments relate to Nov 2020 version

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

In the vignette at the beginning of the chapter, they say 'in practice, the importance of randomised experiments for the estimation of causal effects is more limited'. I think this is an empirical statement, that people attempt causal inference from observational studies far more than randomised experiments and that this is often because they are studying things where you could not justify (or afford) randomisation.

3.1 Are they using *exchangeability* in the sense of full- or mean-? I forget what they said in the previous chapter!

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

3.5 The well-defined obesity intervention is interesting. The non-obese is well defined but the obese doesn't seem to be.

P35 typo: 'implictily'

Technical point 3.1 Again positivity is described as a probability but then discussed as data measure.

[I didn't finish this chapter but plan to]

## Chapter 4 *Effect modification*

4.1 Containts a heroic empirical statement: 'heterogeneity of the individual causal effects of treatment is often expected because of variations in individual susceptibilities to treatment'. I feel like this is written as though it's an empirical statement but is actually philosophical: How do we know that these individual susceptibilities exist? Surely that relies on being able to see counterfactual distributions.

Important (I think) defn. to remember: 'We only consider variables V that are not affected by treatment A as effect modifiers.'

4.2 The phrase 'one computes the causal effect' is the epitome of why the term 'causal effect' is ambiguous and unhelpful here. One computes an *estimate* – of a *causal estimand* using an *estimator*.

4.2 'An ideal randomised experiment with conditional randomisation'. I mean, a conditionally randomised (in the sense used in this book) trial ain't ideal - oxymoron sentence!

4.2 Referring back to table 2.2 is unhelpful here because you want to compare it to the new table (4.2).

4.2 It wasn't explained why the procedure to estimate conditional risks involved stratification then standardisation. I'm tired and it's late so I would have liked it spelled out. Everyone was similarly confused by this. Clemence suggested that doing 2) then 1) would have implied no interaction between L and V, where the procedure defined does not impose this restriction.

4.2 I really liked the distinction between *surrogate effect modifier* and *causal effect modifier*. Though surrogate is an odd term; effectively this is a *confounded* effect modifier.

Figure 4.1 Others have pointed this out, but the figures and tables contain no captions, and it's pretty weird to stumble across figure 4.1 like 'Uhm... what's this doing here? What does it mean?'

4.3 'First, if a factor V modifies the effect of treatment A on the outcome Y then the average causal effect will differ between populations with different prevalence of V.' This is true if it's a causal effect modifier but no a surrogate. Suppose for example that the prevalence of V is identical in a target population and the prevalence of the thing V is a surrogate for differs.

4.3 There is generally no such a thing as “the average causal effect of treatment A on outcome Y”, but “the average causal effect of treatment A on outcome Y in a population with a particular mix of causal effect modifiers.” I agree for most interpretible causal estimands but, to play devil's advocate, (without qualitative interaction) it could be argued that there is a scale on which the effect modification is 0; it's just not a scale people want to see summarised. That is, data could arise from a model with no effect modification but it appears to be present anyway.

4.3 Note - in the sentence quoted above (from P 45) there is a typo: 'no such *a* thing as'.
Also typo on P46 - 'trasported' should be 'transported'.

4.3 Gosh, I can't believe this section is called 'model free'. Like, there are so many 'that's just, like, your opinion man' assumptions that correspond to parametric restrictions. Like 'Therefore, as a general rule, it is more informative to report the (absolute) counterfactual risks'. From what I've read of Rothman, he writes strong and unjustified things, so justifying stuff like this by citing him is a bit rich.

Fine point 4.3 Oh look, more that's not model free! Here, they're arguing that non-collapsibility makes the odds ratio inappropriate as a causal estimand. Wrong! You can adjust and standardise to get a marginal odds ratio.

4.5 Why does ths subsection appear here? Doesn't appear to be related to effect modification and they don't talk about V. Same sort of thing in 4.6.

Fine point 4.3 Ruth pointed out that in some cases the odds ratio *is* the risk ratio. For example, in a case-control study you don't have to sample controls; you sometimes take a random sample from a population and then write your logistic regression. The odd thing is, the 'controls' can contain cases. So your logistic regression is actually estimating a risk ratio (despite being logistic regression)!! OMG I've learned something!

## Chapter 5 *Interaction*

I really didn't find any time to read this one.

Discussion was generally very negative about the chapter. Overly verbose. Confusing. Couldn't tell what the practical implications are. But some interesting discussions on some of the other stuff from earlier chapters! Particularly positivity. Karla persuaded people that non-positivity is always an estimationn problem. If you have structural non-positivity, you have a poorly defined question and it's an identification problem. So by the time you get to 'data you could collect', it's always an estimation problem and a statistical issue.

## Chapter 6 *Graphical representation of causal effects*

This chapter is pretty well-trodden ground for those of us who have read about DAGs before. I preferred the way this was done in *Book of Why* e.g. the series of puzzles, but hey, it's clear here (and there were other infuriating things in *Book of Why*). Just a bit weird how they talk about so many things; it makes it harder to focus on any one (e.g. SWIG, FCISTG)

'Causal DAGs are of no practical use unless we make an assumption linking the causal structure represented by the DAG to the data obtained in a study'. I suspect they mean this, but they are also of practical use for considering the structure of the data that might arise in studies of different designs e.g. 'If I designed a study in this way then my causal structure would look like DAG 1; if I designed it in that way then it would look like DAG 2. Can I estimate my estimand with either, just one or neither?'

Technical point 6.1 the Markov factorisation formula switches without warning from random variables *V* to their realisations *v*. Is this intentional, i.e. linking to the data actually obtained from the study? If so, why write *V* previously?

6.2 Typo in final sentence: says 'conditionally' and should say 'conditional'.

6.3 Seems strange to use the word *predict* in 'when we already have information on B, does information about A improve our ability to predict Y?'

6.3 Oh gosh I don't like the whole square-box convention to represent conditioning. Surely this is not a DAG any more? It was such a relief when Pearly didn't do this in *Book of Why*.

6.3 Why are they talking about random variability as a source of association? They're going to say 'random confounding' later as a causal concept aren't they... ugh.

6.4 I didn't follow the sentence 'Therefore, our choice of counterfactual theory in Chapters 1-5 did not really privilege one particular approach but only one particular notation.'

6.4 'Regardless of the notation used...' Graphs don't have a way of encoding positivity, do they? In fact, they can have arrows where there is non-positivity (see https://twitter.com/JessGeraldYoung/status/1204403763341070336 where Jess Young told me these are necessary).

Fine point 6.2 typo: I'm not sure what it was supposed to say but 'exist a setting represented by Figure 6' doesn't make sense. Is the word *exist* just there by mistake?

6.5 'We say that there is systematic bias when the data are insufficient to identify -- compute -- the causal effect even with an infinite sample size.' Identifiability is not estimability and being able to compute an effect is an estimation (not estimability) problem! More foreshadowing that they're going to come in with something about non-systematic bias and probably random confounding. Ugh.

6.5 Are they using 'consistency' in its statistical sense here or in the causal sense? Are they the actually the same thing? (They say that lack of [unconditional] bias implies consistency)

6.5 I like the simple insight for d-separation that we get bias if we ignore a common cause or condition on a common effect.

6.5 'Susceptibility to bias oof randomised experiments may not be obvious'. I mean, if you target an estimand that isn't identified through randomisation, this *is* very obvious. MSc students at LSHTM never have a problem identifying this.

6.6 I like the optimism of the classification that 'everyone receives either high or normal quality of care', lol!

6.6 Why is there so much about surrogate effect modification here? Is this making any new points?

## Chapter 7 *Confounding*

7.2 'requires adjustment for the variables *L* via standardisation or reweighting'. Why are they so married to these two? Why not just 'requires adjustment for the variables *L*'?

7.2 'The backdoor criterion does not answer questions regarding the magnitude or direction of confounding'. Causal graphs do not tell us about the magnitude or direction of anything, do they?

Fine point 7.1 'Biases that are not large enough to affect the conclusions of the study may be safely ignored in practice'. This feels a bit of a cop-out, like saying 'we just want to know if there is any effect and which direction it goes in'.

7.3 typo 'In such setting we define': *setting* should be *settings*

7.5 I skipped SWIGs because they're a new idea to me, I'm tired and the kids are ill and waking up. Aim to come back to it later.

7.6 There is a paragraph about a critic who says 'confounding' not having raised a criticism because 'all observational studies are subject to confounding'. I may habe misunderstood, but there are some situation where we have an 'observational' study but no unmeasured confouding. E.g. Sarah Walker's MSM analyses which were based on the fact that the reasons for decisions were always recorded and were always based on some also-recorded measurement. There is confounding but none unmeasured. So I regard the criticism that there may be unmeasured confounding as 'scientific' rather than 'logical' (as the authors put it).

Technical point 7.3 typo: 'In practice. the method[...]' should be a comma after 'practice'.

Technical point 7.3: isn't there a much shorter do-calculus version of this in the *Book of Why*?

## Chapter 8 *Selection bias* (should be called *Conditioning bias*!)

Starts off by calling a collider situation 'selection bias'. I wonder why not call it a collider bias? Hopefully I'll find out.

Figures 8.4-8.6 are misaligned with the text that refers to them.

Technical point 8.1 Oh dear. I was just smoothly going through this chapter until this point. Model-free, huh? It's not that HRs are so great; it's that, if you're goinng to criticise them, make sure you're not doing it in a straw-man way. This is confusing HR with period-specific RR and ignoring what they are. Ok, I won't rant here.

8.4 I don't understand the thing 'If ignoring random variability bothers you'. They haven't ignored it; they've estimated an estimate and not tried to quantify the uncertainty.

8.4 Why do they call missing data 'censoring'? This subsection starts off about complete case analysis, and here it doesn't matter whether it's censoring (a missing outcome) or just an unmeasured covariate. Fortunately they do come to the estimand if all data were observed.

8.4 I like 'To eliminate selection bias for the effect of treatment A, we need to adjust for confounding for the effect of treatment C.' (Think about missing outcome Y in a trial where missingness depends on covariates *X* but not treatment *Z*.)

In the discussion we talked about the term 'selection bias'. This is confusing because (as the authors note) many people use this term to describe who is selected into a study. We agreed that 'conditioning bias' would be a better title for this chapter!

## Chapter 9 *Measurement bias*

First few pages are basically contriving scenarios in which certain arrows exist (or not). E.g. retrospective recall of exposure where the outcome is dementia implies an arrow from Y to U_A.

Typo: Fine point 9.1. The term *A–Y association* (and variants), it's not a compound adjective: should be an en-dash (–), not a hyphen (-).

9.3 The first could be a sentence (we already know it well). I read it three times just to see if I was missing something new before realising it was a recap. Also not sure why they keep writing the causal risk ratio out rather than just stopping after writing 'causal risk ratio'. It's been said so many times already!

9.3 'The particular choice of terminology–unmeasured confounding versus bias due to mismeasurement of the confounders–is irrelevant for practical purposes.' That's fine when we're thinking non-parametrically about identification. But in reality, it's not quite like an unmeasured confounder, is it? The fact that you can't block the back door path doesn't mean you can't partially/mostly block it.

9.4 Ok, this section is a serious problem. Their premise seems to be that we want to know P(Y<sup>a=1</sup>=1)-P(Y<sup>a=0</sup>=1). This is misguided and all subsequent mistakes follow from this. In real trials, we are almost always interested (their notation) in P(Y<sup>z=1</sup>=1)-P(Y<sup>z=0</sup>=1). 'Pragmatic trials' are entirely predicated on this. To put it in terms of figure 9.1, the arrow is from A\*<-A to A\*->A. And A\* does not receive any arrows (though A may do). The point is that we want to know about the causal effect of the treatment decision (what the ICH E9 addendum calls the *treatment policy estimand*). We want to use the estimate of a causal effect to make decisions about treatment ('what is the causal effect of this decision *A\** on outcome?') E.g. if half of people adhere to the decision *z=1* and we want to make a decision about an intervention, the effect for *a=1* is not of interest. Now, if you start with their premise, that your estimand relates to the treatment actually received, everything they say is ok, but it's rarely relevant; it almost always relates to something abstract: essentially, it can't help with decision making. I wonder why they think 'we want' the effect of receiving treatment. This doesn't seem questioned or justified.

Their thing about exclusion-restriction: I wonder what they would make of the pre-exposure prophylaxis trials, where they had one trial with an exmphatic result that was double-blind but were worried that, in the wild, knowledge of the efficacy of it would change behaviour: people who knew they were getting something effective would behave differently. The second trial was then open label and evaluated this. Apparently the authors would not view this as valid.

Fine point 9.3 This is a good point. We talk about the intention to treat *principle* here, which relates better to the estimand. The point is that intention to treat as an estimand isn't 'who you include' but what you target. By saying 'pseudo ITT', it makes it seem as though ITT is about who you include.

'Second, suppose the effects are monotonic'. In this example, ibuprofen alone is not equally effective. The strategy of ibuprofen-plus-handling of side-effect is equally effective. The question is, in this hypothetical trial, why was the 'easy palliation' not used? I'm utterly baffled by their logic!

'Third' is again ridiculous. Why is it different for adverse events? Unless you know that you will adhere, the ITT adverse events are what you should be interested in (expectation under decision 1 vs. 0). Sure, when you know you adhere, you want to know about some adherence-based estimand, but not at the point that it actually matters i.e. when you are making a decision.

## Comments from now are on the Feb 2020 version

## Chapter 10 *Random variability*
By this point I can safely assert that the book would be better without all the chapter prefaces about 'one's looking up'!

10.1 Nice to see the word estimand appear! Thought it's a strange notion that the 'estimand' exists only when we have a sample from a population. To everyone else it is one of the two things they have previously referred to as 'causal effect'. In describing the example they write down the same formula \widehat{Pr}[Y=1|A=a] for both estimator and the estimate - this is confusing. The estimate is simply a number: 7/13.

10.1 What is the point of the sentence 'More specifically, we say that 7/13 is a *point estimate*'? Is it just saying that it's not a *variance estimate*?

10.1 There's this sentence: 'In the absence of systematic biases, statistical theory allows one to quantify this confidence in the form of a confidence interval around the point estimate.' This is nice and simply written but could mislead, e.g. consider post-selection inference.

10.1 It's ambiguous whether the clause '(exact or large sample) standard error' means that these are two names for one thing or two alternative options. The latter is intended but you only know this if you already knew!

10.1 They use the term *valid* is used to mean *confidence valid* rather than *randomisation valid*. Great to see what they mean stated though.

10.1 I wonder why they define their use of *bias* as ability to centre a valid Wald interval rather than 'Unbiased means E[theta-hat]-theta=0?'

10.3 typo - 10.3 scenario 1 is in italics and scenario 2 is roman.
People struggled with the difference here. It makes sense to me but people kept getting stuck on 

10.4 The discussion of the trial with a chance imbalance is a bit polemic. Clearly matters aren't as simple as they seem.

## Chapter 11 *Why model?*
Note -- I've started writing Stata scripts to go alongside my reading. I took the scripts from the website and made it a bit more 'stata-like' (I think the code authors are Sas users).
However, Stata Press are willing to work with authors even where they are not publishing the book. Would be good for the authors to approach them.

This chapter is good because it's more careful and less cavelier than previous ones (with minor exceptions). It also sets up well for the later chapters, e.g. will focus on assumed parametric models being correct. This understanding will help me not to get distracted in later chapters.

11.1 That really took a long time to write what could have taken 2 sentences!

11.2 This section is fine but it seems weird not to link it to some of the technical concepts of chapter 10.

11.3 Interesting that they talk about non-parametric estimators in terms of restrictions on the functional form | observed values of *A*. 

Fine point 11.2 'In frequentist statistical inference, probability is defined as frequency.' Errr... no it isn't. This needs correcting.

Technical point 11.1 is nice.

