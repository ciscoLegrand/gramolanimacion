require 'rails_helper'

RSpec.describe LegalText, type: :model do
  before(:all) do 
    title = "Políticas de privacidad" 
    content = Faker::Lorem.paragraphs(240).join("\n\n")
    
    @legal_text = LegalText.first_or_create(title: title, content: content)
  end
  
  it 'is valid legal text with valid attributes' do
    expect(@legal_text).to be_valid
  end
  
  it 'has a title' do
    expect(@legal_text.title).to eq('Políticas de privacidad')
  end

  it 'has content' do    
    expect(@legal_text.content.id).to_not eq(nil)
  end

  it 'hasn not content' do
    legal_text_2 = LegalText.new(title: "Políticas")
    expect(legal_text_2.content.id).to eq(nil)
  end
end
