# Challah Example App

This application is available at [http://challah-example.herokuapp.com/](http://challah-example.herokuapp.com/). Every hour the database is reset, so any users created will be destroyed.

A sample Rails **3.2.9** application using [Challah](https://github.com/jdtornow/challah) **0.8.3**.

## Set up

1. Clone
2. `bundle install`
3. Set up a database.yml file in config/
4. `bundle exec rake challah:setup`