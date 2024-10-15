#Question 1

voting <- read.csv('Homework1_Bonds.csv')
table(voting$Result)
prop.table(table(voting$Result))
VtCity <- voting[voting$Type=='CITY',]
VtISD <- voting[voting$Type=='ISD',]
VtWD <- voting[voting$Type=='WD',]
VtCounty <- voting[voting$Type=='COUNTY',]
prop.table(table(VtCity$Result))
prop.table(table(VtISD$Result))
prop.table(table(VtWD$Result))
prop.table(table(VtCounty$Result))

#Question 2

voting$Votes_Total <- voting$VotesFor + voting$VotesAgainst
fivenum(voting$Votes_Total)
HghstTrnt <- voting[voting$Votes_Total=='1030414',]

#Question 3

ModTrnt <- voting[voting$Votes_Total>=100,]
ModTrnt$Prcntfr <- (ModTrnt$VotesFor / ModTrnt$Votes_Total) * 100
mean(ModTrnt$Prcntfr)
sd(ModTrnt$Prcntfr)
hist(ModTrnt$Prcntfr,main='Proportion of Votes for the Bond Measure',xlab='Percentage of Votes In Favor of Bond Measure',col='darkorange3',xlim=c(0,120),ylim=c(0,900))

#Question 4
ModTrnt$AmountTh <- ModTrnt$Amount / 1000
round(ModTrnt$AmountTh,0)
plot(ModTrnt$Prcntfr,ModTrnt$AmountTh,main='Cost vs Percentage of Votes For',xlab='Percentage of Votes For',ylab='Cost (Thousands)',pch=20,col='darkslateblue')
cor(ModTrnt$Prcntfr,ModTrnt$AmountTh)
