download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "data3a.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "data3b.csv")
gdp <- read.csv("data3a.csv", header = TRUE, stringsAsFactors = FALSE)
gdpRanked <- gdp[which(!is.na(as.numeric(gdp$Gross.domestic.product.2012))),]
edu <- read.csv("data3b.csv", header = TRUE)
merged <- merge(gdpRanked, edu, by.x = "X", by.y = "CountryCode", sort = FALSE)
print(length(merged$X))
print(merged[13,"X"])
write.csv(merged, "q3merged.csv")
