library(countrycode)
?countrycode
?codelist
View(codelist_panel)

setwd("~/Documents/GitHub/international-relations-database-extended/Mashup_Data/")

# subset codelist_panel so years are after 1945 and only needed codes are included
needed.columns = c('country.name.en', 'year', 'continent', 'region', 'cown', 'gwn', 'iso3c', 'p4n', 'wb')
country.conversion.table <- subset(codelist_panel, year > 1945, select=needed.columns)

# fill in missing G&W codes for microstates
gw_micro <- read.table("../Data/Other/microstatessystem.dat", sep="\t", fileEncoding = 'latin1', col.names = c('gw.id', 'gwc', 'gw.name', 'start', 'end'), colClasses=c("character"))
gw_micro$gw.name[3]="St. Lucia"
gw_micro$gw.name[4]="St. Vincent & Grenadines"
gw_micro$gw.name[6]="St. Kitts & Nevis"
gw_micro$gw.name[22]="Micronesia (Federated States of)"
gw_micro$gw.name[23]="Samoa"

gw_micro <- gw_micro[-c(11, 12, 13), ]
gw_micro <- gw_micro[c('gw.id', 'gw.name')]

country.conversion.table <- merge(country.conversion.table, gw_micro, by.x = 'country.name.en', by.y = 'gw.name', all.x=TRUE)
country.conversion.table$gwn <- ifelse(is.na(country.conversion.table$gwn), country.conversion.table$gw.id, country.conversion.table$gwn)
country.conversion.table <- subset(country.conversion.table, select = -c(gw.id))

# drop rows that don't have either CoW codes or G&W codes
country.conversion.table <- country.conversion.table[!with(country.conversion.table, is.na(cown)& is.na(gwn)),]

write.csv(country.conversion.table, '../Data/Other/country_conversion_table.csv', na="", row.names=FALSE)

