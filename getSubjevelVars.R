# dataDF <- finalTestDat
# idVar <- 'subID'

getSubjLevelVars <- function(dataDF, idVar){
  
  oneValue <- function(x)length(unique(x)) == 1
  vars2try <- setdiff(names(dataDF),idVar)
  sublevelVars <- idVar
  for( var in vars2try){
    form <- formula(paste(var, " ~ ", idVar, sep = ""))
    
    if(all(aggregate(form, dataDF, oneValue)[2] == TRUE)){
      sublevelVars <- c(sublevelVars, var)
    }     
  }
#   print(sublevelVars)
  sublevelVars
}