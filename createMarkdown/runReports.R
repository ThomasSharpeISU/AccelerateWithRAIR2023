

library(dplyr)
library(ggplot2)
library(scales)
library(RColorBrewer)
library(rmarkdown)

setwd('C:\\Users\\Thomas Sharpe\\Documents\\thomasIR\\air2023')

dPrograms <- read.csv('data\\programData.csv')
dCompletions <- read.csv('data\\completionsFull.csv')


dCompletions <- inner_join(dCompletions, dPrograms[,c(1:2)], by = "PROGRAM_CDE")


dPlotOverall <-
  dCompletions %>%
  group_by(ACAD_YEAR) %>%
  summarise(students = n_distinct(STUDENT_ID))

pOverall <-
  ggplot(data = dPlotOverall,
         aes(x = ACAD_YEAR, y = students)) +
  geom_line(group = 1, color = 'darkgoldenrod2') + 
  geom_point(size = 2) +
  geom_text(aes(label = comma(students)), vjust = 2, size = 6) +
  scale_y_continuous(limits = c(0, NA), labels = comma) +
  labs(title = "School Overall", x = "Academic Year", y = "") +
  theme_bw() +
  theme(plot.title = element_text(hjust = .5), text = element_text(size = 18))


nPrograms <- length(dPrograms$PROGRAM_CDE)
for (curRow in 1:20) { #nPrograms
  
  #Prepping instructor specific stuff
  curProgramCode <- dPrograms[curRow,1]
  curProgramDesc <- dPrograms[curRow,2]
  
  fileName <- paste(curProgramDesc,'.html', sep = '')
  
  dCurProgram <-
    dCompletions %>%
    filter(PROGRAM_CDE == curProgramCode) %>%
    group_by(ACAD_YEAR) %>%
    summarise(students = n_distinct(STUDENT_ID))
  
  render("createMarkdown\\template.Rmd",
         output_file = fileName,
         output_dir = 'data\\ByProgram')
  
  
} #Next Program
