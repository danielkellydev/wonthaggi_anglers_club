class MembershipFee < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :ordered, -> { order(position: :asc, name: :asc) }
end
