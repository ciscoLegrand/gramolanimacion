require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:all) do 
    name = "Campamentos" 
    description = Faker::Lorem.paragraphs(100).join("\n\n")
    
    @category = Category.first_or_create(name: name, description: description)
  end
  
  it 'is valid category with valid attributes' do
    expect(@category).to be_valid
  end
  
  it 'has a name' do
    expect(@category.name).to eq('Campamentos')
  end

  it 'has description' do    
    expect(@category.description.id).to_not eq(nil)
  end
end
