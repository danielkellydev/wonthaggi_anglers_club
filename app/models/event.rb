class Event < ApplicationRecord
  has_rich_text :description
  has_one_attached :featured_image

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :starts_at, presence: true
  validate :validate_featured_image

  scope :published, -> { where(published: true) }
  scope :upcoming, -> { where("starts_at >= ?", Date.current).order(starts_at: :asc) }
  scope :past, -> { where("starts_at < ?", Date.current).order(starts_at: :desc) }

  before_validation :generate_slug, if: -> { slug.blank? && title.present? }

  def to_param
    slug
  end

  private

  def generate_slug
    base_slug = title.parameterize
    self.slug = base_slug
    counter = 1
    while Event.where(slug: self.slug).where.not(id: id).exists?
      self.slug = "#{base_slug}-#{counter}"
      counter += 1
    end
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
