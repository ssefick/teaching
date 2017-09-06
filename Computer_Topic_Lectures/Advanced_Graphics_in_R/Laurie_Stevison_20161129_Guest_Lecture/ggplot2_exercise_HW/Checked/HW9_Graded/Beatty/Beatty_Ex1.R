#Stephen Sefick Lecture 
install.packages(c("ggplot2", "grid"))
library(ggplot2)
data(mtcars)

#Part One
mtcars[mtcars$am==1, "am"] <- "automatic"
mtcars[mtcars$am==0, "am"] <- "manual"

#5
hist.my=qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)

#6
bp=qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot", xlab="Cylinders")
bp
bp=bp+facet_wrap(~am)
bp

sc_plot=qplot(hp, mpg, data=mtcars, xlab="Horsepower")
sc_plot
sc_plot=sc_plot+geom_smooth()
sc_plot

sc_plot2=qplot(log(hp),log(mpg),data=mtcars)+geom_smooth()
sc_plot2

sc_plot3=qplot(log(hp),log(mpg),data=mtcars)+geom_smooth(method="lm")
sc_plot3

sc_plot4=qplot(log(hp),log(mpg),data=mtcars)+geom_smooth(method="lm")
sc_plot4=sc_plot4+facet_wrap(~am)
sc_plot4

#15
splot_color=qplot(log(hp), log(mpg), data=mtcars, col=am)+geom_smooth()
splot_color

#17
mpg_hp_gear_trans_cyl <- qplot(hp, mpg, data=mtcars, geom="blank")+facet_grid(gear~am)
mpg_hp_gear_trans_cyl=mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))
mpg_hp_gear_trans_cyl

pdf("Beatty_Ex1.pdf")
hist.my
bp
splot_color
mpg_hp_gear_trans_cyl
dev.off()

#Part Two : Experiment Sandy Creek 
vel_exp=read.csv("experiment_velocity_time_series.csv")
vel_exp$date=as.Date(vel_exp$date)
linep=qplot(date, velocity, data=vel_exp, geom="line", col=block)
linep=linep+facet_wrap(~block)

source("publication_ggplot2_theme.R")
line_p=linep+publication()
line_p
pdf("Beatty_Ex2.pdf", 20, 8)
line_p
dev.off()



