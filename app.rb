require('sinatra')
require('sinatra/reloader')
require('./lib/vehicle')
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
