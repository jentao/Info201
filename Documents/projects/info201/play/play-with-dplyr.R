install.packages("dplyr")  # once per machine
library("dplyr")

install.packages("babynames")
library("babynames")

babynames %>% 
  select(-prop) %>% 
  filter(sex == "F") %>% 
  arrange(desc(n)) %>% 
  head()

babynames %>% 
  filter(sex == "F") %>% 
  group_by(name) %>% 
  summarise(sum = sum(n)) %>%
  ##arrange(desc(sum)) %>% 
  filter(min_rank(desc(sum))==2)
  ##mutate(place = row_number()) %>% 
  ##filter(name == "Emma")

babynames %>% 
  select(-prop) %>% 
  filter(sex == "M", year == "2005") %>% 
  arrange(desc(n)) %>% 
  filter(min_rank(desc(n))==5)

babynames %>% 
  select(-prop) %>% 
  group_by(year) %>% 
  filter(sex=="F") %>% 
  head()

