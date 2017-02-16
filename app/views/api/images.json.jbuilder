# This is the JSON response

# Found image count
json.count @images.size

# Set of found images with details
json.images @images do |image|
  json.url    path_to_url image.media.url
  json.width  image.width
  json.height image.height
end