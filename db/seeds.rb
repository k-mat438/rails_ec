# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

product1 = Product.new(
  name: 'Fancy Product',
  price: '$40.00 - $80.00'
)
product1.image.attach(io: File.open(Rails.root.join('app/assets/images/image.jpg')), filename: 'image.jpg')
product1.save!

product2 = Product.new(
  name: 'おいしいお水',
  price: '200円',
  description: '酸素と水素の化合物です。常温で無色無臭の透明な液体です。'
)
product2.image.attach(io: File.open(Rails.root.join('app/assets/images/image.jpg')), filename: 'image.jpg')
product2.save!

product3 = Product.new(
  name: 'Sale Item',
  price: '$25.00'
)
product3.image.attach(io: File.open(Rails.root.join('app/assets/images/image.jpg')), filename: 'image.jpg')
product3.save!

product4 = Product.new(
  name: 'Popular Item',
  price: '$40.00'
)
product4.image.attach(io: File.open(Rails.root.join('app/assets/images/image.jpg')), filename: 'image.jpg')
product4.save!

product5 = Product.new(
  name: 'Sale Item',
  price: '$25.00'
)
product5.image.attach(io: File.open(Rails.root.join('app/assets/images/image.jpg')), filename: 'image.jpg')
product5.save!

product6 = Product.new(
  name: 'Fancy Product',
  price: '$120.00 - $280.00'
)
product6.image.attach(io: File.open(Rails.root.join('app/assets/images/image.jpg')), filename: 'image.jpg')
product6.save!

product7 = Product.new(
  name: 'Special Item',
  price: '$18.00'
)
product7.image.attach(io: File.open(Rails.root.join('app/assets/images/image.jpg')), filename: 'image.jpg')
product7.save!

product8 = Product.new(
  name: 'Popular Item',
  price: '$40.00'
)
product8.image.attach(io: File.open(Rails.root.join('app/assets/images/image.jpg')), filename: 'image.jpg')
product8.save!
