require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')

get '/pizzas' do
@pizzas = Pizza.all
erb(:index)
end

post '/pizzas' do # CREATE
  @pizza = Pizza.new(params)
  @pizza.save
  erb(:create)
end

get '/pizzas/new' do # new
  erb(:new)
end

get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end

put '/pizzas/:id' do
  @pizza_object = Pizza.new(params)
  @pizza_object.update()
  redirect to("/pizzas/#{params[:id]}")
end

delete '/pizzas/:id' do
  @pizza_object = Pizza.find(params[:id])
  @pizza_object.delete
  redirect to ('/pizzas')
end
