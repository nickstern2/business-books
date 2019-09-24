class Book < ApplicationRecord
 belongs_to :author
  include PgSearch::Model
  multisearchable against: [ :title ]

  pg_search_scope :search_by_title, against: [:title]
  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
    pg_search_scope :global_search,
      against: [ :title ],
      associated_against: {
        author: [ :first_name, :last_name ]
      },
    using: {
      tsearch: { prefix: true }
    }


  # belongs_to :author
  belongs_to :category
  has_many :reviews, dependent: :destroy

  validates :title, presence: true


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

  # def author_full_name
  #   full_name = self.author.first_name + " " + self.author.last_name
  #   return full_name
  # end
end
