#Interaction plot
interaction.plot(Location,Bait,Moth,type = "b",
                 col=c(1:3),leg.bty = "o",xlab = "Location Type",
                 ylab="Number of Moths Trapped",
                 main="Interaction Plot of Location and Bait")

#group means for Location
library(data.table)
dt<-data.table(Trap)
dt[,list(Count=.N,
         mean=round(mean(Moth)),3), by=list(Location)]

#group means for Bait
library(data.table)
dt<-data.table(Trap)
dt[,list(Count=.N,
         mean=round(mean(Moth)),3), by=list(Bait)]

#Group means for treatment levels
library(data.table)
dt<-data.table(Trap)
dt[,list(Count=.N,
         mean=round(mean(Moth)),3), by=list(Bait,Location)]
#Anova
twowayfit<-aov(Moth~Location,data=Trap)
summary(twowayfit)
