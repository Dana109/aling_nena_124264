class BuyItems
	attr_accessor :buy
	attr_accessor :quantity
	
	def initialize(buy, quantity)
		@buy = buy
		@quantity = quantity
	end
	
	def purchase 
		a = @quantity	
		b = @buy
		
		all = a - b
		
		puts "#{all}"
	end
end