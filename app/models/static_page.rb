# == Schema Information
#
# Table name: static_pages
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class StaticPage < ApplicationRecord
  require "flickr"

  flickr = Flickr.new

  # Flickr will raise an error if either parameter is not explicitly provided, or available via environment variables.

  list   = flickr.photos.getRecent
  id     = list[0].id
  secret = list[0].secret
  info   = flickr.photos.getInfo :photo_id => id, :secret => secret

  puts info.title           # => "PICT986"
  puts info.dates.taken     # => "2006-07-06 15:16:18"

  sizes = flickr.photos.getSizes :photo_id => id

  original = sizes.find { |s| s.label == 'Original' }
  puts original.width       # => "800" -- may fail if they have no original marked image
end
