# Thaneat Saithong 610610587
# Data url
# https://www.kaggle.com/fivethirtyeight/the-ultimate-halloween-candy-power-ranking/version/1

library(tidyverse)

# Load data
setwd("C:/Users/bobon/Desktop/RAssignment")
raw <- read.table(file="candy-data.csv", header = TRUE, sep=",")
head(raw)

# Select appropriate fields
mydata <- raw %>% select(chocolate, hard, bar, crispedricewafer, fruity, sugarpercent)

# Fit generalize linear model
mylogit <- glm(chocolate ~ fruity + crispedricewafer + hard + sugarpercent, data = mydata, family = "binomial")
summary(mylogit)

# Predict if this candy is chocolate flavor
predict(mylogit, data.frame(hard = 0, bar = 0, crispedricewafer = 0, fruity = 1, sugarpercent = 1), type="response")

# Critical value
qchisq(0.95,80)

# P-value 
1-pchisq(54.222,80)
