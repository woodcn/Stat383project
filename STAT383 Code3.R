setwd("/Users/laurencovey/Downloads")
cat("\f") # clean the console
rm(list = ls()) # clean the environment
# Lets read the data
library(readxl)
df <- read_excel("STAT383 Project.xlsx")

# Create a binary response variable, 1 if mpg is above median, 0 otherwise
df$high_mpg <- as.factor(ifelse(df$Concussion > median(df$Concussion), 1, 0))

# Performing logistic regression
fit_logit <- glm(high_mpg ~ hp + qsec, family = binomial, data = df)

# Summarize of the regression model
print(summary(fit_logit))

# Prediction 
df$predicted_prob <- ifelse(predict(fit_logit, type = "response") > 0.5, 1, 0)

# Accuracy of the model 
correct_predictions <- sum(df$predicted_prob == df$high_mpg)
total_predictions <- nrow(df)
accuracy <- correct_predictions / total_predictions
cat("Accuracy of the model:", accuracy, "\n")
