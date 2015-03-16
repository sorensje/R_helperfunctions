###
# geo utilities from project. series of helper functions for geo location. based off of formulas
# and reccomendations from http://www.movable-type.co.uk/scripts/latlong.html

computeDistance <- function(lat1, lon1, lat2, lon2, mode = "eRect"){
  # helper function to compute distance between 2 points, given the latitude and longitude
  
  # todo: add more complex interpolation.
  mode <- match.arg(mode, c("eRect","haversine"))
  
  earthR <- 6371 # approximation of Earth's radius good enough for small distances
  # input to function will be in degrees
  lat1_rad <- (lat1 * pi )/180
  lon1_rad <- (lon1 * pi )/180
  lat2_rad <- (lat2 * pi )/180
  lon2_rad <- (lon2 * pi )/180
  
  if(mode == "eRect"){
    x <- (lon2_rad - lon1_rad) * cos((lat1_rad + lat2_rad)/2)
    y <- lat1_rad - lat2_rad
    d <- earthR * sqrt(x^2 + y^2)
    return(d)
  }
}

getDestination <- function(lat1, lon1, bearing, dist){
  # get lat and longitude of new point given origin, bearing and distance (in km)
  
  # distance should be in km
  earthR <- 6371 # approximation, good enough for small distances
  
  lat1_rad <- (lat1 * pi )/180
  lon1_rad <- (lon1 * pi )/180
  b_rad <- (bearing * pi )/180
  sin_dR <- sin(dist/earthR)
  cos_dR <- cos(dist/earthR)
  
  # compute new lat/long
  lat2_rad <- asin(sin(lat1_rad)*cos_dR + cos(lat1_rad) * sin_dR * cos(b_rad))
  lon2_rad <- lon1_rad + atan2(sin(b_rad) * sin_dR *cos(lat1_rad),
                               cos_dR - sin(lat1_rad) * sin(lat2_rad))
  lat2 <- (lat2_rad *180)/pi
  lon2 <- (lon2_rad *180)/pi
  list(lat = lat2, lon = lon2)
}