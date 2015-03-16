### fix dcast names
# helper function to take care of problems in names generated from levels of variable
# remove white space
# take care of presence of numbers in names
# change binary 0/1 to no/yes
# if more than 2 numbers, just prepend "_" to names


fixDCastNames <- function(dcast_dat){
  oldNames <- names(dcast_dat)
  newNames <- gsub(" ","",oldNames) #whitespace
  # test for binary case, if find, replace 0/1 w/ yes/no
  nNumbers <- sum(is.finite(suppressWarnings(as.numeric(newNames))))
  if (nNumbers==2){ 
    newNames <- gsub("0","no",newNames)
    newNames <- gsub("1","yes",newNames)
  } else if (nNumbers >2){
    for (i in newNames[is.finite(as.numeric(newNames))]){
      newNames <- gsub(as.character(i),paste("_",i,sep=""),newNames)
    }
  }
  return(newNames)
}