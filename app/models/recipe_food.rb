class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  validates :quantity, presence: true, numericality: { only_integer: true }, comparison: { greater_than: 0 }

end
