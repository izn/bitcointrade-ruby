# frozen_string_literal: true

require 'time'

module Bitcointrade
  module API
    module Types
      class Ticker
        attr_reader :attributes,
                    :buy, :last,
                    :sell, :trades_quantity,
                    :volume

        def initialize(data)
          @attributes = data

          @buy  = data.fetch('buy')
          @high = data.fetch('high')
          @last = data.fetch('last')
          @low  = data.fetch('low')
          @sell = data.fetch('sell')
          @trades_quantity = data.fetch('trades_quantity')
          @volume = data.fetch('volume')
          @date = data.fetch('date')
        end

        def low
          @low.to_f
        end

        def high
          @high.to_f
        end

        def date
          Time.parse(@date)
        end
      end
    end
  end
end
