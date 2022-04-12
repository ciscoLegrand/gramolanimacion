User.create(email: 'cisco.glez@gmail.com', password: 'test123', role: 'admin')
DataEnterprise.create(commercial_name: 'gramokids', business_name: 'la gramola disco')
cat1 = Category.create!(
  name: "Cursos",
  description: Faker::Lorem.paragraphs(number: 3) unless Rails.env.production?
)
cat2 = Category.create!(
  name: "Campamentos",
  description: Faker::Lorem.paragraphs(number: 3) unless Rails.env.production?
)
cat3 = Category.create!(
  name: "Actividades",
  description: Faker::Lorem.paragraphs(number: 3) unless Rails.env.production?
)
9.times do |i|
  n = i + 1
  cat = Category.find(rand(1..3))
  Product.create!(
    category_id: cat.id,
    name: "Prod#{cat.name}#{n}",
    initial_price: rand(1..5) * 100,
    discount: rand(0..20),
    position: n,
    description: Faker::Lorem.paragraph unless Rails.env.production?
  )
end

puts cat1.products&.last.name
puts cat2.products&.last.name
puts cat3.products&.last.name