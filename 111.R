#Ū��ƪ�
if (!require('SportsAnalytics')){
  install.packages("SportsAnalytics")
  library(SportsAnalytics)
}
NBA1415<-fetch_NBAPlayerStatistics("14???15")
NBA1415

##�����D1:�U���̨��W���y��(���D�A�����A�{���X�M���G) 
         #���G�n�]�A���W.�y���m�W.�`�X��������.�����`�X�������ƱƧ�(�j��p)

for(team in unique(NBA1415$Team)){
  selectTeam=subset(NBA1415,Team==team)
  print(selectTeam[order(selectTeam$TotalMinutesPlayed,decreasing = T),
                   c("Team","Name","TotalMinutesPlayed")])
}


##�����D2:�U���o����(�{���X�M���G)
         #��X�n�]�A���W�P�y���m�W�P�`��.�����`���Ƨ� 

for(team in unique(NBA1415$Team)){
  selectTeam=subset(NBA1415,Team==team)
  print(selectTeam[order(selectTeam$TotalPoints,decreasing = T),
                   c("Team","Name","TotalPoints")])
}


##�����D3:�U���̦��Ĳv���y��.�{���X�M���G
        #��X�n�]�A���W�P�y���m�W�P�Ĳv�p�⵲�G.���ӮĲv�p�⵲�G�Ƨ�
        #����/�ɶ�
        #��X???
for(team in unique(NBA1415$Team)){
    selectTeam=subset(NBA1415,Team==team)
    print(selectTeam[order(selectTeam$TotalPoints/selectTeam$TotalMinutesPlayed,decreasing = T),
                   c("Team","Name")])
}


##�����D4:�U���T���y�X��̷Ǫ��y��.�{���X�M���G
         #��X�n�]�A���W�P�y���m�W�P�T���y�R���v.���ӤT���y�R���v�Ƨ�
         #ThreesMade/ThreesAttempted �̰�
x=c(selectTeam$TotalPoints/selectTeam$TotalMinutesPlayed)
print(selectTeam[order(selectTeam$TotalPoints/selectTeam$TotalMinutesPlayed,decreasing = T),
                 c(x)])



for(team in unique(NBA1415$Team)){
  selectTeam=subset(NBA1415,Team==team)
  print(selectTeam[order(selectTeam$TotalPoints/selectTeam$TotalMinutesPlayed,decreasing = T),
                   c("Team","Name")])
}



#subset(???�u�ءA???��Aselect=�O�d���ǦC�^


