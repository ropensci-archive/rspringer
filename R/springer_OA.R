#' Default function to search Springer open access material
#' @param terms search terms (character)
#' @param limit number of results to return (integer)
#' @param startrecord return results starting at the number specified (integer)
#' @param fields fields to return from search (character) [e.g., 'id,title'], 
#'     any combination of search fields [see plosfields$field] 
#' @return Number of search results and results in a data.frame.
#' @export
#' @examples \dontrun{
#' springer_oa(terms = 'dna', limit = 5)
#' springer_oa(terms = 'dna', limit = 5, verbose=TRUE) #debug mode
#' }
springer_oa <- 
  
function(terms, limit, startrecord = NA,
  url = 'http://api.springer.com/openaccess/json',
  key = getOption("SpringerOAKey", stop("need an open access API key for Springer Journals")),
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
# Limited to 5 calls per second. 5000/day max.
