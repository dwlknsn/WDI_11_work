class Stock
	attr_accessor :no_of_shares, :stock_name, :share_price
	def initialize(options={})
		@no_of_shares = options[:no_of_shares]
		@stock_name = options[:stock_name]
		@share_price = options[:share_price]
	end
end