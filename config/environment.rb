require 'openid'

# Load the rails application
require File.expand_path('../application', __FILE__)

# Load env vars from local file
local_env = File.join(::Rails.root.to_s, 'config', 'local_env.rb')
load(local_env) if File.exists?(local_env)

# Load certificate bundler 
OpenID.fetcher.ca_file = "#{Rails.root}/config/ca-bundle.crt"

# Initialize the rails application
Recipefu::Application.initialize!
