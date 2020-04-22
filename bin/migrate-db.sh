#!/usr/bin/env bash

set -uex

APP_NAME=$1

# migrate the database

heroku run mix ecto.migrate --app $APP_NAME