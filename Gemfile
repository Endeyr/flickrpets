source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "active_type"
gem "bcrypt"
gem "bootsnap", require: false
gem "importmap-rails"
gem "pg", "~> 1.1"
gem "pgcli-rails"
gem "puma", "~> 5.0"
gem "rack-canonical-host"
gem "rails", "~> 7.0.3"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem 'simple_form'
gem 'bootstrap', '~> 5.2'
gem "figaro"
gem 'flickr', '~> 2.1'
gem 'jquery-rails', '~> 4.5'
gem 'json', '~> 2.6', '>= 2.6.2'
gem 'rest-client', '~> 2.1'
gem "http"

group :production do
  gem "postmark-rails"
  gem "sidekiq"
end

group :development do
  gem "amazing_print"
  gem "annotate"
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "erb_lint", require: false
  gem "letter_opener"
  gem "rubocop", require: false
  gem "rubocop-minitest", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "web-console"
end

group :development, :test do
  gem 'pry-byebug', '~> 3.9'
  gem "dotenv-rails"
  gem "launchy"
end

group :test do
  gem "capybara"
  gem "minitest-ci", require: false
  gem "selenium-webdriver"
  gem "shoulda-context"
  gem "shoulda-matchers"
  gem "webdrivers"
end
