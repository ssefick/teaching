


library(ggplot2)
library(reshape2)
ct <- data.frame(cars = c(1, 3, 6, 4, 9), trucks = c(2, 5, 4, 5, 12), day=c(1:5))
ct.melt <- melt(ct, id.var="day")
p <- qplot(day, value, data=ct.melt, col=variable)
p <- p+geom_line()
p <- p+scale_x_continuous(labels=c("Mon", "Tue", "Wed", "Thu", "Fri"))
p <- p+xlab("Days")
p <- p+ylab("Total")
p <- p+ggtitle("Autos")


#better
p <- p + publication()
p <- p+scale_color_manual(values=c("orange", "blue"))

#faceting
p + facet_wrap(~variable)

#change strip text
p + facet_wrap(~variable)+theme(strip.text.x = element_text(size = 30))


cars <- c(1, 3, 6, 4, 9)
trucks <- c(2, 5, 4, 5, 12)
g_range <- range(0, cars, trucks)
plot(cars, type="o", col="blue", ylim=g_range, 
   axes=FALSE, ann=FALSE)
axis(1, at=1:5, lab=c("Mon","Tue","Wed","Thu","Fri"))
axis(2, las=1, at=4*0:g_range[2])
box()
lines(trucks, type="o", pch=22, lty=2, col="red")
title(main="Autos", col.main="red", font.main=4)
title(xlab="Days", col.lab=rgb(0,0.5,0))
title(ylab="Total", col.lab=rgb(0,0.5,0))
legend(1, g_range[2], c("cars","trucks"), cex=0.8, 
   col=c("blue","red"), pch=21:22, lty=1:2);

