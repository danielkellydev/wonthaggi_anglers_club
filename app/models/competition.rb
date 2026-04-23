class Competition < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true

  scope :ordered, -> { order(position: :asc, id: :asc) }
end
