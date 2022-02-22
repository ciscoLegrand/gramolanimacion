# frozen_string_literal: true

class TableComponent < ViewComponent::Base
  renders_many :rows, "TableComponent::RowComponent"

  attr_reader :headers
  def initialize(headers:)
    @headers = headers
  end
end
