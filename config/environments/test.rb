# Settings specified here will take precedence over those in config/environment.rb

# The test environment is used exclusively to run your application's
# test suite.  You never need to work with it otherwise.  Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs.  Don't rely on the data there!
config.cache_classes = true

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false

# Disable request forgery protection in test environment
config.action_controller.allow_forgery_protection    = false

# Tell Action Mailer not to deliver emails to the real world.
# The :test delivery method accumulates sent emails in the
# ActionMailer::Base.deliveries array.
config.action_mailer.delivery_method = :test

# Loads RSpec-rails only in test environment (problems with Passenger)
config.gem "rspec", :lib => "spec", :version => '1.1.12'
config.gem "rspec-rails", :lib => "spec/rails", :version => '1.1.12'
config.gem "sqlite3-ruby", :lib => "sqlite3", :version => '1.2.4'
config.gem "spicycode-rcov", :source => "http://gems.github.com", :lib => "rcov", :version => '0.8.1.5.0'
config.gem "cucumber", :version => '0.1.16'
config.gem "webrat", :version => '0.4.3'
