library(doBy)
library(ggplot2)

x <- read.csv("Sand_Experiment_Data.csv")

x$Q <- x$velocity*x$depth

x <- summaryBy(velocity~date+block, x, FUN=mean)

x$Date <- as.Date(x$date)

colnames(x) <- c("date", "block", "velocity", "Date")

out <- x[,-grep("Date", colnames(x))]

write.csv(out, "experiment_velocity_time_series.csv")
