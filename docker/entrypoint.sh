#!/bin/bash

rm -f /projeto/tmp/pids/server.pid
bundle install
rails db:drop
rails db:create
rails db:migrate
# rails db:seed
rails server --binding 0.0.0.0 --port $APPLICATION_PORT
