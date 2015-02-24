require 'pry-byebug'
require_relative 'brokerage'
require_relative 'client'

brokerage = Brokerage.new({
  name: "Dave's Brokerage"
  })


def menu
  puts `clear`
  puts '*** GASE ***'
  puts '1 - Create a client'
  puts '2 - Create a portfolio'
  puts '3 - Purchase Stocks'
  puts '4 - Sell Stocks'
  puts '5 - List all clients and their balances'
  puts "6 - List a client's portfolios and associated values"
  puts "7 - List all stocks in a portfolio and associated values"
  puts 'q - Quit program'
  print "--> "
  gets.chomp.downcase
end

response = menu

while response.upcase != 'Q'
  case response
  when '1'
    puts "Name"
    client_name = gets.chomp
    puts "balance"
    client_balance = gets.chomp

    new_client = Client.new({
      name: client_name,
      balance: client_balance
      })

    binding.pry
    puts 'debugging'
  end

  response = menu
end
