#haha lol imagine following the instructions

library(jsonlite)
library(dplyr)

url = "https://api.github.com/users/jtleek/repos"
data <- fromJSON("https://api.github.com/users/jtleek/repos")
data %>% filter(name=="datasharing") %>% select(created_at)
