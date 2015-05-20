# simpleGraphFormatting
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

# example:
# p2 <- ggplot(subLvlTest,aes(x=Group,y=cvStudy_acc,color=Group))+
#   geom_boxplot(width=.6,size=1)+
#   geom_point(size = 2)+
#   ggtitle("Face vs. Place: Encoding")+
#   scale_y_continuous(name="Cross-Validated Classifier Accuracy",limits=c(0,1))+
#   geom_hline(aes(yintercept=.5),color='lightgray',linetype='33',size=1.25)+
#   scale_x_discrete()
# 
# makeagraph(p2)