### function to trim outliers. returns boolean (w/in window or not) option to give cutoffs (returned in list)
trimmer <- function(x,return_cutoffs = FALSE ){
  Q1 <- quantile(x)[[2]]
  Q3 <- quantile(x)[[4]]
  IQ <- Q3 - Q1
  maxnonoutlier <- Q3 + 1.5*IQ
  minnonoutlier <- Q1 - 1.5*IQ
  x <- (x > minnonoutlier & x < maxnonoutlier)
  if (return_cutoffs == TRUE){
    return(list(data=x, min_cutoff=minnonoutlier,max_cutoff=maxnonoutlier))
  } else (return(x))
}