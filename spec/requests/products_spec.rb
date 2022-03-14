require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:valid_attributes){
    {
      name: 'curso iniciacion',
      description: Faker::Lorem.paragraphs(number: 240).join("\n\n"),
      price: 250.00,
      category_id: Category.last.id
    }
  }
  
  let(:invalid_attributes){
   { title: "" }
  }

  describe "GET /index" do
    it "returns http success and last product name" do
      product = Product.create! valid_attributes
      get products_path
      expect(response).to be_successful
      expect(response.body).to include(product.name)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      product = Product.create! valid_attributes
      get product_path(product)
      expect(response).to be_successful
      expect(response.body).to include(product.name)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_product_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      product = Product.create! valid_attributes
      get edit_product_url(product)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new product" do
        expect {
          post products_url, params: { product: valid_attributes }
        }.to change(Product, :count).by(1)

        product = Product.last
        expect(product.name).to eq('curso iniciacion')
      end

      it "redirects to the created product" do
        post products_url, params: { product: valid_attributes }
        expect(response).to redirect_to(Product.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new product" do
        expect {
          post products_url, params: { product: invalid_attributes }
        }.not_to change(Product, :count)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post products_url, params: { product: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT /update" do
    context "with valid parameters" do
      let(:new_attributes){
        {
          name: 'curso perfeccionamiento',
          description: Faker::Lorem.paragraphs(number: 240).join("\n\n"),
          price: 450.00,
          category_id: Category.last.id
        }
      }

      it "updates the requested product" do
        product = Product.create! valid_attributes
        put product_url(product), params: { product: new_attributes }
        product.reload
        expect(product.name).to eq('curso perfeccionamiento')
      end

      it "redirects to the product" do
        product = Product.create! valid_attributes
        put product_url(product), params: { product: valid_attributes }
        expect(response).to redirect_to(product)
      end
    end

    context "with invalid parameters" do
      it "does not update the product" do
        product = Product.create! valid_attributes
        put product_url(product), params: { product: invalid_attributes }
        product.reload
        expect(product.name).to eq('curso iniciacion')
      end

      it "renders a successful response (i.e. to display the 'edit' template)" do
        product = Product.create! valid_attributes
        put product_url(product), params: { product: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested product" do
      product = Product.create! valid_attributes
      expect {
        delete product_url(product)
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      product = Product.create! valid_attributes
      delete product_url(product)
      expect(response).to redirect_to(products_url)
    end
  end

end
