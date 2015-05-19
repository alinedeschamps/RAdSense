initQuery <- function(accountId, token) {
  uri <- paste("https://www.googleapis.com/adsense/v1.4/accounts/", accountId, "/reports?")
  uri <- addParam(uri, "access_token", token$credentials$access_token)
  
  uri <- gsub("\\s", "", uri)
  
  return(uri)
}

paramQuery <- function(uri, 
                       endDate, 
                       startDate, 
                       dimensions, 
                       metrics,
                       filters,
                       maxResults = 50000) {
  
  uri <- addParam(uri, "endDate", endDate)
  uri <- addParam(uri, "startDate", startDate)
  
  if (!is.null(dimensions) && dimensions != "") {
    splitDim <- strsplit(dimensions, "\\,")
    for(dim in splitDim){
      for(d in dim){
        uri <- addParam(uri, "dimension", d)
      }
    }
  }
  
  if (!is.null(metrics) && metrics != "") {
    uri <- addParam(uri, "metric", metrics)
  }
  
  if (!is.null(filters) && filters != "") {
    uri <- addParam(uri, "filter", filters)
  }
  
  uri <- addParam(uri, "maxResults", maxResults)
  
  uri <- sub("&$", "", uri)
  uri <- gsub("\\s", "", uri)
  
  return(uri)
}

addParam <- function(uri, paramName, paramValue) {
  uri <- paste(uri, paramName, "=", paramValue, "&", sep = "", collapse = "")
}

executeQuery <- function(uri) {
  GA.Data <- GET(uri)
  GA.list <- ParseDataFeedJSON(GA.Data)
  if (is.null(GA.list$rows)) {
    cat("Your query matched 0 results. Please verify your query using the Query Feed Explorer and re-run it.")
    break
  } else {
    return (GA.list)
  }
}