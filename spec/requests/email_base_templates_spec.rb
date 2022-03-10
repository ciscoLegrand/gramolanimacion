require 'rails_helper'

RSpec.describe "EmailBaseTemplates", type: :request do
  let(:valid_attributes){
    {
      title: 'Email contact',
      content: Faker::Lorem.paragraphs(number: 240).join("\n\n"),
      kind: 0
    }
  }
  
  let(:invalid_attributes){
   { title: "text" }
  }

  describe "GET /index" do
    it "returns http success and last email base template kind" do
      base = EmailBaseTemplate.first
      get email_base_templates_path
      expect(response).to be_successful
      expect(response.body).to include(base.kind)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      base = EmailBaseTemplate.create! valid_attributes
      template = Liquid::Template.parse(base.content) 
      get email_base_template_path(base)
      expect(response).to be_successful
      expect(response.body).to include(template)
    end
  end

  describe "GET /new" do 
    it "renders a successful response" do
      get new_email_base_template_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      base = EmailBaseTemplate.create! valid_attributes
      get edit_email_base_template_url(base)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new email base template" do
        expect {
          post email_base_templates_url, params: { email_base_template: valid_attributes }
        }.to change(EmailBaseTemplate, :count).by(1)

        base = EmailBaseTemplate.last
        expect(base.title).to eq('Email contact')
      end

      it "redirects to the created email base template" do
        post email_base_templates_url, params: { email_base_template: valid_attributes }
        expect(response).to redirect_to(email_base_template_url(EmailBaseTemplate.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new email base template" do
        expect {
          post email_base_templates_url, params: { email_base_template: invalid_attributes }
        }.not_to change(EmailBaseTemplate, :count)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post email_base_templates_url, params: { email_base_template: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested email base template" do
        base = EmailBaseTemplate.create! valid_attributes
        patch email_base_template_url(base), params: { email_base_template: valid_attributes }
        expect(response).to redirect_to(email_base_template_url(base))
      end

      it "redirects to the email base template" do
        base = EmailBaseTemplate.create! valid_attributes
        patch email_base_template_url(base), params: { email_base_template: valid_attributes }
        expect(response).to redirect_to(email_base_template_url(base))
      end
    end

    context "with invalid parameters" do
      it "does not update the requested email base template" do
        base = EmailBaseTemplate.create! valid_attributes
        patch email_base_template_url(base), params: { email_base_template: invalid_attributes }
        expect(response).to be_successful
      end

      it "renders a successful response (i.e. to display the 'edit' template)" do
        base = EmailBaseTemplate.create! valid_attributes
        patch email_base_template_url(base), params: { email_base_template: invalid_attributes }
        expect(response).to be_successful
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested email base template" do
        base = EmailBaseTemplate.create! valid_attributes
        expect {
          delete email_base_template_url(base)
        }.to change(EmailBaseTemplate, :count).by(-1)
      end

      it "redirects to the email base templates list" do
        base = EmailBaseTemplate.create! valid_attributes
        delete email_base_template_url(base)
        expect(response).to redirect_to(email_base_templates_url)
      end
    end
  end
end
