# BASE_URL/?method&api_key&user_id&format
# ENV['FLICKR_API_KEY']

response = RestClient.get('https://www.flickr.com/services/rest/?method=flickr.test.echo&name=value')

flickr_array = JSON.parse(response)

puts "data loaded success"
binding.pry
