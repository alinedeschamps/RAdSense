Init <- function(
  start.date = NULL,
  end.date = NULL,
  dimensions = NULL,
  metrics = NULL,
  filters = NULL,
  sort = NULL,
  segments = NULL,
  max.results = NULL,
  start.index = NULL,
  table.id = NULL){
  
  query.params.list = list("start.date" = start.date,
                 "end.date" = end.date,
                 "dimensions" = dimensions,
                 "metrics" = metrics,
                 "filters" = filters,
                 "sort" = sort,
                 "max.results" = max.results,
                 "start.index" = start.index)
  
  return(query.params.list)
}
