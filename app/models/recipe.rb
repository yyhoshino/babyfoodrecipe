class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :moon_age
  belongs_to :classification
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :dish_name
    validates :ingredient
    validates :make
    validates :introduction
    validates :user_id
  end

  with_options numericality: { other_than: 1, message: "can't be blank"} do
    validates :moon_age_id
    validates :classification_id
  end

end
