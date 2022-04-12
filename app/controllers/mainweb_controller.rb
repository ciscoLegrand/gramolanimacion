class MainwebController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index site_category site_product site_cart site_successfull_payment site_legal_text cookies]
  before_action :set_category, only: %i[site_category]

  def index
    @contact = Contact.new
    @swiper = Product.where(swiper: true).order(created_at: :desc).limit(6)
    @highlights = Product.where(highlight: true).order(created_at: :desc)
  end

  def site_category
    @products = @category.products
  end

  def site_product 
    @products = Product.all
    @product = Product.friendly.find(params[:product_id])
  end

  def site_cart
    @user = current_user
  end

  def site_successfull_payment
    
  end

  def site_legal_text
    @legal_text = LegalText.friendly.find(params[:legal_text_id])
  end

  def users_panel 
  end

  def profile 
  end

  def admin_panel
    @data_enterprise = DataEnterprise.first
  end

  def cookies
  end

  private 
    def set_category 
      @category = Category.friendly.find(params[:category_id])
    end
    
end
