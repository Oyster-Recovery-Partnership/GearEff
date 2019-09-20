# look at gear efficiency data

# load packages
library(dplyr)
library(ggplot2)
library(RODBC)

# load directories

# load data
db = odbcConnectAccess2007(file.path("G:/1.0 Restoration and Monitoring/9.0 Patent Tong and Diver Gear Efficiency/Data/gear_efficiency_2019.accdb")) 
oysterData = sqlFetch(db, "Oyster Data", stringsAsFactors = FALSE)
replicateData = sqlFetch(db, "Replicate Data", stringsAsFactors = FALSE)
samplingEvents = sqlFetch(db, "SampleEvents", stringsAsFactors = FALSE)
siteData = sqlFetch(db, "Site Data", stringsAsFactors = FALSE)
odbcClose(db)

names(oysterData) = gsub(" ","", names(oysterData), fixed = TRUE)

samplingEvents = mutate(Date = as.Date(Date,format="%Y-%m-%d"))

# QA/QC plots
ggplot() + geom_point(data = oysterData, aes(x = Length, y = OysterNumber)) + theme_bw() + ggtitle("Oyster Lengths")

ggplot() + geom_point(data = samplingEvents, aes(y = Sal_sur, x = SampleEvent), size = 5) + 
  theme_bw() + ggtitle("Surface Salinity") + theme(text = element_text(size = 20))
ggplot() + geom_point(data = samplingEvents, aes(y = Sal_bot, x = SampleEvent), size = 5) + 
  theme_bw() + ggtitle("Bottom Salinity") + theme(text = element_text(size = 20))
ggplot() + geom_point(data = samplingEvents, aes(y = Temp_sur, x = SampleEvent), size = 5) + 
  theme_bw() + ggtitle("Surface Temperature") + theme(text = element_text(size = 20))
ggplot() + geom_point(data = samplingEvents, aes(y = Temp_bot, x = SampleEvent), size = 5) + 
  theme_bw() + ggtitle("Bottom Temperature") + theme(text = element_text(size = 20))
ggplot() + geom_point(data = samplingEvents, aes(y = DO_sur, x = SampleEvent), size = 5) + 
  theme_bw() + ggtitle("Surface DO") + theme(text = element_text(size = 20))
ggplot() + geom_point(data = samplingEvents, aes(y = DO_bot, x = SampleEvent), size = 5) + 
  theme_bw() + ggtitle("Bottom DO") + theme(text = element_text(size = 20))
ggplot() + geom_point(data = samplingEvents, aes(y = pH_sur, x = SampleEvent), size = 5) + 
  theme_bw() + ggtitle("Surface pH") + theme(text = element_text(size = 20))
ggplot() + geom_point(data = samplingEvents, aes(y = pH_bot, x = SampleEvent), size = 5) + 
  theme_bw() + ggtitle("Bottom pH") + theme(text = element_text(size = 20))
ggplot() + geom_point(data = samplingEvents, aes(y = Date, x = SampleEvent), size = 5) + 
  theme_bw() + ggtitle("Date") + theme(text = element_text(size = 20))

# QA/QC stats and meta-data
min(samplingEvents$Date)
max(samplingEvents$Date)
