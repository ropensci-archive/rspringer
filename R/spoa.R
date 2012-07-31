#' Search Springer open access material.
#' 
#' @import RCurl XML RJSONIO
#' @param terms search terms (character)
#' @param limit number of results to return (integer), 10 default, 100 max
#' @param startrecord return results starting at the number specified (integer)
#' @param fields fields to return from search (character) [e.g., 'id,title'], 
#'     any combination of search fields [see plosfields$field] 
#' @param url the base Springer url for the function (should be left to default)
#' @param key your Springer API key, either enter, or loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return Number of search results and results in a data.frame.
#' @details Limited to 5 calls per second; 5000/day max.
#' @examples \dontrun{
#' spoa(terms = 'dna', limit = 99)
#' spoa(terms = 'dna', limit = 5, verbose=TRUE) #debug mode
#' }
#' @export
spoa <- function(terms, limit, startrecord = NA,
  url = 'http://api.springer.com/openaccess/json',
  key = getOption("SpringerOAKey", stop("need an open access API key for Springer Journals")),
  ..., curl = getCurlHandle()) 
{  
  args <- list(api_key = key)
  if(!is.na(terms))
    args$q <- terms
  if(!is.na(limit))
    args$p <- limit
  if(!is.na(startrecord))
    args$s <- startrecord
  tt <- getForm(url, 
    .params = args, 
  	...,
    curl = curl)
  jsonout <- fromJSON(tt)
  tempresults <- jsonout$records
  data.frame( do.call(rbind, tempresults) )
}