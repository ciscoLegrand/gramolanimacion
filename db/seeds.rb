cat1 = Category.create!(name: "Cursos",description: Faker::Lorem.paragraphs(number: 3))
cat2 = Category.create!(name: "Campamentos",description: Faker::Lorem.paragraphs(number: 3))
cat3 = Category.create!(name: "Actividades",description: Faker::Lorem.paragraphs(number: 3))
9.times do |i|
  Product.create!(
    category_id: Category.find(rand(1..3)).id,
    name: "Product #{i}",
    initial_price: rand(1..5) * 100,
    discount: rand(1..25),
    description: Faker::Lorem.paragraph,
    position: i
  )
end

puts cat1.products.last.name
puts cat2.products.last.name
puts cat3.products.last.name