download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "data4a.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "data4b.csv")
gdp <- read.csv("data4a.csv", header = TRUE, stringsAsFactors = FALSE)
gdpRanked <- gdp[which(!is.na(as.numeric(gdp$Gross.domestic.product.2012))),]
edu <- read.csv("data4b.csv", header = TRUE)
merged <- merge(gdpRanked, edu, by.x = "X", by.y = "CountryCode", sort = FALSE)
junes <- grepl("Fiscal year end: June", merged$Special.Notes)
sum(junes, na.rm = TRUE)