# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  #config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
  
  config.include IntegrationSpecHelper, :type => :request
  
  # redis settings

  REDIS_PID = "#{Rails.root}/tmp/pids/redis-test.pid"
  REDIS_CACHE_PATH = "#{Rails.root}/tmp/cache/"

  config.before(:suite) do
    redis_options = {
      "daemonize"     => 'yes',
      "pidfile"       => REDIS_PID,
      "port"          => 9379,
      "timeout"       => 300,
      "save 900"      => 1,
      "save 300"      => 1,
      "save 60"       => 10000,
      "dbfilename"    => "dump.rdb",
      "dir"           => REDIS_CACHE_PATH,
      "loglevel"      => "debug",
      "logfile"       => "/tmp/redis_test.log",
      "databases"     => 16
    }.map { |k, v| "#{k} #{v}" }.join('\n')
    `echo '#{redis_options}' | redis-server -`
  end

  config.after(:suite) do
    %x{
      cat #{REDIS_PID} | xargs kill -QUIT
      rm -f #{REDIS_CACHE_PATH}dump.rdb
    }
  end

end

Capybara.javascript_driver = :webkit

Capybara.default_host = 'http://127.0.0.1'

OmniAuth.config.test_mode = true
#OmniAuth.config.add_mock(:twitter, {
#  :uid => '67354',
#  :user_info => {
#    :name => 'Guy Lafleur',
#    :nickname => 'guylafleur'},
#})
