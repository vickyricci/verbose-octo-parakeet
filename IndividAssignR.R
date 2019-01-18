read.csv('C:/Users/Victoria/Desktop/IndividualAssignment/IndiaConflict.csv')
indiaConflict <- read.csv('C:/Users/Victoria/Desktop/IndividualAssignment/IndiaConflict.csv', stringsAsFactors = FALSE)
#summary(indiaConflict)

read.csv('C:/Users/Victoria/Desktop/IndividualAssignment/RussiaConflict.csv')
russiaConflict <- read.csv('C:/Users/Victoria/Desktop/IndividualAssignment/RussiaConflict.csv', stringsAsFactors = FALSE)
#summary(russiaConflict)

read.csv('C:/Users/Victoria/Desktop/IndividualAssignment/IndianPopulation.csv')
indianPopulation <- read.csv('C:/Users/Victoria/Desktop/IndividualAssignment/IndianPopulation.csv', stringsAsFactors = FALSE)

read.csv('C:/Users/Victoria/Desktop/IndividualAssignment/RussianPopulation.csv')
russianPopulation <- read.csv('C:/Users/Victoria/Desktop/IndividualAssignment/RussianPopulation.csv', stringsAsFactors = FALSE)

library('tidyverse')
library('ggplot2')
library('IndiaConflict')
library('mapdata')
populations <- left_join(indianPopulation, russianPopulation, by = c("year"))
colnames(populations)[2] <- "IndianPopulation" 
colnames(populations)[3] <- "RussianPopulation"
# how to rename population x(indianPop) population y (russianPop)


populations_long <- populations %>%
  gather(
    'IndianPopulation', 'RussianPopulation',
    key = 'Country',
    value = 'Populations'
  )

#gather()
long.exp <- sub.exp %>%
  gather(Year, Expenditure, X2007:X2011) %>%         # turn to long format
  separate(Year, into=c("x", "Year"), sep="X") %>%   # separate "X" from year value
  select(-x)                                         # remove "x" column

#long.exp$Year <- as.numeric(long.exp$ Year)  # convert from character to numeric
#specify as factor 
#head(long.exp)

russiaConflict$type_of_violence <- as.factor(russiaConflict$type_of_violence)
indiaConflict$type_of_violence <- as.factor(indiaConflict$type_of_violence)

ggplot(data=populations_long) + 
  geom_point(mapping=aes(x=year, y=Populations, colour= Country))
#change dimensions of plot 

ggplot(data=indianPopulation) + 
  geom_point(mapping=aes(x=year, y=Populations, colour= Country))


ggplot(data=populations_long) + 
  geom_histogram(x=year, y=Populations, colour= Country)

            
#how do i put multiple data files in the same graph

ggplot() +
  geom_polygon(data = map_data('world', region = 'Russia'), mapping = aes(x=long, y=lat, group=group, alpha=1/2)) +
  geom_point(data= russiaConflict , mapping = aes(x=longitude, y=latitude, colour=type_of_violence))
 


  
ggplot() +
  geom_polygon(data = map_data('world',region = 'India'),mapping = aes(x=long, y=lat, group=group, alpha=1/2)) +
  geom_point(data=indiaConflict, mapping = aes(x=longitude, y= latitude, colour=type_of_violence))
  
# size=pop_2017


