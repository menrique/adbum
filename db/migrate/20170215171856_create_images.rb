class CreateImages < ActiveRecord::Migration[5.0]

  def up

    # Create image table
    create_table :images do |t|
      t.string :tags
      t.timestamps
    end

    # Add paperclip attachment
    add_attachment :images, :media
  end

  def down

    # Rollback
    remove_attachment :images, :media
    drop_table :images
  end
end
