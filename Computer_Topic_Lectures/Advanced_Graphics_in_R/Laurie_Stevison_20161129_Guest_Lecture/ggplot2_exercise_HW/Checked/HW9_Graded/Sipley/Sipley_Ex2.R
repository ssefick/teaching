#install.packages("grid"))
vel_exp <- read.csv("experiment_velocity_time_series.csv")
library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)
head(vel_exp$data)
myplot <- qplot(date, velocity, data=vel_exp, col=block, geom="line")+facet_wrap(~block)
myplot
source("publication_ggplot2_theme.R")
Sipley_thing <- myplot+publication()


pdf(file="Sipley_Ex2.pdf", width=20, height=8.5)
Sipley_thing
dev.off()