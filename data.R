# Set path
path="C:/Users/s48620if/Dropbox (The University of Manchester)/Teaching/ECON32202 2023/Tutorials/Tutorial 4 2023"
setwd(path)

# Set seed
set.seed(333)

# Generate index of ids
tutorial4<-matrix(nrow=1000)
tutorial4<-as.data.frame(tutorial4)
colnames(tutorial4)<-c("id")
tutorial4$id<-c(seq(1:1000))

# Simulate characteristics and outcomes
tutorial4$age<-sample(18:65, 1000, replace=T)
tutorial4$female<-rbinom(1000,1,0.5)
tutorial4$nonwhite<-rbinom(1000,1,0.5)
tutorial4$needsindex<-runif(1000,0,1+(tutorial4$age/65))
tutorial4$supplyindex<-runif(1000,0,2)
tutorial4$income<-round(10000+10000*rgamma(1000,3,1),digits=0)
tutorial4$nhsregime1[tutorial4$income<=20000]<-0.15
tutorial4$nhsregime1[tutorial4$income>20000&tutorial4$income<=30000]<-0.20
tutorial4$nhsregime1[tutorial4$income>30000]<-0.30
tutorial4$nhsregime2[tutorial4$income<=20000]<-0.30
tutorial4$nhsregime2[tutorial4$income>20000&tutorial4$income<=30000]<-0.25
tutorial4$nhsregime2[tutorial4$income>30000]<-0.05
tutorial4$hcaretax1<-tutorial4$income*tutorial4$nhsregime1
tutorial4$hcaretax2=tutorial4$income*tutorial4$nhsregime2
tutorial4$gpvisits<-round(rpois(1000,1.5)+0.8*tutorial4$needsindex-0.7*tutorial4$nonwhite+tutorial4$income/1000000+0.5*tutorial4$supplyindex,digits=0)
save(tutorial4,file="tutorial4.Rda")