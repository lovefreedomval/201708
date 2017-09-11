#第一題 Beyond
beyond_start <- as.Date("1983-12-31")
days_diff <- Sys.Date()-beyond_start
days_diff


day_to_year <- 365
anniversary <- (days_diff/day_to_year)+1
as.integer(anniversary)

#第二題 地震
#1999 年 9 月 21 日 1 時 47 分 16 秒發生震央位於南投縣集集鎮，芮氏規模 7.3 的地震，請以文字記錄這個時間，並將它指派給 major_quake_time
major_quake_time <- as.POSIXct("1999-09-21 01:47:16", tz="GMT")
#1999 年 9 月 21 日 1 時 57 分 15 秒發生第一個芮氏規模超過 6 的餘震，請以文字記錄這個時間，並將它指派給  first_aftershock_time
first_aftershock_time <- as.POSIXct("1999-09-21 01:57:15", tz="GMT") 
first_aftershock_time
major_quake_time
first_aftershock_time - major_quake_time