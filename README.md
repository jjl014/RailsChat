# RailsChat

## Running The App
In the directory run:

* `bundle install`
* `bundle exec rails db:migrate`
* `rails s`
* Make requests to `localhost:3000`

## Challenge Overview
* Create an API chat service
* Endpoints:
  * `POST /chat` - creates a new text message for the entered username.
  * `GET /chat/:id` - returns a message object given an id. Can return both expired and unexpired messages.
  * `GET /chats/:username` - returns a list of unexpired texts for the username given. All received texts are then expired.

## Tools
* `Ruby on Rails`
* Gems:
  * `redis-rails`
  * `pry-rails`
  * `rspec-rails`
  * `annotate`

## Debugging and Testing
For debugging, I mainly used debugger and the rails console. As for testing, I used RSpec to test the Chat model's validations. For the controllers, I wasn't able to test it correctly since I kept getting a missing template error (possibly due to not having an actual html view), so I scrapped the controller tests.

## Design
For the schema, I used the required columns(username, test, timeout) and also added a new column, expired, which is a boolean to keep track of chats that were already expired. That way, whenever we query the database, it will ignore all the chats that have been expired already. I also added indexing on the username column to speed up the queries.

I added a callback to index action so that after it has been called, all the chats that were received from the query would have their expired column set to true. So future queries will ignore these chats, which was the intended functionality.

Using Redis, I was able to save individual chats to the cache. Any additional requests with the same id won't query the database and instead pull its data from the cache.

## Challenges
I'm not sure if it's Rails or if it might just be me, but sometimes I would run into the issue where accessing a property of an active record object would return private method error.

Otherwise, one of the main challenges was trying to use Redis with rails. I was only able to cache specific messages individually, so when you make a request to '/chat/:id' with the same id, it'll pull the data from the cache rather than the database.

I was really disappointed that I wasn't able to figure out how to cache post request data, so that the data can exist in both the redis cache as well as the database.

## Future Directions
* Save POST request data to Redis cache as well as database
* Push Rails API server to Heroku and make use of their NGINX load balancer.
