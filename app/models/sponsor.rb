class Sponsor < ApplicationRecord
  has_one_attached :logo

  validates :name, presence: true, length: { maximum: 255 }
  validate :validate_logo

  scope :ordered, -> { order(position: :asc, name: :asc) }

  private

  def validate_logo
    return unless logo.attached?
    unless logo.content_type.in?(%w[image/jpeg image/png image/webp image/svg+xml])
      errors.add(:logo, "must be JPEG, PNG, WebP, or SVG")
    end
    if logo.byte_size > 5.megabytes
      errors.add(:logo, "must be less than 5 MB")
    end
  end
end
