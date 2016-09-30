require 'geckoboard'
require 'json'
require 'date'
require 'open-uri'

GECKOBOARD_API_KEY = ENV["GECKOBOARD_API_KEY"]
INTERVAL_IN_SECONDS = 600

client = Geckoboard.client(GECKOBOARD_API_KEY)
puts "Authentication successful"

dataset = client.datasets.find_or_create('bitcoin.rate', { "fields":{
    "dollar":{
      "type": "money",
      "name": "Dollar",
      "currency_code": "USD"
    },
    "euro":{
      "type": "money",
      "name": "Euro",
      "currency_code": "EUR"
    },
    "pound":{
      "type": "money",
      "name": "Pound",
      "currency_code": "GBP"
    },
    "real":{
      "type": "money",
      "name": "Real",
      "currency_code": "BRL"
    },
    "datetime":{
      "type": "datetime",
      "name": "Datetime"
    }
  }
})
puts "Dataset found"

puts "Data will be pushed every #{INTERVAL_IN_SECONDS} seconds. Use CTRL+C to quit!"

while true do
  json = open("https://blockchain.info/ticker").read
  hash = JSON.parse(json)
  dataset.put([
    {
      "dollar": (hash['USD']["15m"] * 100).to_i,
      "euro": (hash['EUR']["15m"] * 100).to_i,
      "pound": (hash['GBP']["15m"] * 100).to_i,
      "real": (hash['BRL']["15m"] * 100).to_i,
      "datetime": DateTime.now
    }
    ])
    t = Time.now
    puts "Dataset pushed on #{t.strftime('%m/%d/%Y')} at #{t.strftime('at %I:%M%p')}"
    sleep INTERVAL_IN_SECONDS
end
