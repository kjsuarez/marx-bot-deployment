# An example of a fully deployable Discord bot

## Local Setup

Create a .env file and add a Discord Bot token to it.

* `bundle install`
* `brew services start redis`
* `bundle exec sidekiq -c 1 -v`
* `rails s`

Going to localhost:3000 will start a sidekiq job that connects a web socket to discord and keeps it open. The index controller will only allow one of these processes to run at a time.

## Heroku Deployment
* init heroku application
* include heroku reddis addon
* add ENV var REDIS_PROVIDER=REDIS_URL
* add BOT_TOKEN ENV var
* In heroku resources tab, turn on worker dyno (defined in Procfile)
* Push app to Heroku
