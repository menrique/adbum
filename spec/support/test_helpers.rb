module TestHelpers

  # Return a serialized HASH similar to JSON output from the images API
  def serialize_images_api_response(available_images)
    {
      'count'  => available_images.size,
      'images' => available_images.map do |image|
        {
          'url'    => path_to_url(image.media.url),
          'width'  => image.width,
          'height' => image.height
        }
      end
    }
  end

end