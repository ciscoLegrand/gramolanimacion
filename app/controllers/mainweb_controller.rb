class MainwebController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index site_category site_legal_text cookies]
  before_action :set_category, only: %i[site_category]

  def index
    @contact = Contact.new
  end

  def site_category
    @products = @category.products
  end
  
  def site_legal_text
    @legal_text = LegalText.friendly.find(params[:legal_text_id])
  end

  def profile 
  end

  def admin_panel
  end

  def cookies
  end

  private 
    def set_category 
      @category = Category.friendly.find(params[:category_id])
    end
    
end
