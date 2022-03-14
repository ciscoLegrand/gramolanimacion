class ProductsController < ApplicationController
  # before_action :set_category, only: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :ensure_frame_response, only: [:new, :edit]
  def index 
    @products = Product.all 
    @headers = ['Name', 'SKU', 'Initial Price','Price','PNV', 'Vat', 'Category',  'Discount', '']
    @attrs =  [:name, :sku, :initial_price ,:price, :price_no_vat, :vat, :category_name, :discount]
  end

  def show    
  end

  def new
    @product = Product.new
  end

  def edit
  end
    
  def create 
    @product = Product.new(product_params)    
    if @product.save
      respond_to do |format|
        format.turbo_stream { 
          render turbo_stream:  turbo_stream.prepend(
                                  'product', 
                                  partial: 'products/product', 
                                  locals: { product: @product }
                                ) 
        }
        format.html { 
          redirect_to products_path, 
          success: "product was successfully created." 
        }
      end
    else
      redirect_to products_path, 
      alert: "product was not successfully created."
    end
  end

  def update
    if @product.update(product_params)
      respond_to do |format|
        format.turbo_stream { 
          render turbo_stream:  turbo_stream.replace(
                                  @product, partial: "products/product", 
                                  locals: {product: @product}
                                ) 
        }
        format.html { 
          redirect_to products_path, 
          success: "#{@product.name} was successfully updated." 
        }
      end
    else
      redirect_to products_path, 
      alert: "#{@product.name} was not successfully updated."
    end
  end

  def destroy
    name = @product.name
    @product.destroy
    respond_to do |format|
      format.html { 
        redirect_to products_path, 
        notice: "#{name} was successfully destroyed." 
      }
      
      format.turbo_stream
    end
  end

  def update_discount(products)
    products.each do |product|
      product.update_price_discount
    end
  end
  
  private 
    def product_params
      params.require(:product).permit(:name, :description,:initial_price, :price, :old_price, :price_no_vat, :price_in_cents, :discount, :category_id, :vat, :position)
    end

    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # def set_category
    #   @category = Category.friendly.find(params[:category_id])
    # end

    def ensure_frame_response
      return unless Rails.env.development?
      redirect_to root_path unless turbo_frame_request?
    end
end
