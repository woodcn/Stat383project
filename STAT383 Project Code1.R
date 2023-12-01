cat("\f") # clean the console
rm(list = ls()) # clean the environment
# dev.off() # if there are previous plots then clean them
setwd("/Users/laurencovey/Downloads")
library(readxl)
print("===========================================")
df <- read_excel("STAT383 Project.xlsx")
obs <- df$Concussion
Gender <- as.numeric(df$Gender)
chi_squared_test <- chisq.test(x = obs, p = Gender)
print(chi_squared_test)
