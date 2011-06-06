# springer_OA.R, search Springer open access material

springer_OA <- 
# Default function to search Springer open access material
# Args:
#   terms: search terms (character)
#   limit: number of results to return (integer)
#   startrecord: return results starting at the number specified (integer)
#   fields: fields to return from search (character) [e.g., 'id,title'], 
#     any combination of search fields [see plosfields$field] 
# Examples:
#   springer_OA(terms = 'dna', limit = 5)
#   springer_OA(terms = 'dna', limit = 5, verbose=TRUE) #debug mode
function(terms, limit, startrecord = NA,
  url = 'http://api.springer.com/openaccess/json',
  key = getOption("springeropackey", stop("need an open access API key for Springer Journals")),
  ...,
  curl = getCurlHandle()) 
{  
  args <- list(api_key = key)
  if(!is.na(terms))
    args$q <- terms
  if(!is.na(limit))
    args$p <- limit
  if(!is.na(startrecord))
    args$s <- startrecord
  tt <- getForm(url, 
    .params = args, ...,
    curl = curl)
  jsonout <- fromJSON(tt)
  tempresults <- jsonout$records
  numres <- length(tempresults) # number of search results
  names(numres) <- 'Number of search results'
  dfresults <- data.frame( do.call(rbind, tempresults) )
  return(list(numres, dfresults))
}