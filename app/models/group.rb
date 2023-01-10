class Group < ApplicationRecord
  validates :name, presence: true
  validates :about, presence: true

  # one-to-many
  has_many :recipes

  # many-to-many
  has_many :group_users
  has_many :users, through: :group_users

  def user_count
    users.count
  end
end
