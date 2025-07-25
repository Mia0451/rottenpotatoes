source "https://rubygems.org"
 
ruby "3.3.8"
gem "rails", "~> 7.1"
gem "mutex_m"
 
gem "sass-rails", "~> 5.0.3"
gem "uglifier", ">= 2.7.1"
 
gem "jquery-rails"
 
group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem "web-console", "~> 2.0"
end
 
# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem "byebug"
  gem "cucumber-rails", require: false
  gem "database_cleaner"
  gem "rspec-rails"
 
  gem "pry"
  gem "pry-byebug"
 
  # Use sqlite3 as the database for Active Record
  # gem "sqlite3", "~> 1.4"
  gem "sqlite3"
end
 
group :production do
  gem "pg"
  gem "rails_12factor"
end