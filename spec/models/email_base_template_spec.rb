require 'rails_helper'

RSpec.describe EmailBaseTemplate, type: :model do
  before(:all) do 
    title = "Email contacto" 
    content = Faker::Lorem.paragraphs(240).join("\n\n")
    
    @base = EmailBaseTemplate.first_or_create(title: title, content: content, kind: 0)
  end
  
  it 'is valid template with valid attributes' do
    expect(@base).to be_valid
  end
  
  it 'has a title' do
    expect(@base.title).to eq('Email contacto')
  end

  it 'has content' do    
    expect(@base.content.id).to_not eq(nil)
  end

  it 'has not content' do
    base2 = EmailBaseTemplate.new(title: "Email base")
    expect(base2.content.id).to eq(nil)
  end

  it 'is pending' do
    expect(EmailBaseTemplate.pending?).to eq(true)
  end

  it 'has custom template' do
    expect(@base.has_custom_template?).to eq(false)
  end

  it 'is kind contact' do
    expect(@base.kind).to eq('contact')
  end
end
