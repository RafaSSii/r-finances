class Card < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :value, presence: true, numericality: true
end
