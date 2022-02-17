require 'rails_helper'

RSpec.describe LegalText, type: :model do
  before(:all) do 
    title = "Políticas de privacidad" 
    content = Faker::Lorem.paragraphs(240).join("\n\n")
    
    @legal_text = LegalText.new(title: title, content: @content)
    @legal_text_2 = LegalText.new(title: @legal_text.title, content: '')
  end

  it 'is valid legal text with valid attributes' do
    expect(@legal_text).to be_valid
  end

  it 'has a unique title' do
    expect(@legal_text_2).to_not be_valid
  end

  it 'has a title' do
    expect(@legal_text.title).to eq('Políticas de privacidad')
  end

  it 'has a content' do
    expect(@legal_text.content).to_not eq(nil)
  end

  it 'not has a content' do
    expect(@legal_text_2.content).to eq(nil)
  end
end
