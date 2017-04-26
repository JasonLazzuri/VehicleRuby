require('sinatra')
require('sinatra/reloader')
require('./lib/vehicle')
require ('./lib/dealership')
also_reload('lib/**/*.rb')

get('/') do
  # Vehicle.clear()
  erb(:index)
end

# get('/vehicles_list')do
  # @vehicles = Vehicle.all
#   erb(:vehicles_list)
# end


post('/vehicles_list') do
  make = params.fetch("make")
  model = params.fetch("model")
  year = params.fetch("year")
  vehicle = Vehicle.new(make,model,year)
  vehicle.save()
  @vehicles = Vehicle.all
  erb(:vehicles_list)
end

get('/vehicles_list/:id') do
  @vehicle = Vehicle.find(params.fetch('id').to_i())
  erb(:vehicle_info)
end

get('/add_dealership') do

  erb(:add_dealership)
end

get('/dealer_list') do
  @dealerships = Dealership.all
  erb(:dealer_list)
end

post('/dealer_list')do
  name = params.fetch("add_dealer")
  dealer = Dealership.new(name)
  dealer.save()
  @dealerships = Dealership.all
  erb(:dealer_list)
end

get('/dealer_list/:id') do
  @dealer = Dealership.find(params.fetch('id').to_i())
  erb(:dealer_info)
end
