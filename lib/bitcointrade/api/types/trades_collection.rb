# frozen_string_literal: true

require 'bitcointrade/api/types/trade'

module Bitcointrade
  module API
    module Types
      class TradesCollection < Array
        def initialize(attributes)
          @attributes = attributes

          super(trades)
        end

        def sell
          self.select { |trade| trade.type == 'sell' }
        end

        def buy
          self.select { |trade| trade.type == 'buy' }
        end

        private

        def trades
          @attributes.map { |trade| Trade.new(trade) }
        end
      end
    end
  end
end
