# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "Destroy everything"

# Reordered these by association because seed failing.
Author.destroy_all
Book.destroy_all
Category.destroy_all

book_length = [120, 150, 180, 210, 330, 360]
author_array = []
category_array =[]
book_categories = ["Innovation", "Strategy", "Leadership", "Marketing", "Management", "entrepreneurship" ]

puts "creating 10 authors"
10.times do
  author = Author.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    )
    author.save!
    author_array << author
end

puts "creating 6 categories"

  book_categories.each do |category_type|
    category = Category.new(
      category_name: category_type
    )
    category.save!
    category_array << category
end

# author_array.each do |author|
  # category_array.each do |category|
puts "creating 10 books"
    10.times do
      book = Book.create!(
        title: Faker::Book.title,
        length: book_length.sample,
        author_id: author_array.sample.id,
        category_id: category_array.sample.id
          )
    end

