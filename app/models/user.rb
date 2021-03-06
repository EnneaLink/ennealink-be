class User < ApplicationRecord
  belongs_to :myers_brigg, required: false
  belongs_to :enneagram, required: false
  has_many :friendships
  has_many :friends, through: :friendships, foreign_key: 'friend_id'

  # validates :email, presence: false, uniqueness: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :username, presence: true, uniqueness: true

  has_secure_password
end
