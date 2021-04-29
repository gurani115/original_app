class Room < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :messages, dependent: :destroy

  validates :room_name, presence: true
end
