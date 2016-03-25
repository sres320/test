#讀資料表
if (!require('SportsAnalytics')){
  install.packages("SportsAnalytics")
  library(SportsAnalytics)
}
NBA1415<-fetch_NBAPlayerStatistics("14???15")
NBA1415

##次標題1:各隊最辛苦的球員(標題，說明，程式碼和結果) 
         #結果要包括隊名.球員姓名.總出場分鐘數.按照總出場分鐘數排序(大到小)

maxtired = aggregate(NBA1415$TotalMinutesPlayed,list(NBA1415$Team,NBA1415$Name,NBA1415$TotalMinutesPlayed),fun(FUN))
NBA1415maxtired = merge(NBA1415,NBA1415$maxtired)
print = NBA1415maxtired(order(NBA1415maxtired$TotalMinutesPlayed,decreasing = T))
print


##次標題2:各隊得分王(程式碼和結果)
         #輸出要包括隊名與球員姓名與總分.按照總分排序 

maxpoint = aggregate(NBA1415$TotalPoints,list(NBA1415$Team,NBA1415$Name,NBA1415$TotalPoints))
NBA1415maxpoint = merge(NBA1415,maxpoint)
print = NBA1415maxpoint(order(NBA1415maxpoint$TotalPoints,decreasing = T))
print



##次標題3:各隊最有效率的球員.程式碼和結果
         #輸出要包括隊名與球員姓名與效率計算結果.按照效率計算結果排序
         #TotalPoints/TotalMinutesPlayed
         #輸出???
#定義一欄(best=TotalPoints/TotalMinutesPlayed)
NBA1415$best=NBA1415$TotalPoints/NBA1415$TotalMinutesPlayed
#aggregat(資料,分組依據,函數)
Maxbest=aggregate(best,list(NBA1415$Name,NBA1415$Team))
NBA1415Maxbest=merge(NBA1415,Maxfuck)
print=NBA1415Maxbest[order(NBA1415Maxbest$best,decreasing = T)]
print


##次標題4:各隊三分球出手最準的球員.程式碼和結果
         #輸出要包括隊名與球員姓名與三分球命中率.按照三分球命中率排序
         #ThreesMade/ThreesAttempted

NBA1415$fuck=NBA1415$TotalPoints/NBA1415$TotalMinutesPlayed
#aggregat(資料,分組依據,函數)
Maxfuck=aggregate(fuck,list(NBA1415$Name,NBA1415$Team))
NBA1415Maxfuck=merge(NBA1415,Maxfuck)
print=NBA1415Maxfuck[order(NBA1415Maxfuck$fuck,decreasing = T)]
print

