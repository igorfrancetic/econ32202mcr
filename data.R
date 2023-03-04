# Set path
path=dirname(rstudioapi::getSourceEditorContext()$path)
setwd(path)

# Set seed
set.seed(333)

# Generate index of ids
tutorial5<-matrix(nrow=1000)
tutorial5<-as.data.frame(tutorial5)
colnames(tutorial5)<-c("id")
tutorial5$id<-c(seq(1:1000))

# Simulate characteristics and outcomes
tutorial5$age<-sample(18:65, 1000, replace=T)
tutorial5$female<-rbinom(1000,1,0.5)
tutorial5$nonwhite<-rbinom(1000,1,0.5)
tutorial5$needsindex<-runif(1000,0,1+(tutorial5$age/65))
tutorial5$supplyindex<-runif(1000,0,2)
tutorial5$income<-round(10000+10000*rgamma(1000,3,1),digits=0)
tutorial5$nhsregime1[tutorial5$income<=20000]<-0.15
tutorial5$nhsregime1[tutorial5$income>20000&tutorial5$income<=30000]<-0.20
tutorial5$nhsregime1[tutorial5$income>30000]<-0.30
tutorial5$nhsregime2[tutorial5$income<=20000]<-0.30
tutorial5$nhsregime2[tutorial5$income>20000&tutorial5$income<=30000]<-0.25
tutorial5$nhsregime2[tutorial5$income>30000]<-0.05
tutorial5$hcaretax1<-tutorial5$income*tutorial5$nhsregime1
tutorial5$hcaretax2=tutorial5$income*tutorial5$nhsregime2
tutorial5$gpvisits<-round(rpois(1000,1.5)+0.8*tutorial5$needsindex-0.7*tutorial5$nonwhite+tutorial5$income/1000000+0.5*tutorial5$supplyindex,digits=0)
save(tutorial5,file="tutorial5.Rda")
