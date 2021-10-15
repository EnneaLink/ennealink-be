class User < ApplicationRecord
  belongs_to :myers_brigg
  belongs_to :enneagram
  has_many :friendships
  has_many :friends, through: :friendships, foreign_key: 'friend_id'

  validates :email, presence: true, uniqueness: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password
end
