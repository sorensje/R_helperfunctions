## scale and recode continuous as 1 sd above, 1 sd below

v1 <- rnorm(100, 4, 3)
v1S <- scale(v1)
# cut(v1S,3)
v1Q <- quantile(v1S,sapply(0:3, function(x)x/3))


scale_and_recode <- function(v1,method = "sd.1.above.1.bleow", bins = 3, scale = TRUE){
  
  
  match.arg(method, c("sd.1.above.1.bleow","probBins"))
  if(method == "sd.1.above.1.bleow"){
    v1S <- scale(v1)
    v1S[v1S <= -1 ]  <- -1
    v1S[v1S > -1 & v1S < 1 ]  <- 0
    v1S[v1S >= 1 ]  <- 1
    v1S <- factor(v1S, labels = c('1 sd below', 'middle', '1 sd above'))
    
  } else if(method == "probBins"){
    if(scale) v1 <- scale(v1)
    v1S <- cut(v1, breaks = quantile(v1,na.rm = TRUE,
                                      sapply(0:bins, function(x)x/bins)),
               include.lowest = TRUE)
    
  }
  
 return(v1S)
}


