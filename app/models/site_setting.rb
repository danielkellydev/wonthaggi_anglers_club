class SiteSetting < ApplicationRecord
  has_one_attached :file

  validates :key, presence: true, uniqueness: true

  def self.membership_form
    find_by(key: "membership_form")
  end
end
