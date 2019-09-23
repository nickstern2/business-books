class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  # validates :first_name through

  def avergae_rating
   sum = 0
   count = 0


   self.reviews.each do |review|
    sum += review.rating
    count += 1
    end
    average = sum / count.to_f
    return average
  end


end
