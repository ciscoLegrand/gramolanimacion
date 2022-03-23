class SocialIconComponent < ViewComponent::Base 
  
  def initialize(icon:, size:, color:, href:)
    @icon = icon
    @size = size
    @color = color 
    @href = href
  end
  
    def svg(path)
      File.open("app/assets/images/recortes/#{path}", "rb") do |file|
        raw file.read
      end
    end
  
    def render?
      @href.present?
    end
  
  private
  attr_reader :icon, :size, :color, :href


end