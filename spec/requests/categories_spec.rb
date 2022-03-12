require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let(:valid_attributes){
    {
      name: 'Campamentos',
      description: Faker::Lorem.paragraphs(number: 100).join("\n\n"),
    }
  }
  
  let(:invalid_attributes){
   { name: "" }
  }

  describe "GET /index" do
    it "returns http success and last category name" do
      category = Category.create! valid_attributes
      get categories_path
      expect(response).to be_successful
      expect(response.body).to include(category.name)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      category = Category.create! valid_attributes
      get category_path(category)
      expect(response).to be_successful
      expect(response.body).to include(category.name)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_category_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      category = Category.create! valid_attributes
      get edit_category_url(category)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new category" do
        expect {
          post categories_url, params: { category: valid_attributes }
        }.to change(Category, :count).by(1)

        category = Category.last
        expect(category.name).to eq('Campamentos')
      end

      it "redirects to the index categories" do
        post categories_url, params: { category: valid_attributes }
        expect(response).to redirect_to(categories_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new category" do
        expect {
          post categories_url, params: { category: invalid_attributes }
        }.not_to change(Category, :count)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post categories_url, params: { category: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: 'Campamentos' }
      }

      it "updates the requested category" do
        category = Category.create! valid_attributes
        put category_url(category), params: { category: new_attributes }
        category.reload
        expect(category.name).to eq('Campamentos')
      end

      it "redirects to the index categories" do
        category = Category.create! valid_attributes
        put categories_url, params: { category: valid_attributes }
        expect(response).to redirect_to(categories_url)
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        category = Category.create! valid_attributes
        put category_url(category), params: { category: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested category" do
      category = Category.create! valid_attributes
      expect {
        delete category_url(category)
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the categories list" do
      category = Category.create! valid_attributes
      delete category_url(category)
      expect(response).to redirect_to(categories_url)
    end
  end
end
