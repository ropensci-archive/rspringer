\name{spimages}
\alias{spimages}
\title{Search open access springer images.}
\usage{
  spimages(terms, limit, startrecord = NA,
    url = "http://api.springer.com/images/json",
    key = getOption("SpringerImagesKey", stop("need an images API key for Springer Journals")),
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
  List
}
\description{
  Search open access springer images.
}
\details{
  Limited to 1 call per second. 5000/day max.
}
\examples{
\dontrun{
spimages(terms = 'dna', limit = 5)
spimages(terms = 'dna', limit = 5, verbose=TRUE) #debug mode
}
}
\seealso{
  rplos (https://github.com/ropensci/rplos)
}
\keyword{Literature,}
\keyword{Springer}

