# frozen_string_literal: true

module Bitcointrade
  module API
    module Types
      class Bid
        attr_reader :attributes,
                    :unit_price, :code,
                    :stop_limit_price, :amount

        def initialize(attributes)
          @attributes = attributes

          @unit_price = attributes.fetch('unit_price')
          @code = attributes.fetch('code')
          @stop_limit_price = attributes.fetch('stop_limit_price')
          @amount = attributes.fetch('amount')
        end
      end
    end
  end
end
