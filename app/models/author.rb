class Author < ApplicationRecord
  has_many :books

  def author_full_name
    full_name = self.first_name + " " + self.last_name
    return full_name
  end
end
