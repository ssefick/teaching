install.packages("grid")
library("ggplot2")

#################
#######(1)#######
##USING GGPLOT2##
#################

data("mtcars")
mtcars[mtcars$am==1,"am"] <- "automatic"
mtcars[mtcars$am==0,"am"] <- "manual"

#MPG histogram, cyl and gear by mpg boxplot
plot5<-qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)
plot6<-qplot(as.factor(mtcars$cyl),mpg,data=mtcars,geom="boxplot",xlab=deparse(substitute(x)))+theme_bw()+facet_wrap(~am)

#Scatter plot and lm of hp by mpg
qplot(hp,mpg,data=mtcars)+geom_smooth()
qplot(log(hp),log(mpg),data=mtcars)+geom_smooth(method="lm")+facet_wrap(~am)
plot15<-qplot(log(hp),log(mpg),data=mtcars,col=am)+geom_smooth()

#Big plot
mpg_hp_gear_trans_cyl <- qplot(hp,mpg,data=mtcars,geom="blank")+facet_grid(gear~am)
plot17<-mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))
 
pdf("Westfall_Ex1.pdf")
plot5
plot6
plot15
plot17
dev.off()
