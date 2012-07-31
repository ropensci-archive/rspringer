#' Search open access springer images.
#' 
#' @import RCurl XML RJSONIO
#' @param terms search terms (character)
#' @param limit number of results to return (integer)
#' @param startrecord return results starting at the number specified (integer)
#' @param url the base Springer url for the function (should be left to default)
#' @param key your Springer API key, either enter, or loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @keywords Literature, Springer
#' @seealso rplos (https://github.com/ropensci/rplos)
#' @return List
#' @details Limited to 1 call per second. 5000/day max.
#' @examples \dontrun{
#' spimages(terms = 'dna', limit = 5)
#' spimages(terms = 'dna', limit = 5, verbose=TRUE) #debug mode
#' }
#' @export
spimages <- function(terms, limit, startrecord = NA,
  url = 'http://api.springer.com/images/json',
  key = getOption("SpringerImagesKey", stop("need an images API key for Springer Journals")),
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