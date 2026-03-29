class FishPoint < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :points, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :ordered, -> { order(position: :asc, name: :asc) }
end
