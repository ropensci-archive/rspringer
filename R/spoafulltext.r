#' Get full text BioMedCentral (BMC) content from a given DOI.
#' 
#' @import RCurl XML
#' @param doi DOI of the article.
#' @param section Section of the paper you want returned (see options in help).
#' @param url the base Springer url for the function (should be left to default)
#' @param key your Springer API key, either enter, or loads from .Rprofile
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint) 
#' @return Full text of section of paper, or whole paper.
#' @examples \dontrun{
#' spoafulltext(doi = '10.1186/1472-6785-11-29', section = 'abstract')
#' spoafulltext(doi = '10.1186/1472-6785-11-29', section = 'body')
#' }
#' @export
spoafulltext <- function(doi, 
  section = list("abstract","introduction","methods","results",
                "discussion","conclusion","all","references"), 
  url = 'http://api.springer.com/openaccess/app',
  key = getOption("SpringerOAKey", 
      stop("need an open access API key for Springer Journals")),
  ..., curl = getCurlHandle()) 
{  
  args <- list(api_key = key)
  if(!is.na(doi))
    args$q <- paste("doi:", doi, sep='')
  tt <- getForm(url, 
      .params = args, 
#       ...,
      curl = curl)
  ttxml <- xmlParse(tt)
  if(section == "abstract"){
    xmlValue(xpathApply(ttxml, '//Abstract')[[1]])} else
  if(section == "body"){
    xpathSApply( xpathApply(ttxml, '//Body')[[1]], '//Para')
#     headings <- xpathSApply( xpathApply(ttxml, '//Body')[[1]], '//Heading')
    }
#   if(section == 'introduction'){
#     xmlValue(
#       x <- getNodeSet(ttxml, '//Body')
#       x[[1]]
#       xpathApply(x[[1]], "//Heading:Background")
#       )
#     } else
#   if(section == 'methods'){
#     xmlValue(xpathApply(ttxml, '//Methods')[[1]])} else
#   if(section == 'results'){
#     xmlValue(xpathApply(ttxml, '//Results')[[1]])} else
#   if(section == 'discussion'){
#     xmlValue(xpathApply(ttxml, '//Discussion')[[1]])} else
#   if(section == 'Conclusion'){
#     xmlValue(xpathApply(ttxml, '//Conclusion')[[1]])} else
#   if(section == 'all'){
#     xmlValue(xpathApply(ttxml, '//all')[[1]])} else
#   if(section == 'references'){
#     xmlValue(xpathApply(ttxml, '//Biblio')[[1]])}
}