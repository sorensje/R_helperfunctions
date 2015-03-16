### function to z score by subject
# example usage: blah <- zscorer(prompts_trimmed_MDDvCTL,'change_pos','subID')

#debugging vars
data <- prompts_trimmed_MDDvCTL
var2score <- 'change_pos'
unit2bin <- 'subID'
rm(var2score,data,unit2bin)


zscorer <- function(data,var2score,unit2bin){
  formu2use <- paste(var2score,unit2bin,sep="~")
  unit_means <- aggregate(as.formula(formu2use),data,mean)
  names(unit_means) <- c(unit2bin,paste(var2score,unit2bin,'mean',sep="_"))
  unit_sds<- aggregate(as.formula(formu2use),data,sd)
  names(unit_sds) <- c(unit2bin,paste(var2score,unit2bin,'sd',sep="_"))
  dat2merge <- merge(unit_means,unit_sds,sort=F)
  
  # zscore
  dat4_zscore <- merge(data[,c(unit2bin,var2score)],dat2merge,sort=F)
  dat4_zscore <- merge(data,dat2merge,sort=F)
  
  dat4_zscore[,paste(var2score,unit2bin,'z',sep="_")] <- (dat4_zscore[,var2score]-dat4_zscore[,paste(var2score,unit2bin,'mean',sep="_")])/dat4_zscore[,paste(var2score,unit2bin,'sd',sep="_")] #hacky! should improve
  dat4_zscore[,paste(var2score,unit2bin,'mean',sep="_")] <- NULL
  dat4_zscore[,paste(var2score,unit2bin,'sd',sep="_")] <- NULL
  outdata <- dat4_zscore
  outdata
#   dat2out <- dat4_zscore[,c(unit2bin,var2score,'zscored')]
#   names(dat2out) <- c(unit2bin,var2score,paste(var2score,unit2bin,'z',sep="_"))
#   outdata <- merge(data,dat2out,all.x=T,all.y=T,sort=F)
}

