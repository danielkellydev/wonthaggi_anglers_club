class FishOfTheMonth < ApplicationRecord
  validates :fishing_date, presence: true
  validates :target_species, presence: true, length: { maximum: 255 }

  scope :ordered, -> { order(fishing_date: :asc) }
end
