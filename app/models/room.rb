class Room < ApplicationRecord
  belongs_to :user
  has_many :messages

  validates :room_name, presence: true
end
