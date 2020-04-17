* Stata code for Causal Inference: What If by Miguel Hernan & Jamie Robins
* Date: 10/10/2019
* Author: Eleanor Murray 
* For errors contact: ejmurray@bu.edu
* Edited by Tim Morris | tim.morris@ucl.ac.uk | 05apr2020


* NOTE [TIM] - THIS IS A BADLY FORMATTED DATASET
* Good practice would be to have a script that does all the formatting, cleaning etc.
* And any analyses should be in a separate script. But better for a clean dataset to
* be distributed with the book
* Major points:
* 1. Should -compress- before saving it
* 2. Should clean and label all variables
* 3. Need date of death, not separate variables for year, month and day
* 4. If some data will be dropped before certain analyses, a separate dataset should be saved


version 16
use "nhefs.dta", clear
compress // for some reason the original dataset is stored as double!

* Script 12.1
* Descriptive statistics from NHEFS data (Table 12.1)
* This doesn't come out exactly as in the table in the book but that's a long ting and same result
gen byte white = race==0
gen byte university = education==5
gen byte noexercise = exercise==2
gen byte inactive = active==2
tabstat age wt71 smokeintensity smokeyrs , s(mean) by(qsmk)
tabstat sex white university noexercise inactive, s(mean) by(qsmk)

* ADDED tpm
* Section 12.1 estimate 'associational' diff and 95% CI
regress wt82_71 i.qsmk
* Better, adjust for '71 weight (they don't do this in the book')
regress wt82_71 i.qsmk wt71


