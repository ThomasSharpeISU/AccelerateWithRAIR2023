
# Props to Thomas (different Thomas) for this
# https://gist.github.com/thomasp85/05169ad44ddcc8ed56da6ff7bf7fbe36

library(gapminder)
library(ggplot2)
library(gganimate)

p <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  theme(legend.position = 'none') +
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy',
       caption = "https://gist.github.com/thomasp85/05169ad44ddcc8ed56da6ff7bf7fbe36") +
  transition_time(year) +
  ease_aes('linear')



anim <- animate(p, 100, 10)

anim_save("population_animation.gif", anim)
