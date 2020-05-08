# frozen_string_literal: true

require 'bitcointrade/api/types/ticker'

module Bitcointrade
  module API
    module Base
      PUBLIC_API_URL = 'https://api.bitcointrade.com.br/v3/public'

      def request(path:)
        response = Faraday.get([PUBLIC_API_URL, path].join('/'))

        body = JSON.parse(response.body)
        body.fetch('data')
      end
    end
  end
end
