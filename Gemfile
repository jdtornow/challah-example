source "https://rubygems.org"

ruby "2.1.0"

gem "rails", "4.0.3"

gem "pg"
gem "haml-rails"
gem "challah", "~> 1.1"

group :assets do
  gem "sprockets-rails", "~> 2.0"
  gem "sass-rails", "~> 4.0"
  gem "coffee-rails", "~> 4.0"
  gem "uglifier"
end

group :development do
  gem "better_errors"
  gem "dotenv"
  gem "pry-rails"
end

group :test do
  gem "factory_girl_rails"
  gem "mocha", require: false
  gem "rspec-rails"
  gem "simplecov"
  gem "turn"
end

group :production do
  gem "thin"
  gem "rails_12factor"
end
