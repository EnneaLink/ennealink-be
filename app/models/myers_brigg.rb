class MyersBrigg < ApplicationRecord
  has_many :users

  validates :type, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
