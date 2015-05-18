Auth <- function(client.id,client.secret) {
  
  # Whether to allow user to save client secret to disk?
  
  myapp <- oauth_app("google", client.id,
                     client.secret)
  google.token <- oauth2.0_token(oauth_endpoints("google"), myapp,
                  scope = "https://www.googleapis.com/auth/adsense.readonly")
  return(google.token)
}