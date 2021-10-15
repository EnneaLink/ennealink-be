class MyersBrigg < ApplicationRecord
  has_many :users

  validates :type, presence: true, length: {minimum: 4, maximum: 4}
  validates :name, presence: true
  validates :description, presence: true
end
