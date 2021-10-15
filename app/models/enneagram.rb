class Enneagram < ApplicationRecord
  has_many :users

  validates :number, presence: true, :inclusion => 1..9
  validates :name, presence: true
  validates :description, presence: true
end
