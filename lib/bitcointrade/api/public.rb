# frozen_string_literal: true

require 'bitcointrade/api/base'
require 'bitcointrade/api/types/ticker'
require 'bitcointrade/api/types/bids_collection'
require 'bitcointrade/api/types/trades_collection'

module Bitcointrade
  module API
    module Public
      extend Base

      TWO_WEEKS_IN_SECONDS = 1_209_600

      def self.ticker(pair: 'BRLBTC')
        response = request(path: "#{pair}/ticker")
        Types::Ticker.new(response)
      end

      def self.orders(pair: 'BRLBTC', limit: 50)
        response = request(path: "#{pair}/orders?limit=#{limit}")
        Types::BidsCollection.new(response['bids'])
      end

      def self.trades(pair: 'BRLBTC', start_time: nil, end_time: nil)
        start_time ||= (Time.now - TWO_WEEKS_IN_SECONDS)
        end_time ||= Time.now

        response = request(path: "#{pair}/trades?start_time=#{start_time}&end_time=#{end_time}")
        Types::TradesCollection.new(response['trades'])
      end
    end
  end
end
