class Auth < ApplicationRecord
  require "flickr"

  # This is how to authenticate on flickr website.
  # You need an API key for that, see https://www.flickr.com/services/api/keys/
  API_KEY = ENV['FLICKR_API_KEY']
  SHARED_SECRET = ENV['FLICKR_SHARED_SECRET']
  BASE_URL = 'https://www.flickr.com/services/rest/'
  PHOTO_URL = 'https://live.staticflickr.com/'

  def get_photos_by_user_id(user_id)
    response = HTTP.get("https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{API_KEY}&user_id=#{user_id}&format=json&nojsoncallback=1&api_sig=604c3d5e5b895f76d3374fc1b0bf4b9e").to_s
    parsed_response = JSON.parse(response)
    parsed_response['id']
  end
end
