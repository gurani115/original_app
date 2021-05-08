class Room < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :group_name, length: { in: 2..10 }
    validates :species,    length: { in: 2..10 }
    validates :first_work, length: { in: 2..20 }
    validates :first_text
  end
end
