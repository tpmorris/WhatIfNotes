* Stata code for Causal Inference: What If by Miguel Hernan & Jamie Robins
* Date: 10/10/2019
* Author: Eleanor Murray 
* For errors contact: ejmurray@bu.edu
* Edited by Tim Morris | tim.morris@ucl.ac.uk | 31mar2020

* Script 11.1 
* Figures 11.1, 11.2, and 11.3
* Sample means by treatment level
clear *

* Figure 11.1
* input dataset
input byte A int Y
    1 200
    1 150
    1 220
    1 110
    1 50
    1 180
    1 90
    1 170
    0 170
    0 30
    0 70
    0 110
    0 80
    0 50
    0 10
    0 20
end

* Figure 11.1
twoway (scatter Y A), ylab(0(50)250) xlab(0 1) xscale(range(-0.5 1.5)) name(fig1, replace)
* Output the mean values for Y in each level of A
bysort A: sum Y
* Save the data
save fig1, replace

* Figure 11.2
clear
input byte A int Y
    1 110
    1 80
    1 50
    1 40
    2 170
    2 30
    2 70
    2 50
    3 110
    3 50
    3 180
    3 130
    4 200
    4 150
    4 220
    4 210
end

twoway (scatter Y A), ylab(0(50)250) xlab(0(1)4) xscale(range(0 4.5)) name(fig2, replace)
bysort A: sum Y
save fig2, replace

* Figure 11.3
clear
input int A int Y
    3   21
    11	54
    17	33
    23	101
    29	85
    37	65
    41	157
    53	120
    67	111
    79	200
    83	140
    97	220
    60	230
    71	217
    15	11
    45  190
end

twoway (scatter Y A), ylab(0(50)250) xlab(0(10)100) xscale(range(0 100)) name(fig3, replace)
save fig3, replace


* Script 11.2 
* Linear model estimated by OLS
* Creates Figure 11.4,
* parameter estimates with 95% confidence intervals from Section 11.2,
* and parameter estimates with 95% confidence intervals from Section 11.3

* Section 11.2: parametric estimators
use fig3, clear

* Fit linear model by OLS
regress Y A

* Output the estimated mean Y value when A = 90
lincom _b[_cons] + 90*_b[A]

* Plot the data with the regression line: Fig 11.4
twoway (scatter Y A) (lfit Y A), ylab(0(50)250) xlab(0(10)100) xscale(range(0 100)) ytit(Y) name(fig4, replace)

* Section 11.3: non-parametric estimation
* Create the data, or reload with the command "use fig1, clear"
use fig1, clear

* Linear model
regress Y A

* E[Y|A=1]
di _b[_cons] + _b[A]


* Script 11.3 
* Quadratic model (weirdly termed '3-parameter linear model' hmm...)
* Creates Figure 11.5 and 
* Parameter estimates for Section 11.4
use fig3, clear

* Create the product term
gen int Asq = A^2

* Fit the regression model
regress Y A Asq

* Output the estimated mean Y value at A = 90
lincom _b[_cons] + 90*_b[A] + 90*90*_b[Asq]

* Plot quadratic fit over data (figure 11.5)
twoway (scatter Y A) (qfit Y A), ylab(0(50)250) xlab(0(10)100) xscale(range(0 100)) name(fig5, replace)

* Just for fun, try an fp2 model
twoway (scatter Y A) (fpfit Y A), name(fpfit, replace)
