class SlideComponent < ViewComponent::Base 
  with_collection_parameter :item
  def initialize(item:)
    @item = item
  end
  
  private
  attr_reader :item
end