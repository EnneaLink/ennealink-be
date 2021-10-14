class Enneagram < ApplicationRecord
  has_many :users

  validates :number, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
