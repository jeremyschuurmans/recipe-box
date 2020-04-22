#!/usr/bin/env

# Create a deploy key for the current Heroku account
travis encrypt $(heroku auth:token) --add deploy.api_key --pro