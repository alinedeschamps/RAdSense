library(httr)
source("R/Auth.R")
source("R/ValidateToken.R")
source("R/Query.R")
source("R/ParseApiErrorMessage.R")
source("R/ParseDataFeedJSON.R")
source("R/Init.R")

token <- Auth(client.id="203000737936-robgs12eniuap5lefbn4hkg89ofmvnt5.apps.googleusercontent.com",client.secret="aYMhQfz5-IHkpzIf9R2xWxZp")

ValidateToken(token)

accountId <- "pub-4969366395857149"

uri <- initQuery(accountId, token)
uri <- paramQuery(uri, "2015-05-18", "2015-05-17", "AD_CLIENT_ID,AD_UNIT_ID", "EARNINGS", "AD_UNIT_ID%3D%3Dca-app-pub-4969366395857149:1381436313,AD_UNIT_ID%3D%3Dca-app-pub-4969366395857149:2858169515")

data <- executeQuery(uri)
