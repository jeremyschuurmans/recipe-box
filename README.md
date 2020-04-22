[![Build Status](https://travis-ci.com/palledorous/recipe-box.svg?branch=master)](https://travis-ci.com/palledorous/recipe-box)

# RecipeBox

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Deployment

Create Heroku apps for staging and prod.

```
bin/bootstrap-new-heroku-app.sh recipe-box-8l-staging staging staging
bin/bootstrap-new-heroku-app.sh recipe-box-8l prod prod
```

Then migrate the database

```
bin/migrate-db.sh recipe-box-8l-staging
bin/migrate-db.sh recipe-box-8l
```