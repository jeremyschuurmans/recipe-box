#!/usr/bin/env bash
set -uex

APP_NAME=$1
REMOTE_NAME=$2
MIX_ENV=$3

# Create a new heroku app with elixir and phoenix buildpacks
heroku create $APP_NAME --buildpack hashnuke/elixir --remote $REMOTE_NAME
heroku buildpacks:add https://github.com/gjaldon/heroku-buildpack-phoenix-static.git --app $APP_NAME

heroku addons:create heroku-postgresql:hobby-dev --app $APP_NAME
heroku config:set POOL_SIZE=18 --app $APP_NAME
heroku config:set SECRET_KEY_BASE=$(mix phx.gen.secret) --app $APP_NAME
heroku config:set MIX_ENV=$MIX_ENV