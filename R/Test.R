library(httr)
source("R/Auth.R")
source("R/ValidateToken.R")

token <- Auth(client.id="203000737936-robgs12eniuap5lefbn4hkg89ofmvnt5.apps.googleusercontent.com",client.secret="aYMhQfz5-IHkpzIf9R2xWxZp")

ValidateToken(token)
