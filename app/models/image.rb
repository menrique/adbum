class Image < ApplicationRecord

  # Media holding the image source
  has_attached_file :media, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'

  # Validate we only accept images
  validates :media, presence: true
  validates_attachment_content_type :media, content_type: %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}
  # Image post-processing
  before_save :extract_dimensions

  # Validate tags to be a comma separated list of words
  serialize :tags, Array
  validates :tags, presence: true

  # Scope to filter based on tags
  scope :tagged, ->(tags) { where(tags.map{|tag| "tags LIKE '%#{tag}%'"}.join(' AND ')) }

  private

  # Extract image width and height
  def extract_dimensions
    return unless valid?
    tempfile = media.queued_for_write[:original]
    if tempfile.present?
      geometry = Paperclip::Geometry.from_file(tempfile)
      self.width = geometry.width.to_i
      self.height = geometry.height.to_i
    end
  end

end
