##Linear models are only appropriate when your outcome variable is continuous and unbounded

#If you want to model a categorical outcome, or a bounded outcome (like a proportion or percent),
#then you usually can't rely on regular linear modeling to do it
##CAVEAT: sometimes you can, if you're not running into the edges of your boundaries (e.g. 0 or 100)

##Tranform your outcome and input data: if it's binary (or bounded at 0 and 1), a logit works well
#If count data, then logit works, etc.
#These are "link functions" , and your outcomes will also be in that form 

#No single analytic solution to GLMs, so comp uses brute force to find a solution, 
#iterating over combos of parameter estimates and seeing which gives best model fit. 
#So your results are not exact, and you may see small changes if you run the model again 
#or with a different package. Or, your model may not converge!

##If your model doesn't converge, don't use the output!

library(ggplot2)
library(knitr)
library(car)