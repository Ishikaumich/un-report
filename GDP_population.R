# script to analyse relationship between GDP and life expectancy
library(tidyverse)
gapminder_1997 <- read_csv("gapminder_1997.csv")
View(gapminder_1997)
name <- "Ben"
name
age <- 26
age
name_character <- "Harry Potter"
name_character


read_csv("gapminder_1997.csv")
test <- read.csv("gapminder_1997.csv")
Sys.Date() # outputs the current date

getwd() #tell you the the current working directory

sum(5, 6) #adds the objects in the argumments

round(3.1415)
round(3.1415,  digits = 2)
round(3.1415, 2) #round off to particular decimal points(given by th esecond argument)

read_csv(file = 'gapminder_1997.csv')


ggplot(data = gapminder_1997) + 
  aes(x= gdpPercap) + # reads the specific column for the specific axis
  labs(x="GDP per Capita") + # label for the x axis
  aes(y = lifeExp) +
  labs(y= "Life Expectancy") +
  geom_point() + # command to plot
  labs(title = "Do people in wealthy countries live longer?") +
  aes(color = continent) + # gives different color bsed on continent
  scale_color_brewer(palette = "Set1") + # to change color of the data points
  #aes(size = pop) # point size equals to the population number, it also give the legend as well
  aes(size= pop/1000000) +
  labs(size = "Population (in millions)") + # changes the name of the legend
  aes(shape = continent) # assign different shapes based on continents



ggplot(data = gapminder_1997) +
  aes(gdpPercap, lifeExp, color = continent, size = pop/1000000, shape = continent) + # you can define without actually defining
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  labs(x= "GDP Per Capita", y = "Life Expectancy", title = "Do people in wealthy countries live longer?", size = "Population (in millions)")



gapminder_data <- read_csv("gapminder_data.csv")
dim(gapminder_data) #gives the dimension
head(gapminder_data) #shows first six rows of the data

ggplot(data = gapminder_data) +
  aes(year, lifeExp, color = continent, size = pop/1000000, shape = continent) +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  labs(x= "Year", y= "Life Expectancy", size = "Population (in millions)")
ggsave("figures/Rplot.png")
