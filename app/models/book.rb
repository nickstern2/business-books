class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  # validates :first_name through
end
