#Background:
#The data come from an experiment that I ran in 2013 in a creek
#near Waverly, AL. I used velocity (random slope) nested within block (random intercept) in a mixed model framework. I did this to statistically account for differences in velocity within block. This dataset has 3 columns.
#Column Description:
#date is date of velocity measurement
#block is experimental block
#velocity is mean velocity within a block

#R libraries required
#ggplot2 and grid; install these packages

#Task:
#Make a plot to investigate how velocity changes through time, and block.

#Questions
#Does velocity vary with time?
#Does velocity vary among blocks?
#There was a rain event during the experiment. When was this?

#import libraries
library(ggplot2)
library(grid)


#Read in csv file "cleaned data"
vel_exp <- read.csv("experiment_velocity_time_series.csv")

#must change date into class Date inorder to have ggplot recognize as such; students will have to use as.Date
vel_exp$date <- as.Date(vel_exp$date)

#use qplot to plot the data
qplot(date, velocity, data=vel_exp)

#this is not the most informative plot
#make a plot to explore Q differences among blocks
qplot(date, velocity, data=vel_exp, col=block, geom="line")

#These lines are not terribly crowded, but what would you do if they were? Try out "faceting"
qplot(date, velocity, data=vel_exp, geom="line")+facet_wrap(~block)

#theming system; you were supplied with an R script
source("publication_ggplot2_theme.R")

qplot(date, velocity, data=vel_exp, geom="line")+facet_wrap(~block)+publication()

#Save the plot you have decided looks best as an svg. 
#Remember that you might have to iterate height and width to produce a suitable plot

out_svg <- 0

if(out_svg==1){

svg("velocity_within_block_time_series.svg", height=10, width=20)
qplot(date, velocity, data=vel_exp, col=block, geom="line")+publication()
dev.off()

}