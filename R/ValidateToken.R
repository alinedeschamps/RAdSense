ValidateToken <- function(token) {
  
  # Check whether there is a previously stored access token
  
  if (!token$validate()) {
    RefreshToAccessToken(token)
    cat("Access Token successfully updated\n")
  } else {
    cat("Access Token is valid\n")
  }
  
  return(invisible())   
}