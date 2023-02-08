class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, numericality: { only_integer: true }, comparison: { greater_than: 0 }
end
