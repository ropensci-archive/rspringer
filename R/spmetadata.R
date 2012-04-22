#' Search Springer metadata.
#' @import RCurl RJSONIO
#' @param terms search terms (character)
#' @param limit number of results to return (integer)
#' @param startrecord return results starting at the number specified (integer)
#' @param url the base Springer url for the function (should be left to default)
#' @param key your Springer API key, either enter, or loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return Number of search results and results in a data.frame.
#' @details Limited to 5 calls per second; 5000/day max.
#' @export
#' @examples \dontrun{
#' spmetadata(terms = 'dna', limit = 5)
#' spmetadata(terms = 'dna', limit = 5, verbose=TRUE) #debug mode
#' }
spmetadata <- function(terms = NA, limit = NA, startrecord = NA,
  url = 'http://api.springer.com/metadata/json',
  key = getOption("SpringerMetdataKey", stop("need a metadata API key for Springer Journals")),
  ...,  curl = getCurlHandle()) 
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
  list(numres, dfresults)
}