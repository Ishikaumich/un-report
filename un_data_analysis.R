library(tidyverse)
gapminder_data <- read_csv("gapminder_data.csv")

summarize(gapminder_data, averagelifeExp = mean(lifeExp))

gapminder_data %>% summarize(averagelifeExp = mean(lifeExp))

gapminder_data %>%
  summarize(averagelifeExp = mean(lifeExp))

gapminder_data_summarized <- gapminder_data %>% summarize(averagelifeExp = mean(lifeExp))

#gapminder_data <- gapminder_data %>% summarize(averagelifeExp = mean(lifeExp)) #danger

gapminder_data %>%
  summarize(recent_year = max(year))

gapminder_data %>%
  filter(year == 2007) %>% # only the year 2007 is used to calculate the average
  summarize(average = mean(lifeExp))

gapminder_data %>%
  filter(year == min(year)) %>%
  summarize(average = mean(gdpPercap))


gapminder_data %>%
  group_by(year) %>%
  summarize(averagelifeExp = mean(lifeExp))

gapminder_data %>%
  group_by(continent) %>%
  summarize(averagelifeExp = mean(lifeExp))

gapminder_data %>%
  group_by(continent) %>%
  summarize(averagelifeExp = mean(lifeExp), min = min(lifeExp))

gapminder_data %>%
  mutate(gdp = pop * gdpPercap)

gapminder_data %>%
  mutate(gdp = pop * gdpPercap, pop_in_million = pop/1000000)





gapminder_data %>%
  select(pop, year)

gapminder_data %>%
  select(-continent)


gapminder_data %>% 
  select(-pop, -gdpPercap)


gapminder_data %>%
  select(year, starts_with('c'))

gapminder_data %>%
  select(ends_with('p'))


?filter



gapminder_data %>%
  select(country, continent, year, lifeExp) %>% 
  pivot_wider(names_from = year, values_from = lifeExp)

getwd()
gapminder_data_2007 <- read_csv("gapminder_data.csv") %>%
  filter(year == 2007 & continent == "Americas") %>%
  select(-year, -continent)


read_csv("co2-un-data.csv")
read_csv("co2-un-data.csv")

getwd()
getwd()


read_csv("co2-un-data", skip - 1)


co2_emissions_dirty <- read_csv("co2-un-data.csv", skip = 2, col_names = c("region", "country", "year", "series","values","footnotes", "source"))

co2_emissions_dirty


read_csv("co2-un-data.csv", skip = 1) %>%
  rename(country = ...2)                             


co2_emissions_dirty%>%
  select(country, year, series, values)


co2_emissions_dirty %>% 
  select(country, year, series, values) %>%
  mutate(series = recode(series, "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions", 
                         "Emissions per capita(metric tons of carbon dioxide)" = "per_capita_emissions"))

?mutate

co2_emissions_dirty %>% 
  select(country, year, series, values) %>%
  mutate(series = recode(series, "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions", 
                         "Emissions per capita(metric tons of carbon dioxide)" = "per_capita_emissions")) %>% 
  pivot_wider(names_from = series, values_from = values)


co2_emissions_dirty %>% 
  select(country, year, series, values) %>%
  mutate(series = recode(series, 
                         "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions", 
                         "Emissions per capita(metric tons of carbon dioxide)" = "per_capita_emissions")) %>% 
  pivot_wider(names_from = series, values_from = values) %>% 
  count(year)


co2_emissions_dirty %>% 
  select(country, year, series, values) %>%
  mutate(series = recode(series, 
                         "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions", 
                         "Emissions per capita(metric tons of carbon dioxide)" = "per_capita_emissions")) %>% 
  pivot_wider(names_from = series, values_from = values) %>%
  filter(year == 2005) %>% 
  select(-year)
co2_emissions <- co2_emissions_dirty %>% 
  select(country, year, series, values) %>%
  mutate(series = recode(series, 
                         "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions", 
                         "Emissions per capita (metric tons of carbon dioxide)" = "per_capita_emissions")) %>% 
  pivot_wider(names_from = series, values_from = values) %>%
  filter(year == 2005) %>% 
  select(-year)

inner_join(gapminder_data, co2_emissions)

inner_join(gapminder_data, co2_emissions, by = "country")

gapminder_co2 <- inner_join(gapminder_data_2007, co2_emissions, by = "country")


ggplot(gapminder_co2, aes(x = gdpPercap, y = per_capita_emissions )) +
  geom_point() +
  labs(x = "GDP (per capita)", 
       y = "CO2 emitted (per capita)", 
       title = "Strong association between a nation's GDP and CO2 production")

