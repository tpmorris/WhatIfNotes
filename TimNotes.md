# Notes on *Causal inference: what if*, by Hernán and Robins
Comments are initially on the version of 10nov2019, but updated as time passed (noted in the doc when the book was updated).

Tim Morris | Notes from my reading and from discussions with LSHTM Med Stats book club

Comments below simply follow our reading of the book and should refer to the portion they relate to.

## General (but minor) comments

* Figures need to have captions! So many times you just want to flick back and can't remember which one you were thinking about because there is no caption.
* Nothing on mediation. We wondered why.
* To some of us, the notation is odd: always *A* for exposure and *L* for covariates and sometimes other things; most literature I've ever seen uses *Z* and *X* to denote exposure and covariate/s respectively, with *U* for something unmeasured. However, I think *A* and *L* is a well established convention.
* Some of the in-line equations are hard to read, especially when they run across a line-break; hyperlinks would be helpful; appears to use an odd version of Computer Moden/Latin Modern that renders poorly on-screen (looks like Scientific Word output).
* *Scripts* are referred to as *programs* throughout. It's not ambiguous but is wrong and may annoy programmers.
* Stata Press are willing to work with authors even where they are not publishing the book. Would be good for the authors to approach them as the Stata code is not Stata-like at all and will confuse Stata users.
* They always refer to unspecified people as 'she'/'her'/'he'/'him'. It seems to be a US thing to be uncomfortable with just using 'they'/'them' for a notional person whose pronouns don't matter for the example.
* Someone (anon) commented 'This book doesn't use two words when 10 will do!' It is pretty verbose. I found this distracting because, once you have got the point, you want to get past it.

## First chunk of comments relate to Nov 2020 version

## Introduction

Interesting that they talk about 'when data are collected on each individual in a population' straight away. I guess this rules out many econometrics things that consider a different level (though actually many of the ideas in this book would I think apply to cluster level causality, e.g. the Greek Gods each representing a billion people; still, it's nice that they don't oversell the generality).

## Chapter 1 *A definition of causal effect*

Really nice way to go about things by instantly talking in terms of counterfactuals. The conventional start would be 'Suppose we observe this association. Can we believe it is causal? What about confounding?' etc., so I/we found this refreshing. It means everyone is thinking in the authors' terms from the off, rather than having to twist around from a more conventional/intuitive way of thinking.

I *think* they make no distinction between potential outcomes and counterfactuals, Pearl's 'rung 2' and 'rung 3' in *Book of Why*. We discussed this (again) because we really struggled with the distinction in Book of Why. One point is that both potential outcomes are unobserved but one counterfactual may be observed. It would be nice for the authors to comment on this.

Note that they use some fairly different language to what we use (When I say *we*, I wonder what I actually mean. The clinical trials community? UK/European medical research?). They use *causal effect* in the sense that the rest of us use *causal estimand*. They later use *estimand* in the statistical sense of 'the true value of a parameter'.) *Effect* is apparently less ambiguous than it is to us. I have criticised this term because it's a bit of a wild-card term for estima-; that is, it can mean *estimand* or *estimate*, and every now and then *estimator*.

Why I wonder is the convention that people write down the estimand for an avg. causal effect as $E[Y^1]–E[Y^0]$ (*i.e.* a difference rather than just some contrast )? I would prefer to write it as 'a causal estimand is some contrast of $E(Y^1),E(Y^0)$ (marginal estimand) or $E(Y^1|X=x),E(Y^0|X=x)$ (conditional estimand). Is the '$-$' symbol just less mathy/intimidating, even though it doesn't explicitly mean a difference? Probably worth a fine point.

Potential outcomes for the Greek Gods example are written as deterministic. This means that the individual causal effects are (–1, 0, 1). They talk later about these being stochastic, with each person's PO being a realisation from a distribution. We liked this.

Technical point 1.1 really interests me and is what I was hoping to get from the chapter. Key sentence: '*In general, a population causal effect can be defined as a contrast of any functional of the marginal distributions of counterfactual outcomes under different actions or treatment values.*' It's great to have this definition clearly written out. It also isn't justified. I wonder where it comes from and how much this definition has been probed. To me, the presence of the word *marginal* is controversial (see e.g. my two definitions of causal estimands above) but otherwise it's useful.

