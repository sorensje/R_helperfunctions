zeropad <- function(x){
  if (x %/% 10 < 1){
    padded_x <- paste('0',x,sep="")
    }
  else{
    padded_x <- as.character(x)
  }
  return(padded_x)
}