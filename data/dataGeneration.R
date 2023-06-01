
#Creating practice data so my work is shareable

library(dplyr)
library(stringr)
 
#Environment Simulated
nPrograms <- 100 # 100 Programs 

awardLevels <- c('1a','1b','2','3') # 4 Different Award Levels (e.g. Two-year school) 1a, 1b, 2 and 3.

programData <- data.frame(
  PROGRAM_CDE = 1:nPrograms,
  CIP_CDE = str_pad(1:nPrograms, 6, side = "left", pad = 0),
  AWARD_LVL_CDE = sample(awardLevels, size = nPrograms, replace = TRUE),
  DISTANCE_CDE = sample(1:2, size = nPrograms, replace = TRUE)
  )

dSports <- read.csv('C:\\Users\\Thomas Sharpe\\Documents\\thomasIR\\air2023\\data\\sportList.csv')

programData <- inner_join(programData,dSports, by = c("PROGRAM_CDE" = "SPORT_CDE"))
names(programData)[5] <- "PROGRAM_DESC"

programData <- programData[,c("PROGRAM_CDE", "PROGRAM_DESC", "CIP_CDE","AWARD_LVL_CDE","DISTANCE_CDE")]

glimpse(programData)


nStudents <- 20000
Year <- "2022-23"

oneMin <- 1
oneMax <- nStudents * .5

twoMin <- oneMax + 1
twoMax <- nStudents * .75

threeMin <- twoMax + 1
threeMax <- nStudents

nRows <- (nStudents * .5) + (nStudents * .25 * 2) + (nStudents *.25 * 3)

completionData <- data.frame(
  STUDENT_ID = sample(c(rep(oneMin:oneMax, each = 1), rep(twoMin:twoMax, each = 2), rep(threeMin:threeMax, each = 3))),
  ACAD_YEAR = Year,
  PROGRAM_CDE = sample(1:nPrograms, size = nRows, replace = TRUE),
  AWARD_LVL_CDE = sample(awardLevels, size = nRows, replace = TRUE),
  CIP_CDE = sample(str_pad(1:nPrograms, 6, side = "left", pad = 0), size = nRows, replace = TRUE),
  GENDER_CDE = sample(1:2, size = nRows, replace = TRUE),
  ETHNIC_CDE = sample(1:9, size = nRows, replace = TRUE),
  AGE_CDE = sample(1:5, size = nRows, replace = TRUE)
  )

write.csv(programData,'C:\\Users\\Thomas Sharpe\\Documents\\thomasIR\\air2023\\data\\programData.csv',row.names = FALSE)
write.csv(completionData,'C:\\Users\\Thomas Sharpe\\Documents\\thomasIR\\air2023\\data\\completionData22.csv', row.names = FALSE)


