class Image < ApplicationRecord

  # Media holding the image source
  has_attached_file :media, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'

  # Image media validation
  validates :media, presence: true
  validates_attachment_content_type :media, content_type: %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}

  # Image post-processing
  before_save :extract_dimensions

  # Validate and serialize the tags
  serialize :tags, Array
  validates :tags, presence: true

  # Validate the dimensions
  validates :width, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true
  validates :height, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true

  # Scope to filter images based on tags
  scope :tagged, ->(tags) { where(tags.map{|tag| "tags LIKE '%#{tag}%'"}.join(' AND ')) }

  private

  # Extract image width and height
  def extract_dimensions

    # Do not do the image processing if the model is not valid
    return unless valid?

    # Extract the dimension reading from files properties
    tempfile = media.queued_for_write[:original]
    if tempfile.present?
      geometry = Paperclip::Geometry.from_file(tempfile)

      # Store values on the columns
      self.width = geometry.width.to_i
      self.height = geometry.height.to_i
    end
  end

end
