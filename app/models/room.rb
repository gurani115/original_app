class Room < ApplicationRecord
  belongs_to :user

  validates :room_name, presence: true
end