The definition in technical point 1.1 permits the HR as a population causal effect: avg. HR to time $t$ can be written as $log[S^1(t)]/log[S^0(t)]$. But they later claim that it cannot (I looked ahead to where they discuss HRs; the argument contradicts this one, though I accept that the HR is in general a poor summary measure). I have a special interest in this one. Also in section 1.3 they say 'scale will depend on the goal of the inference'. Again, the HR *might* be appropriate (though I agree it usually is not).

1.5 talks about *association* in terms of means, but earlier they had talked about causation as *any* functional of the marginal counterfactual distribution. I assume they intended to describe association in the same generality.

## Chapter 2 *Randomised experiments*

This chapter starts with a mention of randomised trials but then goes into 'conditionally-randomised experiments' as a way to talk about exchangeability, standardisation and IPW. I like much of what they say but it's a very weird chapter title!

The description of an *ideal randomized exeriment* says 'full adherence to the assigned treatment over the duration of the study'. Me: *Ideal to whom!* lol.

I really like the 'imagine what would have happened if the research assistants had misinterpreted our instructions'. This is a *great* way to explain exchangeability. Also nice to have the brief $Y^a$ independent of $A$ for all $a$'.

Question: Is 'causal' exchangability exactly the same as statistical exchangability? I think say so. Oliver Maclaren talks about p-values as having a causal basis – perhaps this is exactly the point. People seemed to agree at the discussion.

The 'conditionally randomised experiment' idea is weird. I mean, it's fine because I realise they want to talk about conditional exchangability and standardisation, but it's an odd thing to put in a chapter on randomised experiments. The reason I worry is that people without any background knowledge of trials frequently take this as a description of what trials are like and how they are/should be done. Would be good to have a clearer disclaimer, or a more appropriate chapter title.

The description of standardisation is nice, though they don't seem to actually justify using it (they previously said 'the scale will depend on the goal of inference' but seem wedded to marginal scales).

## Chapter 3 *Observational studies*

In the vignette at the beginning of the chapter, they say 'in practice, the importance of randomised experiments for the estimation of causal effects is more limited'. I think this is an empirical statement, that people attempt causal inference from observational studies far more than randomised experiments and that this is often because they are studying things where you could not justify (or afford) randomisation.

3.1 Are they using *exchangability* here in the sense of full- or mean-? I forget what they said in the previous chapter!

3.1 Again, they introduce a phrase without explaining: 'Well-defined-interventions'. I'd like to understand why this is used in their informal characterisation of an observational study as a randomised experiment. (Ok, they do go into it later on – signpost this?)

3.1 Did anyone else see Oliver Maclaren's paper on identifiability vs. estimability [What can be estimated? Identifiability, estimability, causal inference and ill-posed inverse problems](https://arxiv.org/abs/1904.02826)? It's *hard* (I get lost) but formalises some statistical intuition. Anyway, Hernan & Robins seem to regard *identifiability* and *estimability* as synonymous here.

3.1 I didn't understand why condition 1 was called 'consistency' here. Wasn't this to do with not being affected by others' treatment values in chapter 1? Or is that just part of consistency. You could have a well-defined intervention that is also affected by others, surely? Think I've got this wrong.

3.1 Condition 3: 'the probability of receiving every value of treatment conditional on $L$ is greater than zero, i.e., positive' - the word 'every' is ambiguous (the probability of receiving *every* value of treatment is usually 0!) – should be *any* value [relevant to estimation of a specific causal estimand].

3.2 Discussion of exchangeability jumps between talking about $L$ being balanced within treatment and treatment being balanced by $L$. I've often wondered if it matters which way we think of it?

3.2 Still finding it odd that they continually refer back to 'conditionally randomised experiments' as though these are a thing people do! In my head I'm calling them 'conditionally randomised *thought* experiments' ;-)

