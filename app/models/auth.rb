class Auth < ApplicationRecord
  require "flickr"

  # This is how to authenticate on flickr website.
  # You need an API key for that, see https://www.flickr.com/services/api/keys/
  API_KEY = ENV['FLICKR_API_KEY']
  SHARED_SECRET = ENV['FLICKR_SHARED_SECRET']
  BASE_URL = 'https://www.flickr.com/services/rest/'
  PHOTO_URL = 'https://live.staticflickr.com/'

  flickr = Flickr.new API_KEY, SHARED_SECRET
  token = flickr.get_request_token
  auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'delete')

  puts "Open this url in your browser to complete the authentication process: #{auth_url}"
  puts "Copy here the number given when you complete the process."
  verify = gets.strip

  begin
    flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)
    login = flickr.test.login
    puts "You are now authenticated as #{login.username} with token #{flickr.access_token} and secret #{flickr.access_secret}"
  rescue Flickr::FailedResponse => e
    puts "Authentication failed: #{e.msg}"
  end

  def self.api_call
    #helper method
  end
end
