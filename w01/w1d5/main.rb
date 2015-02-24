require 'pry-byebug'
require_relative 'brokerage'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'

brokerage_1 = Brokerage.new({
    name: 'Dave\'s Brokerage'
})

client_1 = Client.new({
    name: 'BOB',
    balance: 100000
})

# adding client_1 to brokerage_1's clients hash
brokerage_1.clients[client_1.name] =  client_1

portfolio_1 = Portfolio.new({
    name: 'TECH'
})

# adding portfolio_1 to client_1's portfolios hash
client_1.portfolios[portfolio_1.name] = portfolio_1

stock_1 = Stock.new({
    no_of_shares: 1000,
    stock_name: 'GOOG',
    share_price: 25
})

# adding stock_1 to portfolio_1's stocks hash
portfolio_1.stocks[stock_1.stock_name] = stock_1


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
        puts "Enter the new client's name"
        name = gets.chomp.upcase
        puts "Enter the new client's balance"
        balance = gets.chomp.to_i

        new_client = Client.new({name: name, balance: balance})
        brokerage_1.clients[name] = new_client

        puts "Action completed. Press any key to continue"
        gets
    when '2'
        puts "Which client is creating a new portfolio? Current clients are:"
        puts brokerage_1.clients.map { |k, v| k}.join(', ')
        client_name = gets.chomp.upcase

        puts "Enter the new portfolio's name"
        name = gets.chomp.upcase

        new_portfolio = Portfolio.new({name: name})
        brokerage_1.clients[client_name].portfolios[new_portfolio.name] = new_portfolio

        puts "Action completed. Press any key to continue"
        gets
    when '3'
        puts "Which client is buying stocks? Current clients are:"
        puts brokerage_1.clients.map { |k, v| k}.join(', ')
        client_name = gets.chomp.upcase

        puts "Which of #{client_name}'s portfolios do you want to add stocks to? Current portfolios include:"
        puts brokerage_1.clients[client_name].portfolios.map { |k, v| k}.join(', ')
        portfolio_name = gets.chomp.upcase

        puts "What is the name of the stock to be purchased?"
        stock_name = gets.chomp.upcase
        puts "What is the share price of the stock to be purchased?"
        share_price = gets.chomp.to_i

        balance = brokerage_1.clients[client_name].balance
        puts "Available balance is £#{balance}"

        max_no_of_shares = balance / share_price

        puts "how many shares do you want to purchase?"
        no_of_shares = gets.chomp.to_i

        while no_of_shares > max_no_of_shares
            puts "Insufficient funds. You cannot go overdrawn. How many shares do you want to purchase?"
            no_of_shares = gets.chomp.to_i
        end

        new_stock = Stock.new({
            stock_name: stock_name,
            no_of_shares: no_of_shares,
            share_price: share_price
            })

        brokerage_1.clients[client_name].portfolios[portfolio_name].stocks[new_stock.stock_name] = new_stock


        brokerage_1.clients[client_name].balance -= new_stock.share_price * new_stock.no_of_shares

        puts "Action completed. Press any key to continue"
        gets
    when '4'
        puts "Which client is selling stocks? Current clients are:"
        puts brokerage_1.clients.map { |k, v| k}.join(', ')
        client_name = gets.chomp.upcase

        puts "Which of #{client_name}'s portfolios do you want to sell stocks from? Current portfolios include:"
        puts brokerage_1.clients[client_name].portfolios.map { |k, v| k}.join(', ')
        portfolio_name = gets.chomp.upcase

        puts "which stock should be sold?"
        puts brokerage_1.clients[client_name].portfolios[portfolio_name].stocks.map {|k,v| k}   
        stock_name = gets.chomp.upcase

        stock_to_be_sold = brokerage_1.clients[client_name].portfolios[portfolio_name].stocks[stock_name]

        puts "Shares available for sale: #{stock_to_be_sold.no_of_shares}\nCurrent price: £#{stock_to_be_sold.share_price}\nHow many do you want to sell?"
        no_of_shares_to_sell = gets.chomp.to_i
        stock_to_be_sold.no_of_shares -= no_of_shares_to_sell

        brokerage_1.clients[client_name].balance += stock_to_be_sold.share_price * no_of_shares_to_sell

        puts "Action completed. Press any key to continue"
        gets
    when '5'
        client_balances = brokerage_1.clients.map do |k, v|
            "#{v.name}:    £#{v.balance}"
        end

        puts client_balances
        
        puts "Action completed. Press any key to continue"
        gets

    when '6'
        puts "Choose a client:"

        puts brokerage_1.clients.map { |k, v| k}.join(', ')
        client_name = gets.chomp.upcase
        

        portfolio_values = brokerage_1.clients[client_name].portfolios.each do |k, portfolio|
            portfolio_value = portfolio.stocks.map do |k, stock|
                stock.no_of_shares * stock.share_price
            end.join(', ')
            
            puts "#{portfolio.name}: £#{portfolio_value}"
        end


        puts "Action completed. Press any key to continue"
        gets
    when '7'
        puts "Choose a client:"

        puts brokerage_1.clients.map { |k, v| k}.join(', ')
        client_name = gets.chomp.upcase

        puts "Choose a portfolio:"

        puts brokerage_1.clients[client_name].portfolios.map { |k, v| k}.join(', ')
        portfolio_name = gets.chomp.upcase

        puts brokerage_1.clients[client_name].portfolios[portfolio_name].stocks.map {|k,v| "#{v.stock_name}: #{v.no_of_shares * v.share_price}" }
        
        puts "Action completed. Press any key to continue"
        gets
    end

    response = menu
end

def portfolio_value(portfolio)
    binding.pry
    puts "debugging"
end

# binding.pry
# puts "debugging"