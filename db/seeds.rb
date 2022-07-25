# BASE_URL/?method&api_key&user_id&format
# ENV['FLICKR_API_KEY']

response = RestClient.get('https://www.flickr.com/services/rest/?method=flickr.test.echo&name=value')

flickr_array = JSON.parse(response)

flickr_array.each do |photo|
  binding.pry
  # Cat.create(name: photo["name"])
end

puts "data loaded success"
