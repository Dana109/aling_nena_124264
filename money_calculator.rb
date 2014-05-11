class MoneyCalculator
attr_accessor :ones
attr_accessor :fives
attr_accessor :tens
attr_accessor :twenties
attr_accessor :fifties
attr_accessor :hundreds
attr_accessor :five_hundreds
attr_accessor :thousands



  def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)
    # each parameter represents the quantity per denomination of money
    # these parameters can be assigned to instance variables and used for computation

    # add a method called 'change' that takes in a parameter of how much an item costs
    # and returns a hash of how much change is to be given
    # the hash will use the denominations as keys and the amount per denomination as values
    # i.e. {:fives => 1, fifties => 1, :hundreds => 3}
	@ones = ones.to_i
	@fives = fives.to_i * 5
	@tens = tens.to_i * 10
	@twenties = twenties.to_i * 20
	@fifties = fifties.to_i * 50
	@hundreds = hundreds.to_i * 100
	@five_hundreds = five_hundreds.to_i * 500
	@thousands = thousands.to_i * 1000
	@total = (@ones.to_i) + (@fives.to_i) + (@tens.to_i) + (@twenties.to_i) + (@fifties.to_i) + (@hundreds.to_i) + (@five_hundreds.to_i) + (@thousands.to_i)
  
  
  	@cash_hash = Hash.new 
		@cash_hash["cash_ones"] = 0
		@cash_hash["cash_fives"] = 0
		@cash_hash["cash_tens"] = 0
		@cash_hash["cash_twenties"] = 0
		@cash_hash["cash_fifties"] = 0
		@cash_hash["cash_hundreds"] = 0
		@cash_hash["cash_five_hundreds"] = 0
		@cash_hash["cash_thousands"] = 0
		
	end
	
	def total 
	@total = (@ones.to_i) + (@fives.to_i) + (@tens.to_i) + (@twenties.to_i) + (@fifties.to_i) + (@hundreds.to_i) + (@five_hundreds.to_i) + (@thousands.to_i)
		return @total
	end
	
	def change(total_cost)
		@change = @total - total_cost.to_i
		
		change = @change
		c_thousands = change/1000
		c_five_hundreds = (change%1000)/500
		c_hundreds = ((change%1000)%500)/100
		c_fifties = (((change%1000)%500)%100)/50
		c_twenties = ((((change%1000)%500)%100)%50)/20
		c_tens = (((((change%1000)%500)%100)%50)%20)/10
		c_fives = ((((((change%1000)%500)%100)%50)%20)%10)/5
		c_ones = ((((((change%1000)%500)%100)%50)%20)%10)%5
		
		return {:cash_ones => c_ones, 
				:cash_fives => c_fives,
				:cash_tens => c_tens,
				:cash_twenties => c_twenties, 
				:cash_fifties => c_fifties,
				:cash_hundreds => c_hundreds, 
				:cash_five_hundreds => c_five_hundreds, 
				:cash_thousands => c_thousands}
	end
end

