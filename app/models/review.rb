class Review < ApplicationRecord
  belongs_to :book

  validates :rating, presence: true
  validates :description, presence: true
end
