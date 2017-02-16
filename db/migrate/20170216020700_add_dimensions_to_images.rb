class AddDimensionsToImages < ActiveRecord::Migration
  def change

    # Create auxiliary columns to store the image dimensions
    add_column :images, :width, :integer
    add_column :images, :height, :integer
  end
end
