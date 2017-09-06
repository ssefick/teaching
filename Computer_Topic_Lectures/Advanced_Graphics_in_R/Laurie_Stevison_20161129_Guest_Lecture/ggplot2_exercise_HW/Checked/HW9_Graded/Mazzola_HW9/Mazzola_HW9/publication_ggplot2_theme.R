publication <- function(base_size = 12) { 
	require(grid)        
	theme( 
                                        axis.line =         element_line(), 
                                        axis.text.x =       element_text(colour = "black", size = base_size * 2, vjust = 1, lineheight = 0.9, face="bold"), 
					axis.text.y =       element_text(colour = "black", size = base_size * 2, hjust = 1, lineheight = 0.9, face="bold"), 
                                        axis.ticks =        element_line(colour = "black"), 
                                        axis.title.x =      element_text(size = base_size*3, vjust = 0.5), 
                                        axis.title.y =      element_text(size = base_size*3, vjust = 0.5, angle = 90), 
                                        axis.ticks.length = unit(0.15, "cm"), 
                                        #depricated
                                        axis.text.x.top = element_text(margin = margin(5,5,10,5,"pt")), 
					                              axis.text.y.right = element_text(margin = margin(5,5,10,5,"pt")),
                                        
                                        legend.background = element_rect(colour="white"), 
                                        legend.key =        element_blank(), 
                                        legend.key.size =   unit(1.2, "lines"), 
                                        legend.text =       element_text(size = base_size * 1.2), 
                                        legend.title =      element_text(face = "bold", size = base_size * 1.2, hjust = 0), 
                                        legend.position =   "right", 
                                        
                                        panel.background =  element_blank(), 
                                        panel.border =      element_rect(fill=NA), 
                                        panel.grid.major =  element_blank(), 
                                        panel.grid.minor =  element_blank(), 
                                        panel.spacing =      unit(-1.0, "lines"), 
                                        
                                        strip.background =  element_rect(fill = "grey80", colour="black"), 
                                        strip.label =       function(variable, value) value, 
                                        strip.text.x =      element_text(size = base_size *5, face="bold"), 
                                        strip.text.y =      element_text(size = base_size *5, angle = -90, face="bold"), 
                                        
                                        plot.background =   element_rect(fill = "white", colour = NA), 
                                        plot.title =        element_text(size = base_size * 4, face="bold"), 
                                        plot.margin =       unit(c(1, 1, 0.5, 0.5), "lines") 
                        )
}
