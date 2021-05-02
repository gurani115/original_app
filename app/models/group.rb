class Group < ApplicationRecord
  has_one_attached :image
  has_many :rooms
  has_many :messages

  validates :group_name, presence: true
  validates :image, presence: true
end
