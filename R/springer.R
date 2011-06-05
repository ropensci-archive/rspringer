##### Springer Journals API queries code
require(RCurl)
require(RJSONIO)
require(XML)

#
options(metdatkey = "2pn639bshyrju39zfewygkgd")
options(imageskey = "m9h7pzrvym7x5zzebnngvzp6")
options(opackey = "4qv484abnnptychrn52y9rb4")
metdatkey <- "2pn639bshyrju39zfewygkgd"
imageskey <- "m9h7pzrvym7x5zzebnngvzp6"
opackey <- "4qv484abnnptychrn52y9rb4"

# FUNCTIONS
springer_metadata <- function(terms, limit, startrecord = NA,
  url = 'http://api.springer.com/metadata/json',
  apikey = getOption("metdatkey", stop("need a metadata API key for Springer Journals")), ..., curl=getCurlHandle()) {
# Default function to search Springer metadata
# Args:
#   terms: search terms (character)
#   limit: number of results to return (integer)
#   startrecord: return results starting at the number specified (integer)
#   fields: fields to return from search (character) [e.g., 'id,title'], 
#     any combination of search fields [see plosfields$field] 
# Examples:
#   options(metdatkey = "2pn639bshyrju39zfewygkgd")
#   springer_metadata(terms = 'biotechnology', limit = 5)
#   springer_metadata(terms = 'dna', limit = 5, verbose=TRUE) #debug mode
  args <- list(api_key = apikey)
  if(!is.na(terms))
    args$q <- terms
  if(!is.na(limit))
    args$p <- limit
  if(!is.na(startrecord))
    args$s <- startrecord
  tt <- getForm(url, 
    .params = args, ..., curl=curl)
  jsonout <- fromJSON(tt)
  tempresults <- jsonout$records
  numres <- length(tempresults) # number of search results
  names(numres) <- 'Number of search results'
  dfresults <- data.frame( do.call(rbind, tempresults) )
  return(list(numres, dfresults))
}

# springer_images <- function(terms, limit, startrecord,
#   url = 'http://api.springer.com/images/json',
#   apikey = getOption("imageskey", stop("need an images API key for Springer Journals"))) {

# springer_OA <- function(terms, limit, startrecord,
#   url = 'http://api.springer.com/openaccess/json',
#   apikey = getOption("opackey", stop("need an open access API key for Springer Journals"))) {




