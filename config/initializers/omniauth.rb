require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
  provider :facebook, ENV['APP_ID'], ENV['APP_SECRET']  
  provider :open_id, OpenID::Store::Filesystem.new('./tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
end