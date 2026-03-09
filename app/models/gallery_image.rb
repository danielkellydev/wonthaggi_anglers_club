class GalleryImage < ApplicationRecord
  has_one_attached :image

  validate :validate_image

  scope :ordered, -> { order(position: :asc, created_at: :desc) }

  private

  def validate_image
    return unless image.attached?
    unless image.content_type.in?(%w[image/jpeg image/png image/webp])
      errors.add(:image, "must be JPEG, PNG, or WebP")
    end
    if image.byte_size > 10.megabytes
      errors.add(:image, "must be less than 10 MB")
    end
  end
end
