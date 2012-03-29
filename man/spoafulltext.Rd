\name{spoafulltext}
\alias{spoafulltext}
\title{Get full text BioMedCentral (BMC) content from a given DOI.}
\usage{
  spoafulltext(doi,
    section = list("abstract", "introduction", "methods", "results", "discussion", "conclusion", "all", "references"),
    url = "http://api.springer.com/openaccess/app",
    key = getOption("SpringerOAKey", stop("need an open access API key for Springer Journals")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{doi}{DOI of the article.}

  \item{section}{Section of the paper you want returned
  (see options in help).}

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
  Full text of section of paper, or whole paper.
}
\description{
  Get full text BioMedCentral (BMC) content from a given
  DOI.
}
\examples{
\dontrun{
spoafulltext(doi = '10.1186/1472-6785-11-29', section = 'abstract')
spoafulltext(doi = '10.1186/1472-6785-11-29', section = 'body')
}
}

