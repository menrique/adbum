describe 'Images API' do

  context 'when the request is valid' do
    let!(:available_images) {rand(2..5).times.map{ create :image }}
    let(:limit) { available_images.size - 1 }

    it 'should respond with status code OK' do

      get '/api/images'
      expect(response).to be_success
    end

    it 'should respond with all images by default' do

      get '/api/images'
      json = JSON.parse(response.body)

      expect(json).to eq(serialize_images_api_response(available_images))
    end

    it 'should limit how many images to retrieve' do

      get "/api/images?limit=#{limit}"
      json = JSON.parse(response.body)

      expect(json['images'].size).to eq limit
    end

    it 'should filter images by tags' do

      matching_tags = available_images.sample(limit).map(&:tags).flatten

      get "/api/images?tags=#{matching_tags.join(',')}"
      json = JSON.parse(response.body)

      expect(json).to eq(serialize_images_api_response(Image.tagged(matching_tags)))
    end

  end

  it 'should respond with error message and bad_request code when given limit is invalid' do

    get '/api/images?limit=invalid'
    json = JSON.parse(response.body)

    expect(response.response_code).to eq Rack::Utils::SYMBOL_TO_STATUS_CODE[:bad_request]
    expect(json).to eq ({'error' => 'Limit must be an integer'})

  end

  it 'should redirect to not_found when queried path is invalid' do

    get '/api/invalid'
    expect(response).to redirect_to(api_not_found_path)
  end

  it 'should respond with error message and not_found code when the response get redirected to the not found path' do

    get '/api/not_found'
    json = JSON.parse(response.body)

    expect(response.response_code).to eq Rack::Utils::SYMBOL_TO_STATUS_CODE[:not_found]
    expect(json).to eq ({'error' => 'Resource not found'})
  end

  it 'should respond with error message and internal_server_error code when there is uncaught exception' do

    error_message = 'Something went wrong'
    allow(Image).to receive(:tagged).and_raise(error_message)

    get '/api/images'
    json = JSON.parse(response.body)

    expect(response.response_code).to eq Rack::Utils::SYMBOL_TO_STATUS_CODE[:internal_server_error]
    expect(json).to eq ({'error' => error_message})

  end

end