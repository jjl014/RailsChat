# RailsChat

## Running The App
In the directory run:

* `bundle install`
* `bundle exec rails db:migrate`
* `rails s`
* Make requests to `localhost:3000/api/`

## Challenge Overview
* Create an API chat service
* Endpoints:
  * POST /chat - creates a new text message for the entered username.
  * GET /chat/:id - returns a message object given an id. Can return both expired and unexpired messages.
  * GET /chats/:username - returns a list of unexpired texts for the username given. All received texts are then expired.

## Functionality

## Tools
* `Ruby on Rails`
* Gems:
  * `redis-rails`
  * `pry-rails`

## Debugging and Testing
For debugging, I mainly used debugger and the rails console.

## Design
