library(dplyr)
data <- read.csv("q3merged.csv", header = TRUE)
grouped <- group_by(data, "Income.Group")
