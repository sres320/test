install.packages("SportsAnalytics")
library(SportsAnalytics)
NBA1415<-fetch_NBAPlayerStatistics("14-15")

MaxMinutesPlayed<-aggregate(TotalMinutesPlayed~Team,NBA1415,max)
NBA1415MaxMinutesPlayed<-merge(NBA1415,MaxMinutesPlayed)
output<-NBA1415MaxMinutesPlayed[order(NBA1415MaxMinutesPlayed$TotalMinutesPlayed,decreasing = T),c("Team","Name","TotalMinutesPlayed")]
library(knitr)
kable(output, digits=2)

MaxPoint<-aggregate(TotalPoints~Team,NBA1415,max)
NBA1415MaxPoint<-merge(NBA1415,MaxPoint)
output<-NBA1415MaxPoint[order(NBA1415MaxPoint$TotalPoints,decreasing = T),c("Team","Name","TotalPoints")]
library(knitr)
kable(output, digits=2)

NBA1415$Efficiency<-NBA1415$TotalPoints/NBA1415$TotalMinutesPlayed
MaxEfficiency<-aggregate(Efficiency~Team,NBA1415,max)
NBA1415MaxEfficiency<-merge(NBA1415,MaxEfficiency)
output<-NBA1415MaxEfficiency[order(NBA1415MaxEfficiency$Efficiency,decreasing = T),c("Team","Name","Efficiency")]
library(knitr)
kable(output, digits=3)

NBA1415$ThreesPercentage<-NBA1415$ThreesMade/NBA1415$ThreesAttempted
MaxThreesPercentage<-aggregate(ThreesPercentage~Team,NBA1415,max)
NBA1415MaxThreesPercentage<-merge(NBA1415,MaxThreesPercentage)
output<-NBA1415MaxThreesPercentage[order(NBA1415MaxThreesPercentage$ThreesPercentage,decreasing = T),c("Team","Name","ThreesPercentage")]
library(knitr)
kable(output, digits=3)

