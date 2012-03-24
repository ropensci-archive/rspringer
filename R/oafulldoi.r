#' Get full text BMC content from a given DOI.
#' @param doi DOI of the article.
#' @param section Section of the paper you want returned (see options in help).
#' @return Full text of section of paper, or whole paper.
#' @export
#' @examples \dontrun{
#' oafulldoi(doi = '10.1186/1472-6785-11-29', section = 'abstract')
#' oafulldoi(doi = '10.1186/1741-7007-8-86', section = 'abstract')
#' }
oafulldoi <- 

function(doi, 
         section = list("abstract","introduction","methods","results",
                        "discussion","conclusion","all","references"), 
         url = 'http://api.springer.com/openaccess/app',
         key = getOption("springeropackey", 
            stop("need an open access API key for Springer Journals")),
         ...,
         curl = getCurlHandle()) 
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
    xpathApply( xpathApply(ttxml, '//Body')[[1]], '//Para')
    
    xpathApply( xpathApply(ttxml, '//Body')[[1]], '//Heading')
  
    xpathApply(xpathApply(ttxml, '//Body')[[1]], "")
      
    if(section == 'introduction'){
      xmlValue(xpathApply(ttxml, '//Introduction')[[1]])} else
        if(section == 'methods'){
          xmlValue(xpathApply(ttxml, '//Methods')[[1]])} else
            if(section == 'results'){
              xmlValue(xpathApply(ttxml, '//Results')[[1]])} else
                if(section == 'discussion'){
                  xmlValue(xpathApply(ttxml, '//Discussion')[[1]])} else
                    if(section == 'Conclusion'){
                      xmlValue(xpathApply(ttxml, '//Conclusion')[[1]])} else
                        if(section == 'all'){
                          xmlValue(xpathApply(ttxml, '//all')[[1]])} else
                            if(section == 'references'){
                              xmlValue(xpathApply(ttxml, '//Biblio')[[1]])} else
                                stop
#   xpathApply(datxml, '//Para')
#   getNodeSet(datxml, '/Para')
#   dat[[4]][[1]][[2]][[2]][[2]][[8]]$Abstract$Para
  
#   dat2[[4]][[1]][[2]][[2]][[2]][[9]] # body
#   dat2[[4]][[1]][[2]][[2]][[2]][[11]] # references
}