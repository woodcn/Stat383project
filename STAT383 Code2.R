setwd("/Users/laurencovey/Downloads")
cat("\f") # clean the console
rm(list = ls()) # clean the environment
# Lets read the data
library(readxl)
df <- read_excel("STAT383 Project.xlsx")
fit_lm <- lm(Concussion ~ Gender, data = df)
print(summary(fit_lm))

# Plotting the data points
plot(df$Gender, df$Concussion, main = "Concussion vs Gender",
     xlab = "Gender (Female= 0, Male = 1)", ylab = "Number of practices and games",
     pch = 19)

# Adding the regression line to the above plot
abline(fit_lm, col = "blue")
