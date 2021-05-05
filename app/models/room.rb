class Room < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :messages

  with_options presence: true do
    validates :image
    validates :group_name
    validates :species
    validates :first_work
    validates :first_text
  end
end
