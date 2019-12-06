# Concurrency

Concurrency is a lightweight gem that can be deployed for foreign exchange and currency conversion operation complying the latest rates provided by [https://free.currencyconverterapi.com/](https://free.currencyconverterapi.com)  
  It should be noted that the rates provided by the parent API are refreshed every 30 minutes and are not in real time.

## Features

This gem can implement the currency conversion operation for the following national currencies - 

"AUD" - Australian Dollar,
"BGN" - Bulgarian Lev,
"BRL" - Brazilian Real,
"CAD" - Canadian Dollar,
"CHF" - Swiss Franc,
"CNY" - Chinese Yuan,
"CZK" - Czech Koruna,
"DKK" - Danish Krone ,
"GBP" - British Pound,
"HKD" - Hong Kong Dollar,
"HRK" - Croatian Kuna,
"HUF" - Hungarian Forint,
"IDR" - Indonesian Rupiah,
"ILS" - Israeli New Shekel,
"INR" - Indian Rupee,
"JPY" - Japanese Yen,
"KRW" - South Korean Won,
"MXN" - Mexican Peso,
"MYR" - Malaysian Ringgit,
"NOK" - Norwegian Krone,
"NZD" - New Zealand Dollar,
"PHP" - Philippine Peso,
"PLN" - Polish Zloty,
"RON" - Romanian Leu,
"RUB" - Russian Ruble,
"SEK" - Swedish Krona,
"SGD" - Singapore Dollar,
"THB" - Thai Baht,
"TRY" - Turkish Lira,
"USD" - United States Dollar,
"ZAR" - South African Rand,  

This gem requires JSON. If you're using JRuby < 1.7.0 you'll need to add gem "json" to your Gemfile or similar.

## Installation

To install Concurrency on the default Rails stack, just put this line in your Gemfile:

```ruby
    gem 'concurrency'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install concurrency

## Usage

```ruby
    Concurrency.convert(AMOUNT_TO_BE_CONVERTED, CONVERT_FROM_CURRENCY, CONVERT_TO_CURRENCY)
```

```ruby
    Concurrency.convert(100, "NZD", "INR")      # would convert 100 New Zealand Dollars to Indian Rupees
```
```irb
    <%= Concurrency.convert(100, "NZD", "INR") %>      
```

```ruby
    Concurrency.conversion_rate("NZD", "INR")    # will return the value of 1 New Zealand Dollar in Indian Rupees
```

In order to establish default conversion currencies, paste the following code in .../config/initializers/concurrency.rb

```ruby
    Concurrency.configure do |config|
        config.from_currency = "USD" # Default value
        config.to_currency = "INR" # Default value
        config.api_key = ENV['CONCURRENCY_APIKEY'] # Mandatory value
        config.url = ENV['CONCURRENCY_URL'] # Mandatory value
    end
```
```ruby
    Concurrency.convert(100) # would convert 100 USD to INR
    Concurrency.convert(100, "NZD") # would convert 100 USD to NZD
    Concurrency.conversion_rate # would convert 1 USD to INR
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Get your API Key here https://free.currencyconverterapi.com/
API Key is mandatory to get the converstion rates.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/naman2202/concurrency. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Concurrency project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/naman2202/concurrency/blob/master/CODE_OF_CONDUCT.md).
