class User < ApplicationRecord
  has_many :recipes, dependent: :destroy
  has_many :foods, dependent: :destroy
end
