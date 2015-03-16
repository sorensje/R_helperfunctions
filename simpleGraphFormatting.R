simpleGraphFormatting

source("~/Dropbox/R/summary within.R")
theme_set(theme_bw())
## convenience function that you can use for multpile plots to set the sizes of things
makeagraph <- function(theGGPlot){
  theme_set(theme_bw())
  theGGPlot<-theGGPlot+ theme(plot.title = element_text(size=20, face="bold"))
  theGGPlot<-theGGPlot+ theme(axis.title.x = element_text(size=16, face="bold"))
  theGGPlot<-theGGPlot+ theme(axis.title.y = element_text(size=16, face="bold",angle=90))
  theGGPlot<-theGGPlot+ theme(axis.text.x= element_text(size=12))
  theGGPlot<-theGGPlot+ theme(axis.text.y= element_text(size=16,angle=90))
  theGGPlot<-theGGPlot+ theme(strip.text.x= element_text(size=12))     
  print(theGGPlot) 
}