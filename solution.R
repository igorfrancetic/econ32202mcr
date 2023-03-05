# Load data
load("tutorial5.rda")
attach(tutorial5)

# 1(b): Plot the distribution and average number of GP visits by ethnicity
hist(gpvisits[nonwhite==0], 
    main="GP visits for nonwhite=0",
    xlab="Nr. of visits")
hist(gpvisits[nonwhite==1],
    main="GP visits for nonwhite=1",
    xlab="Nr. of visits")
mean(gpvisits[nonwhite==0])
mean(gpvisits[nonwhite==1])
t.test(gpvisits~nonwhite)

# 1(c): Run regression
options(scipen=3)
model<-lm(gpvisits~income+nonwhite+needsindex+supplyindex)
summary.lm(model,digits=3)

# 1(d): Produce the Concentration Curves for healthcare taxes in regimes 1 and 2 
install.packages("REAT")
library(REAT)
lorenz(income,lctitle="Lorenz curve")
lorenz(hcaretax1, z=income, lctitle="CC for NHS regime 1")
lorenz(hcaretax2, z=income, lctitle="CC for NHS regime 2")

# 1(d) ii: What determines their progressivity/regressivity in this setting?
plot(income,nhsregime1,
     main="NHS contribution by income level in regime 1",
     xlab="Income levels", ylab="NHS contribution rate")
plot(income,nhsregime2,
     main="NHS contribution by income level in regime 2",
     xlab="Income levels", ylab="NHS contribution rate")