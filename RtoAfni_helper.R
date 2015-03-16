### R<-->AFNI helper functions

afni_getvols <- function(scanfilename) {  
  x <- paste('/Users/Jim/abin/3dinfo -nv ', scanfilename,sep="")
  blah<-system(x,intern=TRUE)
  blah
}


afni_getbetas <- function(bucketfilename,index,mask){
  #bucket assumed in current dir, something like PARC_sub_2718.personplace.t.rbuck+tlrc
  command <- paste('/Users/Jim/abin/3dmaskdump -mask ',mask,' -noijk ',bucketfilename,'\'[',index,'\']',sep="")
  betas <- system(command,intern=TRUE)
  as.numeric(betas)
}


afni_getavgbeta <- function(bucketfilename,index,mask){
  command <- paste('/Users/Jim/abin/3dmaskave -mask ',mask,' -quiet ',bucketfilename,'\'[',index,']\'',sep="")
  betas <- system(command,intern=TRUE)
  as.numeric(betas)
}


