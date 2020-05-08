# frozen_string_literal: true

require 'bitcointrade/api/types/bid'

module Bitcointrade
  module API
    module Types
      class BidsCollection < Array
        def initialize(attributes)
          @attributes = attributes

          super(bids)
        end

        private

        def bids
          @attributes.map { |bid| Bid.new(bid) }
        end
      end
    end
  end
end
