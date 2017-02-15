class ImagesController < ApplicationController

  def index
    # Get filter
    @filter = (params[:filter] || [])

    # Get all images
    @images = Image.where(@filter.map{|tag| "tags LIKE '%#{tag}%'"}.join(' AND '))
  end

  def search
    # Redirect to the index page
    redirect_to images_path(filter: params[:filter])
  end

  def show
    # Find the image
    @image = Image.find(params[:id])
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
    else
      flash[:error] = @image.errors.full_messages
    end

    # Redirect to the index page
    redirect_to images_path
  end

  def edit
    # Create the new image to store
    @image = Image.find(params[:id])
  end

  def update
    # Find the image
    @image = Image.find(params[:id])

    # Update and notify result
    if @image.update(image_params)
      flash[:success] = 'Image successfully updated'
    else
      flash[:error] = @image.errors.full_messages
    end

    # Redirect to the index page
    redirect_to images_path
  end

  def destroy
    # Create the new image to store
    @image = Image.find(params[:id])

    # Delete and notify result
    if @image.destroy
      flash[:success] = 'Image successfully deleted'
    end

    # Redirect to the index page
    redirect_to images_path
  end

  private

  # Filter allowed parameters used to populate the model
  def image_params
    # Clean empty tags first
    params.require(:image)[:tags].reject!{|tag| tag.blank?}
    params.require(:image).permit!
  end
end
