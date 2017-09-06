library(ggplot2)
data(mtcars)
View(mtcars)
mtcars[mtcars$am==1,"am"] <- "automatic"
mtcars[mtcars$am==0,"am"] <- "manual"
View(mtcars)
pdf(file="Gardner_Ex1.pdf")
myplot<-qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)
#myplot<-qplot(as.factor(cyl),mpg, 1:10, geom="boxplot", xlab = "Transmission Type")+theme_bw()
#myplot+facet_wrap(~am)
cylplot<-qplot(as.factor(cyl), mpg, data=mtcars, geom='boxplot', xlab="Cylinders")
gearplot<-qplot(as.factor(gear), mpg, data=mtcars, geom='boxplot', xlab = "Gears")
cylplot+facet_wrap(~am)
gearplot+facet_wrap(~am)

Splot<-qplot(hp,mpg, data=mtcars)
Splot+geom_smooth()
Splot <-qplot(log(hp), log(mpg), data=mtcars)+geom_smooth()

Splot<-qplot(log(hp), log(mpg), data=mtcars)+geom_smooth(method="lm")
Splot+facet_wrap(~am)
qplot(log(hp), log(mpg), data=mtcars, col=am)+geom_smooth()

mpg_hp_gear_trans_cyl <- qplot(hp, mpg, data=mtcars, geom="blank")+facet_grid(gear~am)
mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))
dev.off()

#Answers to questions
#10. No, the data suggest a log relationship
#When transformed, the data are "almost" linear

#13. No, the intercepts do not look the same

#14. No, the slopes do not look the same

#16. I would choose automatic as the transmission to optimize mpg






