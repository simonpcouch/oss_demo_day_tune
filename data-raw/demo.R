# `pak::pak(".")`, if needed

# load needed libraries
library(tidymodels)

# some artisinal random data
set.seed(2023)

dat <-
  tibble(y = rnorm(50), x = y + rnorm(50)) %>%
  mutate(y = y + cos(x * 1.2))

ggplot(dat) + aes(x = x, y = y) + geom_point()

# tune a nearest neighbors regression
res <-
  tune_grid(
    nearest_neighbor("regression", neighbors = tune()),
    y ~ x,
    bootstraps(dat)
  )

autoplot(res)




















