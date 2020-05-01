class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments

  def iine?(user)
    favorites.where(user_id: user.id).exists?
  end
end
