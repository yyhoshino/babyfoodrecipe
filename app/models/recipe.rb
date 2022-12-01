class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :dish_name
    validates :ingredient
    validates :make
    validates :introduction
    validates :user_id
  end
end
