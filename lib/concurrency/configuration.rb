module Concurrency
  class Configuration
    attr_accessor :from_currency, :to_currency, :api_key

    def initialize
        @from_currency = "USD"
        @to_currency = "INR"
        @api_key = ENV['CONCURRENCY_APIKEY']
    end
  end
end