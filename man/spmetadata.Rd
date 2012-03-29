\name{spmetadata}
\alias{spmetadata}
\title{Search Springer metadata.}
\usage{
  spmetadata(terms = NA, limit = NA, startrecord = NA,
    url = "http://api.springer.com/metadata/json",
    key = getOption("SpringerMetdataKey", stop("need a metadata API key for Springer Journals")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{terms}{search terms (character)}

  \item{limit}{number of results to return (integer)}

  \item{startrecord}{return results starting at the number
  specified (integer)}

  \item{url}{the base Springer url for the function (should
  be left to default)}

  \item{key}{your Springer API key, either enter, or loads
  from .Rprofile}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  Number of search results and results in a data.frame.
}
\description{
  Search Springer metadata.
}
\details{
  Limited to 5 calls per second; 5000/day max.
}
\examples{
\dontrun{
spmetadata(terms = 'dna', limit = 5)
spmetadata(terms = 'dna', limit = 5, verbose=TRUE) #debug mode
}
}

