class Cocktail < ApplicationRecord
  validates :name, presence: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true
end
