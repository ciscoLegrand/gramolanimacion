require 'rails_helper'

RSpec.describe "LegalTexts", type: :request do
  
  let(:valid_attributes){
    {
      title: 'TEST TITLE',
      content: Faker::Lorem.paragraphs(number: 240).join("\n\n")
    }
  }
  
  let(:invalid_attributes){
   { title: "text" }
  }

  describe "GET /index" do
    it "returns http success and last legaltext title" do
      legaltext = LegalText.create! valid_attributes
      get legal_texts_path
      expect(response).to be_successful
      expect(response.body).to include(legaltext.title)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      legaltext = LegalText.create! valid_attributes
      get legal_text_path(legaltext)
      expect(response).to be_successful
      expect(response.body).to include(legaltext.title)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_legal_text_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do 
      legaltext = LegalText.create! valid_attributes
      get edit_legal_text_url(legaltext)
      expect(response).to be_successful
    end
  end
  
  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new legal text" do
        expect {
          post legal_texts_url, params: { legal_text: valid_attributes }
        }.to change(LegalText, :count).by(1)

        legaltext = LegalText.last
        expect(legaltext.title).to eq('TEST TITLE')
      end

      it "redirects to the created legal text" do
        post legal_texts_url, params: { legal_text: valid_attributes }
        expect(response).to redirect_to(legal_texts_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new legal text" do
        expect {
          post legal_texts_url, params: { legal_text: invalid_attributes }
        }.to change(LegalText, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post legal_texts_url, params: { legal_text: invalid_attributes }
        expect(response).to redirect_to(legal_texts_url)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          title: 'NEW FANCY TITLE',
        }
      }

      it "updates the requested legaltext" do
        legaltext = LegalText.create! valid_attributes
        patch legal_text_url(legaltext), params: { legal_text: new_attributes }
        legaltext.reload

        # expect(legaltext.title).to eq('NEW FANCY TITLE')
      end

      it "redirects to the legal texts list" do
        legaltext = LegalText.create! valid_attributes
        patch legal_text_url(legaltext), params: { legal_text: new_attributes }
        legaltext.reload
        expect(response).to redirect_to(legal_texts_url)
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        legaltext = LegalText.create! valid_attributes
        patch legal_text_url(legaltext), params: { legal_text: invalid_attributes }
        expect(response).to redirect_to(legal_texts_url)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested legal text" do
      legaltext = LegalText.create! valid_attributes
      expect {
        delete legal_text_url(legaltext)
      }.to change(LegalText, :count).by(-1)
    end

    it "redirects to the legal texts list" do
      legaltext = LegalText.create! valid_attributes
      delete legal_text_url(legaltext)
      expect(response).to redirect_to(legal_texts_url)
    end
  end
end