* Script 12.2
* Estimating IP weights for Section 12.2
* Do the weighting model and outcome model and get correct variance estimator
* For some reason they talk about each step individually in the book
teffects ipw (wt82_71) (qsmk sex race c.age##c.age ib(last).education c.smokeintensity##c.smokeintensity ///
    c.smokeyrs##c.smokeyrs i.exercise i.active c.wt71##c.wt71), ate


* Script 12.3
* As above but with stabilized IP weights

* Fit a logistic model for the denominator of the IP weights and predict the conditional probability of smoking
logit qsmk sex race c.age##c.age ib(last).education c.smokeintensity##c.smokeintensity ///
        c.smokeyrs##c.smokeyrs ib(last).exercise ib(last).active c.wt71##c.wt71  
    predict pd_qsmk, pr

* Fit a logistic model for the numerator of ip weights and predict Pr(A=1)
logit qsmk 
    predict pn_qsmk, pr

* Generate stabilized weights as f(A)/f(A|L) 
gen float sw_a = pn_qsmk/pd_qsmk if qsmk
    replace sw_a=(1-pn_qsmk)/(1-pd_qsmk) if !qsmk

* Check distribution of the stabilized weights
summarize sw_a
twoway kdensity sw_a , by(qsmk, cols(1))

* Fit marginal structural model in the pseudopopulation [note: cluster(seqn) option not needed]
regress wt82_71 qsmk [pweight=sw_a]


* Fine point 12.2
* Checking positivity
* Check for missing values within strata of covariates, for example:
tab age qsmk if !race & sex & !missing(wt82)
tab age qsmk if  race & sex & !missing(wt82)


* Script 12.4
* Estimating the parameters of a marginal structural mean model
* with a continuous treatment Data from NHEFS
* Section 12.4
drop sw_a

* Analysis restricted to subjects reporting <=25 cig/day at baseline: N = 1162*/
keep if smokeintensity <=25

* Fit a linear model for the denominator of the IP weights and calculate the mean expected smoking intensity*/ 
regress smkintensity82_71 sex race c.age##c.age ib(last).education c.smokeintensity##c.smokeintensity ///
    c.smokeyrs##c.smokeyrs ib(last).exercise ib(last).active c.wt71##c.wt71
quietly predict p_den

* Generate the density of the denomiator expectation using the mean expected smoking intensity
* and the residuals (assuming a normal distribution)
gen float dens_den = normalden(smkintensity82_71, p_den, e(rmse))

* Fit a linear model for the numerator of ip weights, calculate the mean expected value, and generate the density
regress smkintensity82_71
    predict p_num
gen dens_num = normalden(smkintensity82_71, p_num, e(rmse))

* Generate the final stabilized weights from the estimated numerator and denominator, and check the weights distribution
gen sw_a = dens_num/dens_den
summarize sw_a

* Fit a marginal structural model in the pseudopopulation
regress wt82_71 c.smkintensity82_71##c.smkintensity82_71 [pweight=sw_a], cluster(seqn)

* Output the estimated mean Y value when smoke intensity is unchanged from baseline to 1982
lincom _b[_cons]

* Output the estimated mean Y value when smoke intensity increases by 20 from baseline to 1982
lincom _b[_cons] + 20*_b[smkintensity82_71 ] +400*_b[c.smkintensity82_71#c.smkintensity82_71]



* Script 12.5
* Estimating the parameters of a marginal structural logistic model
* Data from NHEFS
* Section 12.4

clear
use "nhefs.dta"


* Estimate the stabilized weights for quitting smoking as in PROGRAM 12.3*/
* Fit a logistic model for the denominator of the IP weights and predict the conditional probability of smoking*/ 
logit qsmk sex race c.age##c.age ib(last).education c.smokeintensity##c.smokeintensity ///
c.smokeyrs##c.smokeyrs ib(last).exercise ib(last).active c.wt71##c.wt71  
predict pd_qsmk, pr
* Fit a logistic model for the numerator of ip weights and predict Pr(A=1) */ 
logit qsmk 
predict pn_qsmk, pr
* Generate stabilized weights as f(A)/f(A|L)*/
gen sw_a=.
replace sw_a=pn_qsmk/pd_qsmk if qsmk==1
replace sw_a=(1-pn_qsmk)/(1-pd_qsmk) if qsmk==0
summarize sw_a

/*Fit marginal structural model in the pseudopopulation*/
/*NOTE: Stata has two commands for logistic regression, logit and logistic*/
/*Using logistic allows us to output the odds ratios directly*/
/*We can also output odds ratios from the logit command using the or option (default logit output is regression coefficients*/
logistic death qsmk [pweight=sw_a], cluster(seqn) 


***************************************************************
*PROGRAM 12.6
*Assessing effect modification by sex using a marginal structural mean model
*Data from NHEFS
*Section 12.5
***************************************************************/
drop pd_qsmk pn_qsmk sw_a

/*Check distribution of sex*/
tab sex

/*Fit logistc model for the denominator of IP weights, as in PROGRAM 12.3 */
logit qsmk sex race c.age##c.age ib(last).education c.smokeintensity##c.smokeintensity ///
c.smokeyrs##c.smokeyrs ib(last).exercise ib(last).active c.wt71##c.wt71 
predict pd_qsmk, pr

/*Fit logistic model for the numerator of IP weights, no including sex */
logit qsmk sex
predict pn_qsmk, pr

/*Generate IP weights as before*/
gen sw_a=.
replace sw_a=pn_qsmk/pd_qsmk if qsmk==1
replace sw_a=(1-pn_qsmk)/(1-pd_qsmk) if qsmk==0

summarize sw_a

/*Fit marginal structural model in the pseudopopulation, including interaction term between quitting smoking and sex*/
regress wt82_71 qsmk##sex [pw=sw_a], cluster(seqn)



/***************************************************************
PROGRAM 12.7
Estimating IP weights to adjust for selection bias due to censoring
Data from NHEFS
Section 12.6
***************************************************************/

clear
use "nhefs.dta"

/*Analysis including all individuals regardless of missing wt82 status: N=1629*/
/*Generate censoring indicator: C = 1 if wt82 missing*/
gen byte cens = (wt82 == .)

/*Check distribution of censoring by quitting smoking and baseline weight*/
tab cens qsmk, column
bys cens: summarize wt71

/*Fit logistic regression model for the  denominator of IP weight for A*/
logit qsmk sex race c.age##c.age ib(last).education c.smokeintensity##c.smokeintensity ///
c.smokeyrs##c.smokeyrs ib(last).exercise ib(last).active c.wt71##c.wt71 
predict pd_qsmk, pr

/*Fit logistic regression model for the  numerator of IP weights for A*/
logit qsmk
predict pn_qsmk, pr

/*Fit logistic regression model for the  denominator of IP weights for C, including quitting smoking*/
logit cens qsmk sex race c.age##c.age ib(last).education c.smokeintensity##c.smokeintensity ///
c.smokeyrs##c.smokeyrs ib(last).exercise ib(last).active c.wt71##c.wt71 
predict pd_cens, pr

/*Fit logistic regression model for the  numerator of IP weights for C, including quitting smoking */
logit cens qsmk
predict pn_cens, pr

/*Generate the stabilized weights for A (sw_a)*/
gen sw_a=.
replace sw_a=pn_qsmk/pd_qsmk if qsmk==1
replace sw_a=(1-pn_qsmk)/(1-pd_qsmk) if qsmk==0

/*Generate the stabilized weights for C (sw_c)*/
/*NOTE: the conditional probability estimates generated by our logistic models for C represent the conditional probability of being censored (C=1)*/
/*We want weights for the conditional probability of bing uncensored, Pr(C=0|A,L)*/
gen sw_c=.
replace sw_c=(1-pn_cens)/(1-pd_cens) if cens==0

/*Generate the final stabilized weights and check distribution*/
gen sw=sw_a*sw_c
summarize sw

/*Fit marginal structural model in the pseudopopulation*/
regress wt82_71 qsmk [pw=sw], cluster(seqn)
