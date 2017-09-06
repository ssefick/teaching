####Nov 16, 2016
###Part 1

library(ggplot2)
data("mtcars")

#Now, change transmission type to a more intuitive coding.
mtcars[mtcars$am==1,"am"] <- "automatic"
mtcars[mtcars$am==0,"am"] <- "manual"

##make a histogram of mpg, and color it by transmission type.
plot_5 <- qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)

#Theming system example. See the documentation for more information
plot_6 <- qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot", xlab="Transmission Type")+theme_bw()

plot_7 <- plot_5+facet_wrap(~am)

#Make a scatterplot to explore the relationship of horsepower and miles per gallon.
p <- qplot(hp, mpg, data=mtcars, geom="point")
p+geom_smooth(method=loess)

#log transform
plot_15 <- qplot(log(hp), log(mpg), data=mtcars)+geom_smooth(method="lm")
plot_15+facet_wrap(~am)
plot_17 <- mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))


pdf(file="Watkins_Ex1.pdf")
plot_5
plot_6
plot_7
plot_15
plot_17
dev.off()



####Part 2

#read in file
vel_exp <- read.csv("experiment_velocity_time_series.csv")

library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)

#plot as line graph
c<- qplot(date, velocity, data=vel_exp, geom="line", col=block)+theme_bw()
c <- c+facet_wrap(~block)
# did not prefer
#source("publication_ggplot2_theme.R")
#c+publication()

pdf(file="Watkins_Ex2.pdf")
c
dev.off()


###Velocity Answers
#1) Yes, the velocity changed depending on the date
#2) Yes, velocity varied with time
#3) There was rain around Nov 25, based on the increases in all the graphs
