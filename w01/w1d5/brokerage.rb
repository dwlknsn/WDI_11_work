class Brokerage
    attr_accessor :name, :clients
	def initialize(options={})
		@name = options[:name]
        @clients = {}
	end
end