library(dplyr)
data <- read.csv("q3merged.csv", header = TRUE, stringsAsFactors = TRUE)
grouped <- group_by(data, Income.Group)
summarise(grouped, mean_rank = mean(Gross.domestic.product.2012))