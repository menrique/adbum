class ImagesController < ApplicationController
  before_action :update_filter
  before_action :get_image, only: [:show, :edit, :update, :destroy]
  before_action :update_siblings, only: [:show, :edit]

  def index
    # Get all images
    @images = Image.tagged(@filter)
  end

  def search
    # Redirect to the index page
    redirect_to images_path(filter: params[:filter])
  end

  def show
  end

  def new
    # Create a new image to populate
    @image = Image.new
  end

  def create
    # Create the new image to store
    @image = Image.new(image_params)

    # Create and notify result
    if @image.save
      flash[:success] = 'Image successfully created'

      # Warn about hidden elements
      if @filter.present?
        flash[:warning] = 'Actual search filter may hide the new image'
      end
    else
      flash[:error] = @image.errors.full_messages
    end

    # Redirect to the index page
    redirect_to images_path(filter: @filter)
  end

  def edit
  end

  def update

    # Update and notify result
    if @image.update(image_params)
      flash[:success] = 'Image successfully updated'

      # Warn about hidden elements
      if @filter.present?
        flash[:warning] = 'Actual search filter may hide the updated image'
      end
    else
      flash[:error] = @image.errors.full_messages
    end

    # Redirect to the index page
    redirect_to images_path(filter: @filter)
  end

  def destroy

    # Delete and notify result
    if @image.destroy
      flash[:success] = 'Image successfully deleted'
    end

    # Redirect to the index page
    redirect_to images_path(filter: @filter)
  end

  protected

  # Filter allowed parameters to populate the model
  def image_params
    # Clean empty tags first
    params.require(:image)[:tags].reject!{|tag| tag.blank?}
    params.require(:image).permit!
  end

  # Update image filter
  def update_filter
    @filter = (params[:filter] || [])
  end

  # Get current image based on ID parameter
  def get_image
    @image = Image.find(params[:id])
  end

  # Update next and previous elements
  def update_siblings
    @prev = Image.tagged(@filter).where('id < ?', @image.id).last
    @next = Image.tagged(@filter).where('id > ?', @image.id).first
  end
end
