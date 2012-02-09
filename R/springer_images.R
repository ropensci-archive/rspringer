#` springer_images.R
#`
#` Default function to search images in Springer journals
#` @param "terms" Search terms
#` @param "limit" Number of results
#` @param "startrecord" Offset if continuing from earlier search
#` @param "url" API pattern
#` @param "key" Your Springer key (available here: http://dev.springer.com/)
#`   fields: fields to return from search (character) [e.g., 'id,title'],
#     any combination of search fields [see plosfields$field]
#` @keywords Literature, Springer
#` @seealso rplos (https://github.com/ropensci/rplos)
#` @return List
#` @alias none
#` @export
#` @examples
#` springer_images(terms = 'dna', limit = 5)
#` springer_images(terms = 'dna', limit = 5, verbose=TRUE) #debug mode
springer_images <-function(terms, limit, startrecord = NA,
  url = 'http://api.springer.com/images/json',
  key = getOption("SpringerImagesKey", stop("need an images API key for Springer Journals")),
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
# Limited to 1 call per second. 5000/day max.