Fine point 3.2 Glad that they have revisited crossover trials – now the assumptions in the previous chapter make more sense: apparently they weren't previously assuming the order was randomised! Given this discussion, I wonder if they would regard Balaam's design (http://www.jstor.org/stable/2528460) as able to estimate individual causal effects, which does produce data on r_i both for A=1 and A=0? The design makes various types of carryover testable (deacribed nicely in Jones and Kenward's book on crossover trials). Is this like testing whether an estimand can be regarded as individual or average? Surely not. Amy pointed out that we don't have r_i in Balaam's design; we have \bar{r}. So it seems to weaken the 'no carryover of any form' assumption but does not mean we are estimating individual-level causal estimands.

3.2 Interesting that they talk about being able to assume conditional exchangability 'within strata'. This leads to e.g. $2^p$ strata, where D-separation would just say 'condition on the p variables', which of course is stated in a non-parametric sense but makes you think about $p$ parameters (main effects) rather than $2^p$.

3.2 Clemence pointed out that it says there is a fine point that elucidates the link between confounding and exchangeability, but the fine point it references is actually the one on crossover trials. Is this left over from a previous version? We couldn't locate the fine point on confounding and exchangeability.

3.3 Nitpicking, but the positivity definition should also include the causal contrast of interest. Suppose there are 3 possible values of A and we are comparing 2. The probability needs to be positive only for the two in the contrast of interest.

3.3 The $P(…)>0$ definition of positivity is interesting. The way they discuss it is by reference to the observed data, which corresponds to a proportion, not to a probability. I think the observed data tells you something about non-positivity, but this is not *structural*. Which one do we need and when? Karla argued that positivity is really a statistical estimation issue, not a causal inference issue (unless you are asking an ill-posed question). But this isn't necessarily true: e.g. crossed-world counterfactuals are surely a conceptual issue.

3.4 Discussion of consistency seems close to unit-treatment additivity. At this stage I don't understand why, for example, the *precise* form of treatment matters. What if my specification of the superscript $a$ is 'where doctors use their favoured kidney transplant technique'? I don't  believe that the causal effect is identical for that technique but I am interested in this average causal effect (an average over the distribution of techniques actually used), which has a counterfactual distribution.

3.4 I find the obesity example more compelling as not corresponding to a well-defined intervention. Being obese at 40 doesn't! For me, a well-defined intervention is one that you could write down in a protocol (specifying which parts are fixed and which are left to nature).

Ah, the Zeus example on P33 is great for understanding why they are talking about this! Wow, they really set me up well here!

3.4 I also really like the notion of 'sufficiently-well-defined interventions'. This is great *but* 'sufficiently' is different to different people and does lead to intense arguments in the design of RCTs. This is a really important distinction between randomised and observational studies that I didn't appreciate until recently. We sit there with doctors arguing about what defines the treatment and what doesn't. What they say about this is really interesting (and pragmatic) - I like it.

3.4 Clemence made the great point on 'sufficiently well-defined interventions', that the *lack of intervention* (i.e. $A=0$) also needs to be sufficiently well-defined, not just $A=1$! Again, this is something that is argued about a huge amount at the design stage in the RCT world. I have less of a feel for discussions in the world of observational studies.

3.4 There is a (positive IMO) practical implication of changing the causal question. Suppose we somehow answer the original causal question on obesity. Unless obesity is an intervention, answering this question is a stub. The thing we need to know is what we could manipulate to cause (a functional of) the counterfactual distribution in a future population to be better than they would have been in that population without this manipulation. Without this, causal inference is basically 'so what?' It just tells you what you would need to change using something you can manipulate.

Fine point 3.3. The 'possible worlds' notion surely doesn't rely so much on the assumption of no interference, does it? You can contrast a functional of the (possible) counterfactual distributions where interference occurs. (Was this part of *consistency* in ch 1?)

3.5 The well-defined obesity intervention is interesting. Non-obese is well defined but obese doesn't seem to be.

P35 typo: 'implictily'

Technical point 3.1 Again positivity is described as a probability but then discussed as data measure.

## Chapter 4 *Effect modification*

4.1 Containts a heroic empirical statement: 'heterogeneity of the individual causal effects of treatment is often expected because of variations in individual susceptibilities to treatment'. I feel like this is written as though it's an empirical statement but is actually philosophical: How do we know that these individual susceptibilities exist? Surely that relies on being able to see counterfactual distributions.

Important (I think) defn. to remember: 'We only consider variables $V$ that are not affected by treatment $A$ as effect modifiers.'

4.2 The phrase 'one computes the causal effect' shows why the term 'causal effect' is ambiguous. One computes an *estimate* – of a *causal estimand* using an *estimator*.

4.2 'An ideal randomised experiment with conditional randomisation'. I mean, a conditionally randomised (in the sense used in this book) trial ain't ideal! I wrote a thread wondering about how we actually use conditional randomisation in trials: https://twitter.com/tmorris_mrc/status/1232268873359122432

4.2 Referring back to table 2.2 is unhelpful here because you want to compare it to the new table (4.2). Reproduce table 2.2 here?

4.2 It wasn't explained why the procedure to estimate conditional risks involved stratification then standardisation. I'm tired and it's late so I would have liked it spelled out. Everyone was similarly confused by this. Clemence suggested that doing 2) then 1) would have implied no interaction between L and V, where the procedure defined does not impose this restriction.

4.2 I really liked the distinction between *surrogate effect modifier* and *causal effect modifier*. Though surrogate is an odd term; effectively this is a *confounded* effect modifier.

Figure 4.1 Others have pointed this out, but the figures and tables contain no captions, and it's pretty weird to stumble across figure 4.1 like 'Uhm... what's this doing here? What does it mean?'

4.3 'First, if a factor $V$ modifies the effect of treatment $A$ on the outcome $Y$ then the average causal effect will differ between populations with different prevalence of $V$.' This is true if it's a causal effect modifier but not if it's a surrogate. Suppose for example that the prevalence of $V$ is identical in a target population and the prevalence of the thing $V$ is a surrogate for differs.

4.3 Important part of the books philosophy (IMO): 'There is generally no such a thing as “the average causal effect of treatment A on outcome Y”, but “the average causal effect of treatment $A$ on outcome $Y$ in a population with a particular mix of causal effect modifiers.' I agree for most interpretible causal estimands but, to play devil's advocate, (without qualitative interaction) it could be argued that there is some scale on which the effect modification is 0; it's just not a scale people want to see summarised. That is, data could arise from a model with no effect modification but it appears to be present anyway.

4.3 Note - in the sentence quoted above (from P45) there is a typo: 'no such *a* thing as'.
Also typo on P46 - 'trasported' should be 'transported'.

4.3 I'm surprised this section is called 'model free'. It seems a very blurry line. There are many 'that's just, like, your opinion man' assumptions that correspond to restrictions on parametric or semi-parametric models. Example: 'Therefore, as a general rule, it is more informative to report the (absolute) counterfactual risks'. Rothman tends to write strong and unjustified things so I don't believe it when I see that cited.

Fine point 4.3 That's not model free! They imply that non-collapsibility makes the odds ratio inappropriate as a causal estimand. But you can adjust and standardise to get a marginal odds ratio.

We had an interesting discussion about odds ratios here. Senn has this blistering comment ([Rare Distinction and Common Fallacy](https://www.bmj.com/rapid-response/2011/10/27/rare-distinction-and-common-fallacy)) on why risk ratios are only useful as an approximation to the odds ratio. The main point is that risks only count events, while odds count events and non-events. The interesting thing is, this is exactly why people who think in proportions dislike odds: one event changes both the numerator and the denominator. The odds is in itself a relative, not absolute, measure. So, a taxonomy:

- Risk difference is an absolute contrast of absolute measures

- Risk ratio is a relative contrast of absolute measures

- Odds ratio is a relative contrast of relative measures

- Odds difference… just kidding, but I bet Anders Huitfeldt has thought about it

Fine point 4.3 Ruth pointed out that in some cases the odds ratio *is* the risk ratio. For example, in a case-control study you don't have to sample controls; you sometimes take a random sample from a population and then write your logistic regression. The odd thing is, the 'controls' can contain cases. So your logistic regression is actually estimating a risk ratio (despite being logistic regression)! This is in her book on case-ctrl studies.

4.5 Why does this subsection appear here? Doesn't appear to be related to effect modification and they don't talk about V. Same sort of thing in 4.6.

## Chapter 5 *Interaction*

I really didn't find any time to read this one.

The group discussion was generally very negative about the chapter. Verbose but confusing. Couldn't tell what the practical implications are. But some interesting discussions on some of the other stuff from earlier chapters! Karla argued that non-structural non-positivity is a statistical estimation problem. Suggested that if you have structural non-positivity, you have a poorly defined question and it's more of an identification problem. So by the time you get to 'data you could collect', it's always an estimation problem and a statistical issue. (Tra and I eventually argued some counterexamples but I've forgotten them.)

## Chapter 6 *Graphical representation of causal effects*

The bit on causal DAGs well-trodden ground for those of us who have read about DAGs before. We preferred the way this was done in *Book of Why* with the series of fun puzzles, but hey, it's clear here (and there were many infuriating things in *Book of Why*). Just a bit weird how they talk about so many things; it makes it harder to focus on any one (e.g. SWIG, FCISTG)

'Causal DAGs are of no practical use unless we make an assumption linking the causal structure represented by the DAG to the data obtained in a study'. I suspect the authors would agree that causal DAGs are also of practical use for considering the structure of the data that *might* arise in studies of different designs e.g. 'If I designed a study in this way then my causal structure would look like DAG 1; if I designed it in that way then it would look like DAG 2. Can I estimate my estimand with either study, just one of them or neither?'

Technical point 6.1 the Markov factorisation formula switches without warning from random variables $V$ to their realisations $v$. Is this intentional, i.e. linking to the data actually obtained from the study? If so, why write $V$ previously? Actually I notice now that this has happened earlier e.g. $Y^{a=1}$

6.2 Typo in final sentence: says 'conditionally' and should say 'conditional'.

6.3 Seems strange to use the word *predict* in 'when we already have information on $B$, does information about $A$ improve our ability to predict $Y$?'

6.3 Oh gosh I don't like the whole square-box convention to represent conditioning. Surely this is not a DAG any more? It was a relief when Pearl didn't do this in *Book of Why*.

6.3 Why are they talking about random variability as a source of association? They're going to say 'random confounding' later as a causal concept aren't they...

6.4 I didn't follow the sentence 'Therefore, our choice of counterfactual theory in Chapters 1–5 did not really privilege one particular approach but only one particular notation.'

6.4 'Regardless of the notation used...' Graphs don't have a way of encoding positivity, do they? In fact, they can have arrows where there is non-positivity (see [here](https://twitter.com/JessGeraldYoung/status/1204403763341070336) where Young told me these are necessary).

Fine point 6.2 typo: I'm not sure what it was supposed to say but 'exist a setting represented by Figure 6' doesn't make sense. Is the word *exist* there by mistake?

6.5 'We say that there is systematic bias when the data are insufficient to identify -- compute -- the causal effect even with an infinite sample size.' Identifiability is not estimability and being able to compute an effect is surely an estimation (not estimability) problem! Is this going to end up as something about 'random confounding'?

6.5 Are they using 'consistency' here in its statistical sense or in the causal sense described earlier? Are they the actually related? (They say that lack of [unconditional] bias implies consistency)

6.5 I like the simple insight for d-separation that we get bias if we ignore a common cause or condition on a common effect.

6.5 'Susceptibility to bias of randomised experiments may not be obvious'. I mean, if you target an estimand that isn't identified through randomisation, this *is* very obvious. MSc students at LSHTM never have a problem identifying this.

6.6 I like the optimism of the classification that 'everyone receives either high or normal quality of care', lol!

6.6 Why is there so much about surrogate effect modification here? Is this making new points?

## Chapter 7 *Confounding*

7.2 'requires adjustment for the variables $L$ via standardisation or reweighting'. Why these two? Is this to do with their preference for marginal estimands? Why not just 'requires adjustment for the variables $L$'?

7.2 'The backdoor criterion does not answer questions regarding the magnitude or direction of confounding'. Causal graphs do not tell us about the magnitude or direction of anything, do they?

Fine point 7.1 'Biases that are not large enough to affect the conclusions of the study may be safely ignored in practice'. This feels a bit of a cop-out, like saying 'we just want to know if there is any effect and its direction'.

7.3 typo 'In such setting we define': *setting* should be *settings*

7.5 I skipped SWIGs because they're a new idea to me, I'm tired and the kids are ill and waking up. Aim to come back to it later.

7.6 There is a paragraph about a critic who says 'confounding' not having raised a criticism because 'all observational studies are subject to confounding'. I may have misunderstood, but there are some situations where we have an 'observational' study but no unmeasured confouding. E.g. Sarah Walker's MSM analyses (Robins was involved, perhaps a co-author) which were based on the fact that the reasons for decisions were always recorded by clinicians and always based on some also-recorded measurement. There is confounding but none unmeasured. So I regard the criticism that there may be unmeasured confounding as 'scientific' rather than 'logical' (as the authors put it).

Technical point 7.3 typo: 'In practice. the method[...]' should be a comma after 'practice'.

Technical point 7.3: isn't there a much shorter do-calculus version of this in the *Book of Why*?

## Chapter 8 *Selection bias* (should be called *Conditioning bias*!)

Starts off by calling a collider situation 'selection bias'. I wonder why not call it a collider bias? Hopefully I'll find out.

Figures 8.4-8.6 are misaligned with the text that refers to them.

Technical point 8.1 Oh dear. I was just smoothly going through this chapter until this point. Model-free? It's not that HRs are so great; it's that, if you're going to criticise them, don't do it in a straw-man way. This is confusing the HR with period-specific RR.

8.4 I don't understand the thing 'If ignoring random variability bothers you'. They haven't ignored it; they've estimated an estimate and not tried to quantify the uncertainty.

8.4 Why do they call missing data 'censoring'? This has a well-defined use in survival analysis. This subsection starts off about complete case analysis, and here it doesn't matter whether it's censoring (a missing outcome) or just an unmeasured covariate. Fortunately they do come to the 'if all data were observed' estimand.

8.4 I like 'To eliminate selection bias for the effect of treatment A, we need to adjust for confounding for the effect of treatment C.' (Think about missing outcome Y in a trial where missingness depends on covariates $X$ but not treatment $Z$.)

In the discussion we talked about the term 'selection bias'. This is confusing because (as the authors note) many people use this term to describe who is selected into a study. We agreed that 'conditioning bias' would be a better title for this chapter!

## Chapter 9 *Measurement bias*

First few pages are basically contriving scenarios in which certain arrows exist (or not). E.g. retrospective recall of exposure where the outcome is dementia implies an arrow from $Y$ to $U_A$.

Typo: Fine point 9.1. The term *A–Y association* (and variants), is not a compound adjective so should use an en-dash (–), not a hyphen (-).

9.3 The first paragraph could be a sentence (we already know it well). I read it three times just to see if I was missing something new before realising it was a recap. Also not sure why they keep writing the causal risk ratio out rather than just stopping after writing 'causal risk ratio'. It's been said so many times already!

9.3 'The particular choice of terminology – unmeasured confounding versus bias due to mismeasurement of the confounders – is irrelevant for practical purposes.' That's fine when we're thinking non-parametrically about identification. But in reality, it's not quite like an unmeasured confounder, is it? The fact that you can't block the back door path doesn't mean you can't partially/mostly block it.

9.4 This section is a serious problem for me. The premise seems to be that we want to know $P(Y^{a=1}=1)-P(Y^{a=0}=1)$. This is misguided and the subsequent discussion assumes that it is always true. In real trials, we are almost always interested (their notation) in $P(Y^{a*=1}=1)-P(Y^{a*=0}=1)$. 'Pragmatic trials' are entirely predicated on this. Even pharma care about this. In terms of figure 9.1, the arrow is $A^*->A$. And $A^*$ does not receive any arrows ($A$ does). The point is that we want to know about the causal effect of the treatment *decision* (what the ICH E9 addendum calls the *treatment policy estimand*). We want to use the estimate of a causal effect to make decisions about treatment ('what is the causal effect of this decision *A\** on outcome?') E.g. if half of people adhere to the decision $z=1$ and we want to make a decision about an intervention, the effect for *a=1* is not of interest. Now, if you start with their premise, and your estimand relates to the hypothetical strategy if everyone were to take treatment, everything they say is ok, but it's rarely relevant; it almost always relates to something abstract: essentially, it can't help with decision making. I wonder why they think 'we want' the effect of receiving treatment. This doesn't seem questioned or justified. This is about actionable estimands with intercurrent events: essentially, I would want their estimand iff there was some action that would correspond everyone receiving $A$ (for example if knowing that $A$ is effective based on study results caused people to adhere better), but usually there is no way to ensure this.

9.4 One final thing on this: people say 'they want to know the effect of the treatment $a$'. This doesn't actually distinguish between a hypothetical and principal stratification strategy for the estimand. Murray has this paper she always uses to say 'patients want adherence adjustment' (though reading the survey materials I'm unconvinced), but then chooses to interpret this as a hypothetical strategy; as a patient facing treatment, I think I would be more interested in a principal stratum strategy.

The thing about exclusion-restriction: I wonder what they would make of the pre-exposure prophylaxis trials, there was one trial with an exmphatic result that was double-blind but the investigators were worried that, in the wild, knowledge of the efficacy of it would change behaviour: people who knew they were getting something effective would behave differently. The second trial was then open label and evaluated this. Apparently the authors would not view this as valid.

Fine point 9.3 This is a good point. We talk about the intention to treat *principle* here, which relates better to the estimand. The point is that intention to treat as an estimand isn't 'who you include' but what you target. By saying 'pseudo ITT', it makes it seem as though ITT is about who you include.

'Second, suppose the effects are monotonic'. In this example, ibuprofen alone is not equally effective. The strategy of ibuprofen-plus-handling of side-effect is equally effective. The question is, in this hypothetical trial, why was the 'easy palliation' not used? I'm utterly baffled! There are very rarely situations in which trials do not allow this sort of thing.

'Third' is nuts. Why is it different for adverse events? Unless you know that you will adhere, the ITT adverse events are what you should be interested in (expectation under decision 1 vs. 0). Sure, when you know you adhere, you want to know about some adherence-based estimand, but not at the point that it actually matters i.e. when you are making a decision.

## Comments from now are on the Feb 2020 version

## Chapter 10 *Random variability*

By this point I can safely assert that the book would be better without all the chapter prefaces about 'one's looking up'!

10.1 Nice to see the word estimand appear! Thought it's a strange notion that the 'estimand' exists only when we have a sample from a population. To most people it means one of the two things the authors refer to as 'causal effect'. In describing the example they write down the same formula $\widehat{Pr}[Y=1|A=a]$ for both *estimator* and *estimate* - this is confusing. The *estimate* is simply a number: 7/13.

10.1 Why the sentence 'More specifically, we say that 7/13 is a *point estimate*'? Is it just saying that it's not a *variance estimate*?

10.1 There's this sentence: 'In the absence of systematic biases, statistical theory allows one to quantify this confidence in the form of a confidence interval around the point estimate.' This is nice and simply written but could mislead, e.g. consider post-selection inference.

10.1 It's ambiguous whether the clause '(exact or large sample) standard error' means that these are two names for one thing or two alternative options. The latter is intended but you only know this if you already knew!

10.1 They use the term *valid* is used to mean *confidence valid* rather than *randomisation valid* (Neyman's terms). Great to see what they mean stated though.

10.1 I wonder why they define their use of *bias* as ability to centre a valid Wald interval rather than the more direct $E[\hat{\theta}-\theta]=0$?

10.3 typo - 10.3 scenario 1 is in italics and scenario 2 is roman. People struggled with the difference here. It makes sense to me but people kept getting stuck and we discussed for a long time.

10.4 The discussion of the trial with a chance imbalance is a bit polemic. Clearly matters aren't as simple as they seem.

## Chapter 11 *Why model?*

Note -- I've started writing Stata scripts to go alongside my reading. I took the scripts from the website and made it a bit more 'stata-like' (I think the code authors must be Sas users).

However, Stata Press are willing to work with authors even where they are not publishing the book. Would be good for the authors to approach them.

This chapter is good because it's more careful and less cavelier than previous ones (with minor exceptions). It also sets up well for the later chapters, e.g. will focus on assumed parametric models being correct. This understanding will help me not to get distracted in later chapters.

11.1 That really took a long time to write what could have taken 2 sentences!

11.2 This section is fine but it seems weird not to link it to some of the technical concepts of chapter 10.

11.3 Interesting that they talk about non-parametric estimators in terms of restrictions on the functional form | observed values of *A*. 

Fine point 11.2 'In frequentist statistical inference, probability is defined as frequency.' Not convinced that this is a useful characterisation…

Technical point 11.1 is nice.

## Chapter 12 *IP weighting and marginal structural models*

This is a nice chapter and helped with things I was thinking about.

12.1 Uh-oh, looks like they're going to do change-scores rather than baseline adjustment. Gasp!

12.1 The counterfactual superscript is written as $a=1$; I think that should say $A=1$ (since lowercase $a$ is a realisation) shouldn't they?

12.2 Calling the weighted model 'saturated' feel disingenuous here. Consider the standardisation analogy. Then the mean function for confounders is clearly not saturated in their terms.

12.2 They don't explain the point about over-coverage of the robust variance estimator. I tried it using `teffects` in Stata and got a tighter confidence interval than they did in the book, (2.5, 4.4) rather than (2.4, 4.5), so I don't think that's what they mean. Saying 'use bootstrap because not all software does variance estimation right for all models' seems like odd advice.

12.3 It says 'heuristically, in the pseudo-population all individuals are included both under treatment and under no treatment'. I don't find this helps with intuition. They don't get counted twice by the estimator, do they? Surely it's clearer to say that we deliberately constructed a pseudo-population in which each individual has an equal probability (0.5) of treatment (or are there estimators that construct a pseudo-population in which everyone has the same $Pr(Z)$ not equal to 0.5?).

12.3 Using stabilised weights, they estimate weight gain is 3.4 (2.4, 3.5); I get 3.5 (2.5, 3.5) – this is not using my code but the code being distributed with the book. Straight after this, there's a sentence 'This is the same estimate we obtained earlier using the nonstabilized IP weights $W^a$ than the stabilized IP weights $SW^a$. I was confused by this. I think they just mean 'This is the same estimate we obtained earlier using the nonstabilized IP weights' (the estimate here *is* that based on the stabilised weights).

12.4 I didn't initially follow their definition of MSM, or the distinction between 'IPW' and 'a marginal structural model'. Helped when we discussed.

12.4 I cannot believe there could be any ambiguity in simply writing '$a^2$' rather than the sentence '$a^2=a×a$ is $a$-squared', which feels very patronising.

## Chapter 13 *Standardisation and the parametric G-formula*

Nice statement that IPTW and standardisation 'are based on the same identifiability conditions, but on different modeling assumptions.' I feel like I've heard people say IPTW has some identification advantage but now can't recall details (something to do with colliders perhaps).

13.1 It's funny that they talk about standardisation as providing a consistent estimator of the mean outcome in the treated and then of the mean outcome in the untreated. Most trials people would argue that neither is relevant except that in combination this is a sufficient (but not necessary) condition for a *contrast* to be consistent. 

13.1 It's weird to spend so much time on standardisation without explaining the point that the $Pr[L=l]$ part doesn't actually come into things for many models e.g. linear, or log-/identity-link binomial GLMs. It's only when the model used produces a non-collapsible effect summary and we want something marginal that the sum/integral becomes important for the contrast of interest (e.g. when we fit logistic regression but want a marginal OR, RR or RD).

13.1 Typo 'IP probability weights' - remove 'probability'.

13.2 'The same rationale applies to the conditional mean outcome in the uncensored untreated…' Does anyone need this point clarifying??

Table 12.2 Weird way to explain it. Why not just describe it as a single dataset and then just have two new columns, $Y^{a=0}$ and $Y^{a=1}$? This is surely how anyone who works with datasets would think of it, no?

## Chapter 14 *G-estimation of structural nested models*

14.1 This seems a bit of a long and pointless section. 'Can I have that bit of my life back please?'

14.3 What does 'effect-*measure* modification' mean? Effect modification on the scale of the chosen summary?

The key point here seems to be that the intercept and main effects of $L$ are modelled nonparametrically, which gives us an advantage over standardisation.

14.3 Says that G-estimation cannot adjust for 'selection bias' but never explains *why* not. Is it because it is assumed that selection is based on $L$ but effects of $L$ are not modelled?

14.4 'For most treatments and outcomes, the individual causal effect is not expected to be constant -- not even approximately constant -- across individuals with the same covariate values.' For most treatments and outcomes we have absolutely *nothing* to anchor our expectations about whether a causal effect might be constant or not, so this statement is unfalsifiable. The point is just that the assumption of constancy is stronger than non-constancy, so we should proceed with the weaker assumption if possible.

14.4 The whole 'not all possible values can be tested' is weird. Are we missing something? Are we in a chapter on g-estimation and pretending we don't know about how to maximise a likelihood? (Decided to try it out to understand)

14.4 I don't understand the margin note about the Wald test. This doesn't require fitting of two models.

14.4 No explanation of why bootstrap intervals would be liberal in their coverage. Something predictably irregular here?

14.4 'Consistent estimate' - should be *estimator*. An estimate is just a number; it doesn't have properties like consistency.

(We paused book club because not many people were coming during lockdown and those of us with families could not spend sufficient time reading. I didn't make notes on several chapters we read and discussed, but had much less to say. Hopefully TBC.)
