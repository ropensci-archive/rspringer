\name{spoa}
\alias{spoa}
\title{Default function to search Springer open access material}
\usage{
  spoa(terms, limit, startrecord = NA,
    url = "http://api.springer.com/openaccess/json",
    key = getOption("SpringerOAKey", stop("need an open access API key for Springer Journals")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{terms}{search terms (character)}

  \item{limit}{number of results to return (integer)}

  \item{startrecord}{return results starting at the number
  specified (integer)}

  \item{fields}{fields to return from search (character)
  [e.g., 'id,title'], any combination of search fields [see
  plosfields$field]}

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
  Default function to search Springer open access material
}
\details{
  Limited to 5 calls per second; 5000/day max.
}
\examples{
\dontrun{
spoa(terms = 'dna', limit = 5)
spoa(terms = 'dna', limit = 5, verbose=TRUE) #debug mode
}
}

