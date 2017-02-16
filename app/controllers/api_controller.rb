class ApiController < ApplicationController
  class ApiError < Exception;end
  before_action :set_default_response_format

  # API exception manager
  rescue_from Exception do |e|
    @error = e.message
    render 'api/error', status: :internal_server_error
  end

  # Images retriever
  def images

    # Get parameters
    @tags = params[:tags].to_s.split(/\s*,\s*/) || []
    @limit = params[:limit]

    # Validate parameters
    unless @limit.blank? || /\A\d+\z/.match(@limit)
      raise ApiError, 'Limit must be an integer'
    end

    # Search images based on given filter
    @images = Image.tagged(@tags).limit(@limit.present? ? @limit.to_i : nil)

    # Render the correct status code
    render 'api/images', status: :ok

  rescue ApiError => e

    # Handle errors
    @error = e.message
    render 'api/error', status: :bad_request
  end

  protected

  # Set response to JSON by default
  def set_default_response_format
    request.format = :json
  end

end
