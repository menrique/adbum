class Image < ApplicationRecord

  # Media holding the image source
  has_attached_file :media, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'

  # Validate we only accept images
  validates :media, presence: true
  validates_attachment_content_type :media, content_type: /\Aimage\/.*\z/


  # Validate tags to be a comma separated list of words
  serialize :tags, Array
  validates :tags, presence: true
end
