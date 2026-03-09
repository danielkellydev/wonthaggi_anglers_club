class Post < ApplicationRecord
  CATEGORIES = %w[news report announcement].freeze

  has_rich_text :body
  has_one_attached :featured_image

  validates :title, presence: true, length: { maximum: 255 }
  validates :slug, presence: true, uniqueness: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validate :validate_featured_image

  scope :published, -> { where(published: true).order(published_at: :desc) }

  before_validation :generate_slug, if: -> { slug.blank? && title.present? }
  before_save :set_published_at, if: -> { published? && published_at.nil? }

  def to_param
    slug
  end

  private

  def generate_slug
    base_slug = title.parameterize
    self.slug = base_slug
    counter = 1
    while Post.where(slug: self.slug).where.not(id: id).exists?
      self.slug = "#{base_slug}-#{counter}"
      counter += 1
    end
  end

  def set_published_at
    self.published_at = Time.current
  end

  def validate_featured_image
    return unless featured_image.attached?
    unless featured_image.content_type.in?(%w[image/jpeg image/png image/webp])
      errors.add(:featured_image, "must be JPEG, PNG, or WebP")
    end
    if featured_image.byte_size > 10.megabytes
      errors.add(:featured_image, "must be less than 10 MB")
    end
  end
end
