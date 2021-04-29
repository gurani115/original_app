class Group < ApplicationRecord
  has_one_attached :image
  has_many :rooms

  validates :group_name, presence: true
  validates :image, presence: true
end
