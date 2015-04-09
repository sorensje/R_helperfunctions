aggregate_into_DF <- function(dataDF, form, fun, newVarName, inNewDF = TRUE){
  
#   if(!is.na(subsetExp) & ! is.na(subsetVar)){
#     
#   }
#   print(c("\n",substitute(dataDF)," type:  ", expression(substitute(dataDF)),"\n"))
  
  
  # convenience function that returns original df w/ new aggregated variable (maintains long form)
  # dataDF df to aggregate
  # form: formula for aggregation (as character)
  # fun: function to sweep over
  # newVarName: label for new variable
  ## inNewDF: boolean indicating whether new ag var should be returned as part of original DF
    # is meant to be used when you have a subset, or just don't want to put the new var in your DF right away
    # inNewDF == FALSE turns this function into a fancy aggregate w/ renaming of the var
  
  
  # example: cars2 <- aggregate_into_DF(mpg, 'hwy~cyl+year', mean, 'cylYearAvg')
#   xtabs(~ cylYearAvg + cyl, cars2)
#   xtabs(~ cyl  + year + cylYearAvg, cars2)
  
  if(any(names(dataDF) == newVarName)){
    cat('name conflict, original DF returned')
    return(dataDF)
  }
  
  form <-formula(form)
  # check vars in formula are in df
  if(!all(attr(terms.formula(form),"term.labels") %in% names(dataDF))){
    cat('varibles in formula not in DF, original DF returned')
    return(dataDF)
  }
  
  # agg and rename
  aggDF <- aggregate(form, dataDF, fun) # sweep func
  names(aggDF) <- c(names(aggDF)[1: (length(aggDF) -1)],newVarName) # rename variable
  
  # should we bother putting new agg var into df?
  if(inNewDF == FALSE){
    return(aggDF)
  }
  
  newDF <- merge(dataDF,aggDF, all.x = TRUE) #combine
  if(nrow(newDF) == nrow(dataDF) & 
       sum(is.na(newDF[, newVarName])) != nrow(dataDF)){
    # basic checks: is the new df the expected size, is the new variable not just a string of NAs?
    return(newDF)
  } else{
    cat('error is aggregation, original df returned')
    return(dataDF)
  }
}



