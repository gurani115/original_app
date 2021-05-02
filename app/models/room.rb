class Room < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :messages, dependent: :destroy 

  with_options presence: true do
    validates :image
    validates :group_name
    validates :first_work
  end
end
