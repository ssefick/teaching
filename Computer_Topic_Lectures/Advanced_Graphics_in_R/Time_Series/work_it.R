vel_exp <- read.csv("experiment_velocity_time_series.csv")

library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)

source("publication_ggplot2_theme.R")
qplot(date, velocity, data=vel_exp, geom="line", col=block)+publication()

