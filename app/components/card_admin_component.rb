# frozen_string_literal: true

class CardAdminComponent < ViewComponent::Base
  attr_reader :title, :icon, :message, :description, :icon, :size, :path

  def initialize(title:, message: 'members only', description: '', icon: 'ico-exclamation-triangle.svg', size: '32', path: )
    @title = title
    @message = message
    @description = description
    @icon = icon
    @size = size
    @path = path
  end

  def render?
    title.present? && path.present?
  end

  def is_svg?
    accepted_format = '.svg'
    accepted_format.include? File.extname(@icon)
  end
end
