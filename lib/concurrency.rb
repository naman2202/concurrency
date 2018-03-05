require 'concurrency/configuration'
require "concurrency/version"
require 'net/https'
require 'json'

module Concurrency
    class << self
        attr_accessor :configuration
    end    
    
    def self.configuration
        @configuration ||= Configuration.new
    end

    def self.reset
        @configuration = Configuration.new
    end

    def self.configure
        yield(configuration)
    end
    
    def self.convert(*args)
        if args.length == 3
            Concurrency.convert_full(*args)
        elsif args.length == 2
            Concurrency.convert_full(args[0], Concurrency.configuration.from_currency, args[1])
        else
            Concurrency.convert_full(args[0], Concurrency.configuration.from_currency, Concurrency.configuration.to_currency)
        end
    end
    
    def self.conversion_rate(from = Concurrency.configuration.from_currency, to = Concurrency.configuration.to_currency)
        if from == to
            return 1.0
        else
            rate = Concurrency.get_rate(from, to)
            return rate
        end
    end
    
    private
  
    def self.convert_full(initial, from, to)
        if from == to
            return initial
        end
        rate = Concurrency.get_rate(from, to)
        if rate == nil
            return nil
        else
            return initial*rate
        end
    end
    
    def self.get_rate(from, to)
        url = "https://free.currencyconverterapi.com/api/v3/convert?q=#{from}_#{to}&compact=ultra"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        if response == nil
            return nil
        else
            parsed_response = JSON.parse(response)
            rate = (parsed_response["#{from}_#{to}"]).to_f
            return rate
        end
    end
    
end
