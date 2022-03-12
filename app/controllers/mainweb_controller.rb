class MainwebController < ApplicationController
  before_action :set_category, only: %i[site_category]
  def index
    @contact = Contact.new
  end

  def site_category
  end
  
  def site_legal_text
    @legal_text = LegalText.friendly.find(params[:legal_text_id])
  end

  def cookie
  end

  private 
    def set_category 
      @category = Category.friendly.find(params[:category_id])
    end
end
