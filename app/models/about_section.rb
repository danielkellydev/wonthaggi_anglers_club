class AboutSection < ApplicationRecord
  has_rich_text :body

  validates :title, presence: true, length: { maximum: 255 }

  scope :ordered, -> { order(position: :asc) }
  scope :published, -> { where(published: true) }
end
