#' Search Springer metadata.
#' 
#' @import RCurl RJSONIO
#' @param terms search terms (character)
#' @param limit number of results to return (integer), 10 default, 100 max
#' @param startrecord return results starting at the number specified (integer)
#' @param url the base Springer url for the function (should be left to default)
#' @param key your Springer API key, either enter, or loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return Number of search results and results in a data.frame.
#' @details Limited to 5 calls per second; 5000/day max.
#' @examples \dontrun{
#' spmetadata(terms = 'dna', limit = 5)
#' out <- spmetadata(terms = 'dna', limit = 40)
#' length(out)
#' spmetadata(terms = 'dna', limit = 5, verbose=TRUE) #debug mode
#' }
#' @export
spmetadata <- function(terms = NULL, limit = NULL, startrecord = NULL,
  url = 'http://api.springer.com/metadata/pam',
  key = getOption("SpringerMetdataKey", stop("need a metadata API key for Springer Journals")),
  ...,  curl = getCurlHandle()) 
{  
	args <- compact(list(api_key = key, q = terms, p = limit, s = startrecord))
  tt <- getForm(url, 
    .params = args, 
#   	...,
    curl = curl)		
# 	content(GET(url, query=args), type="application/json")	
  jsonout <- fromJSON(tt)
  tempresults <- jsonout$records
  data.frame( do.call(rbind, tempresults) )
}