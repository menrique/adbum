# This is the main API response

# Found images count
json.count @images.size

# Found images set with details
json.images @images do |image|
  json.url    path_to_url image.media.url
  json.width  image.width
  json.height image.height
end