require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:all) do 
    name = "Curso dj iniciacion" 
    description = Faker::Lorem.paragraphs(100).join("\n\n")
    @category = Category.first_or_create(name: "Cursos")
    @product = Product.first_or_create(category_id: @category.id, name: name, description: description, price: 450.00)
  end
  
  it 'is valid product with valid attributes' do
    expect(@product).to be_valid
  end
  
  it 'has category' do
    expect(@product.category_id).to eq(@category.id)
  end

  it 'belongs to a category' do
    expect(@category.products.find(@product.id)).to be_a(@product)
  end

  it 'has category name' do
    expect(@product.category_name).to eq('Cursos')
  end

  it 'has sku number' do  
    expect(@product.sku).to eq('GA-000001')
  end

  it 'has a name' do
    expect(@product.name).to eq('Curso dj iniciacion')
  end

  it 'has description' do    
    expect(@product.description.id).to_not eq(nil)
  end

  it 'has a price' do
    expect(@product.price).to eq(450.00)
  end

  it 'has vats' do
    expect(@product.vat).to eq(21.00)
  end

  it 'has price_no_vat' do
    expect(@product.price_no_vat).to eq(450.00 - (450.00 * 21.00 / 100))
  end

  it 'has price_in_cents' do
    expect(@product.price_in_cents).to eq(450.00 * 100)
  end
end
