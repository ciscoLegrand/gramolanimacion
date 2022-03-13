require 'rails_helper'

RSpec.describe EmailCustomTemplate, type: :model do
  before(:all) do 
    EmailCustomTemplate.delete_all
    EmailBaseTemplate.delete_all
    
    title = "Email contacto" 
    content = Faker::Lorem.paragraphs(240).join("\n\n")
    
    @base = EmailBaseTemplate.first_or_create(title: title, content: content, kind: 0)
    @custom = EmailCustomTemplate.first_or_create(email_base_template: @base, content: content)
  end
  
  it 'is valid template with valid attributes' do
    expect(@custom).to be_valid
  end
  
  it 'has a title' do
    expect(@custom.base_title).to eq('Email contacto')
  end

  it 'has content' do    
    expect(@custom.content.id).to_not eq(nil)
  end

  it 'has not content' do
    custom2 = EmailCustomTemplate.new(email_base_template: @base)
    expect(custom2.content.id).to eq(nil)
  end

  it 'is not pending' do
    expect(EmailBaseTemplate.pending?).to_not eq(true)
  end

  it 'base has custom template' do
    expect(@base.has_custom_template?).to eq(true)
  end

  it 'is kind contact' do
    expect(@custom.base_kind).to eq('contacto')
  end
end
