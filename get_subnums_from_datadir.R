get_subnums_from_datadir <- function(location='current'){
  if (location=='current'){
    files <- dir()  
  } else {
    files <- dir(location)  
  }
  subnums<-unlist(str_extract_all(pattern="\\d\\d\\d\\d",files))
  subnums <- unique(subnums)
  subnums <- as.numeric(subnums)
  subnums <- subnums[subnums<9000] # remove pilots/tests
  return(unique(subnums))
  
}