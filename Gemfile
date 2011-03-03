source 'http://rubygems.org'

gem 'rails', '3.0.5'
gem 'sqlite3'
gem "enumerate_it"
gem "acts_as_list"

gem "haml"
gem "compass"
gem "html5-boilerplate"
gem "simple-navigation"
gem "will_paginate", "3.0.pre2"

gem "devise"
gem "cancan"

group :development do
  gem "capistrano"
end

group :development, :test do
  gem "rspec-rails"
  gem "autotest"
  gem "autotest-rails-pure"
  gem "nokogiri"
  gem "cucumber-rails"
  gem "nokogiri"
  gem "webrat"
  gem "jasmine"
  gem "spork"
  gem "factory_girl_rails"
  gem "remarkable_activerecord", '= 4.0.0.alpha4'

  platform :ruby_18 do
    # gem 'ruby-debug'
    # gem 'rcov'
  end
  platform :ruby_19 do
    gem 'ruby-debug19', :require => 'ruby-debug'
    gem "cover_me"
  end
end

# Gems to exclude when using Linux
# Use: bundle install --without osxtest
group :osxtest do
  gem "autotest-fsevent"
end
