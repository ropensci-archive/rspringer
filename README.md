# rspringer #


UPDATE - THE SPRINGER API IS A MESS AS FAR AS WE CAN TELL. E.G., YOU CAN'T GET MORE THAN 20 OR SO RECORDS BACK IN AN API CALL, AND THE JSON RETURNED RESPONSE IS DIFFERENT FROM XML (IT DOESN'T INCLUDE THE ABSTRACT FOR EXAMPLE). WILL POSSIBLY WORK ON THIS AGAIN WHEN THEIR API IS IMPROVED... BAD API'S MAKE ME SAD --> :(



`rspringer` provides programmatic access to the Springer API via R as part of the `ropensci` suite (see http://ropensci.org for more information).

## Usage

1. First register API keys
http://dev.springer.com/
You should receive a set of 3 keys.

2. Add keys to your .rprofile for automatic loading.

## Installation


#### Development Version
You can obtain a most current development version of the package from github. For easier installation:

```R
require(devtools)
install_github("rspringer", "ropensci")
require(rspringer)
```

#### Stable version
Stable version will shortly be available on CRAN.


# Related apps using the same API
+ Springer Quotes: http://springerquotes.heroku.com/
+ Kleenk - http://kleenk.com/
+ Journal Suggest - http://journalsuggest.appspot.com/