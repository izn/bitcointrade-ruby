# frozen_string_literal: true

require 'time'

module Bitcointrade
  module API
    module Types
      class Trade
        attr_reader :attributes,
                    :type, :amount,
                    :unit_price, :active_order_code,
                    :passive_order_code

        def initialize(attributes)
          @attributes = attributes

          @type = attributes.fetch('type')
          @amount = attributes.fetch('amount')
          @unit_price = attributes.fetch('unit_price')
          @active_order_code = attributes.fetch('active_order_code')
          @passive_order_code = attributes.fetch('passive_order_code')
          @date = attributes.fetch('date')
        end

        def date
          Time.parse(@date)
        end
      end
    end
  end
end
