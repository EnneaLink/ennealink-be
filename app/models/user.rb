class User < ApplicationRecord
  belongs_to :myers_brigg
  belongs_to :enneagram
  has_many :friendships

  validates :email, presence: true, uniqueness: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :username, presence: true, uniqueness: true
end

