# frozen_string_literal: true

class NotificationComponent < ViewComponent::Base
  attr_reader :type, :data, :bg_color

  def initialize(type:, data:)
    @type = type
    @data = prepare_data(data)
    @bg_color = bg_color

    @data[:timeout] ||= 10
  end

  private 
    def prepare_data(data)
      case data
      when Hash
        data
      else
        { title: data }
      end
    end

    def bg_color
      case @type
      when 'success'
        'bg-green-400'
      when 'error'
        'bg-red-800'
      when 'alert'
        'bg-red-400'
      when 'info'
        'bg-indigo-400'
      else
        'bg-gray-400'
      end
    end


end
