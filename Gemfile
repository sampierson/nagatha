source 'http://rubygems.org'

gem 'rails', '3.0.4'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3-ruby', :require => 'sqlite3'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

gem "haml"
gem "compass"
gem "html5-boilerplate"
gem "devise"
gem "cancan"
gem "simple-navigation"
gem "will_paginate"
gem "enumerate_it"
gem "acts_as_list"

gem "capistrano", :group => :development

group :development, :test do
  gem "ruby-debug"
  gem "rspec-rails"
  gem "cucumber-rails"
  gem "autotest"
  gem "autotest-rails-pure"
  gem "nokogiri"
  gem "webrat"
  gem "jasmine"
  gem "spork"
end

group :test do
  gem "rcov"
  gem "factory_girl_rails"
  gem "remarkable_activerecord", '= 4.0.0.alpha4'
end

# Gems to exclude when using Linux
# Use: bundle install --without osxtest
group :osxtest do
  gem "autotest-fsevent"
end
