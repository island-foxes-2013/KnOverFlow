require 'simplecov'
SimpleCov.start 'rails'
# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'faker'
# require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :truncation
  # end

  # config.before(:each) do
  #   DatabaseCleaner.start
  # end

  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end


  # config.after do
  #   if example.metadata[:type] == :feature and example.exception.present?
  #     save_and_open_page
  #   end
  # end
end

def log_in(user)
  # p "X"*100
  # p "in log in method"
  visit new_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button 'Sign In'
  # session[:user_id] = user.id
  # p "done with log in method"
  # p "#{current_user}"
  # p "X"*100
end

Capybara.javascript_driver = :webkit
Capybara.default_wait_time = 3
