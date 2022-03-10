require 'rails_helper'

RSpec.describe "EmailCustomTemplates", type: :request do
  let(:valid_attributes){
    {
      content: Faker::Lorem.paragraphs(number: 240).join("\n\n"),
    }
  }
  
  let(:invalid_attributes){
   { kind: 23 }
  }

  describe "GET /index" do
    it "returns http success and last email custom template title" do
      template = EmailBaseTemplate.last
      email_custom_template = EmailCustomTemplate.create! email_base_template_id: template.id, content: Faker::Lorem.paragraphs(240).join("\n\n")
      get email_base_template_email_custom_templates_url
      expect(response).to be_successful
      expect(response.body).to include(email_custom_template.base_title)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      template = EmailBaseTemplate.last
      email_custom_template = EmailCustomTemplate.create! email_base_template_id: template.id, content: Faker::Lorem.paragraphs(240).join("\n\n")
      get email_base_template_email_custom_template_path(email_custom_template)
      expect(response).to be_successful
      expect(response.body).to include(email_custom_template.base_title)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_email_base_template_email_custom_template_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      template = EmailBaseTemplate.last
      email_custom_template = EmailCustomTemplate.create! email_base_template_id: template.id, content: Faker::Lorem.paragraphs(240).join("\n\n")
      get edit_email_base_template_email_custom_template_url(email_custom_template)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new email custom template" do
        expect {
          post email_base_template_email_custom_templates_url, params: { email_custom_template: valid_attributes }
        }.to change(EmailCustomTemplate, :count).by(1)

        template = EmailBaseTemplate.last
        expect(template.title).to eq('base title inherited')
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'new' template)" do
        post email_base_template_email_custom_templates_url, params: { email_custom_template: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested email custom template" do
        template = EmailBaseTemplate.last
        email_custom_template = EmailCustomTemplate.create! email_base_template_id: template.id, content: Faker::Lorem.paragraphs(240).join("\n\n")
        patch email_base_template_email_custom_template_url(email_custom_template), params: { email_custom_template: valid_attributes }
        expect(response).to redirect_to(email_base_template_email_custom_template_url(email_custom_template))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        template = EmailBaseTemplate.last
        email_custom_template = EmailCustomTemplate.create! email_base_template_id: template.id, content: Faker::Lorem.paragraphs(240).join("\n\n")
        patch email_base_template_email_custom_template_url(email_custom_template), params: { email_custom_template: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested email custom template" do
      template = EmailBaseTemplate.last
      email_custom_template = EmailCustomTemplate.create! email_base_template_id: template.id, content: Faker::Lorem.paragraphs(240).join("\n\n")
      expect {
        delete email_base_template_email_custom_template_url(email_custom_template)
      }.to change(EmailCustomTemplate, :count).by(-1)
    end 
  end
end
