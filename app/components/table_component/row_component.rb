# frozen_string_literal: true

class TableComponent::RowComponent < ViewComponent::Base
  renders_one :actions, "RowActionComponent"

  attr_reader :cells
  def initialize(cells:)
    @cells = cells
  end

  class RowActionComponent < ViewComponent::Base 
    def call
      tag.td content, class: "text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap"
    end

    def render?
      content.present?
    end
  end
end
