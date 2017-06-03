module Concurrency
  class Configuration
    attr_accessor :from_currency, :to_currency

    def initialize
        @from_currency = "USD"
        @to_currency = "INR"
    end
  end
end