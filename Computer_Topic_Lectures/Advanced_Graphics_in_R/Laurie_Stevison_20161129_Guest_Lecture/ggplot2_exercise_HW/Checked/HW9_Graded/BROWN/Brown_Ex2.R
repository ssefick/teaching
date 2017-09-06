vel_exp <- read.csv("experiment_velocity_time_series.csv")

library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)

qplot <- qplot(date, velocity, data=vel_exp)
qplot <- qplot+geom_point(aes(color=as.factor(block)))
qplot <- qplot+facet_wrap("block")
qplot <- qplot+theme_bw()

source("publication_ggplot2_theme.R")
qplot+publication()

