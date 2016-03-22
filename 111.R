#讀資料表
if (!require('SportsAnalytics')){
  install.packages("SportsAnalytics")
  library(SportsAnalytics)
}
NBA1415<-fetch_NBAPlayerStatistics("14???15")
NBA1415

##次標題1:各隊最辛苦的球員(標題，說明，程式碼和結果) 
         #結果要包括隊名.球員姓名.總出場分鐘數.按照總出場分鐘數排序(大到小)

for(team in unique(NBA1415$Team)){
  selectTeam=subset(NBA1415,Team==team)
  print(selectTeam[order(selectTeam$TotalMinutesPlayed,decreasing = T),
                   c("Team","Name","TotalMinutesPlayed")])
}


##次標題2:各隊得分王(程式碼和結果)
         #輸出要包括隊名與球員姓名與總分.按照總分排序 

for(team in unique(NBA1415$Team)){
  selectTeam=subset(NBA1415,Team==team)
  print(selectTeam[order(selectTeam$TotalPoints,decreasing = T),
                   c("Team","Name","TotalPoints")])
}


##次標題3:各隊最有效率的球員.程式碼和結果
        #輸出要包括隊名與球員姓名與效率計算結果.按照效率計算結果排序
        #分數/時間
        #輸出???
for(team in unique(NBA1415$Team)){
    selectTeam=subset(NBA1415,Team==team)
    print(selectTeam[order(selectTeam$TotalPoints/selectTeam$TotalMinutesPlayed,decreasing = T),
                   c("Team","Name")])
}


##次標題4:各隊三分球出手最準的球員.程式碼和結果
         #輸出要包括隊名與球員姓名與三分球命中率.按照三分球命中率排序
         #ThreesMade/ThreesAttempted 最高
x=c(selectTeam$TotalPoints/selectTeam$TotalMinutesPlayed)
print(selectTeam[order(selectTeam$TotalPoints/selectTeam$TotalMinutesPlayed,decreasing = T),
                 c(x)])



for(team in unique(NBA1415$Team)){
  selectTeam=subset(NBA1415,Team==team)
  print(selectTeam[order(selectTeam$TotalPoints/selectTeam$TotalMinutesPlayed,decreasing = T),
                   c("Team","Name")])
}



#subset(???据框，???件，select=保留哪些列）



