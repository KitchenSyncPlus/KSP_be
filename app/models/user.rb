class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :group_users
  has_many :recipe_ingredients
  has_many :groups, through: :group_users
end
