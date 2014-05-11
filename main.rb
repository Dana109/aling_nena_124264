require 'sinatra'
require './boot.rb'
require './money_calculator.rb'


# ROUTES FOR ADMIN SECTION
get '/admin' do
  @products = Item.all
  erb :admin_index
end


get '/new_product' do
  @product = Item.new
  erb :product_form
end

post '/create_product' do
  Item.create!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
    sold: 0
  )
  redirect to '/admin'
end

get '/edit_product/:id' do
  @product = Item.find(params[:id])
  erb :product_form
end

post '/update_product/:id' do
  @product = Item.find(params[:id])
  @product.update_attributes!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
  )
  redirect to '/admin'
end

get '/delete_product/:id' do
  @product = Item.find(params[:id])
  @product.destroy!
  redirect to '/admin'
end

# ROUTES FOR ADMIN SECTION

get '/' do
	@products = Item.order("random()").first(10)
	erb :banner
end

get '/product' do
  @products = Item.all
  	
  erb :product
end

get '/buy_product/:id' do
  @product = Item.find(params[:id])  
	@quantity = (params[:quantity]).to_i
	@bought = (params[:bought]).to_i
  erb :buy_product
end

post '/bought_product/:id' do
  alerts = ""
  @alerts = alerts
  
  @product = Item.find(params[:id]) 
    bought = @bought
	@quantity = (params[:quantity]).to_i
	@bought = (params[:bought]).to_i 
	@total_bought = @product.price * @bought
	
	cash = MoneyCalculator.new (params[:ones]).to_i, (params[:fives]).to_i,	(params[:tens]).to_i, (params[:twenties]).to_i, (params[:fifties]).to_i, (params[:hundreds]).to_i, (params[:five_hundreds]).to_i, (params[:thousands]).to_i
	@cash_hand = cash.total
	@hash_cash = cash.change(@total_cost)
	
	quantity_left = @product.quantity.to_i - @bought
	sold_total = @product.sold.to_i + @bought

	@change = (@cash_hand).to_i - (@total_cost).to_i
	
	@product.update_attributes!(
	quantity: quantity_left,	
	sold: sold_total,
	)
	
  erb :bought_product
 end


get '/about' do
	erb :about
end
