class CardProductComponent < ViewComponent::Base 
  attr_reader :product
  def initialize(product:)
    @product = product
  end
  
  private
end