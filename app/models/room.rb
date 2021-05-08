class Room < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :group_name
    validates :species
    validates :first_work
    validates :first_text
  end
end
