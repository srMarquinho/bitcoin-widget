# Geckoboard Ruby script
Ruby `3.2.1`

This little Ruby script will push the latest bitcoin rate to a Geckoboard dashboard every 10 minutes.

I kept in mind the simplest and minimum amount of code. Also it has been written in a short amount of time. Meaning it still needs some work.

At first I thought doing it in Sinatra or Node/Express, but as the dashboard requires a computer to display its data I thought we could run a script locally. Although, if a server is needed the implementation should be easy.

At this moment it pushes Pounds, US Dollars, Euros and Reals.

----------

### Taking it further:
- Store data to a remote database to display ratings over the time.
- Use series parameter to create line charts.
- Display all available currencies.
- Display extra charts such as monitoring.
- From this point I would move to a Rails API only app and work on tests.

----------

### How to use:

View the dashboard [https://srmarquinho.geckoboard.com/dashboards/0DC18FF9ECFD3A4D](https://srmarquinho.geckoboard.com/dashboards/0DC18FF9ECFD3A4D)


On terminal.

Clone this repository `git clone https://github.com/srMarquinho/bitcoin-widget`.

Install dependencies `bundle`

Run the script `ruby app.rb` to live update.

### Difficulties:

I had difficulties and spent some time tying to get the hash in the example to work.
```ruby
dataset = client.datasets.find_or_create('sales.gross', fields: [
  Geckoboard::MoneyField.new(:amount, name: 'Amount', currency_code: 'USD'),
  Geckoboard::DateTimeField.new(:timestamp, name: 'Time'),
])
```
`unknown keyword: currency_code`
