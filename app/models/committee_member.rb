class CommitteeMember < ApplicationRecord
  validates :role, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }

  scope :ordered, -> { order(position: :asc) }
end
