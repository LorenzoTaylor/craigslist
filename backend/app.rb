# app.rb
require 'sinatra'
require_relative 'app/models/listing'
require_relative 'app/config/db_config'

get '/listings' do
  Listing.all.to_json
end

post '/listings' do
  data = JSON.parse(request.body.read)
  listing = Listing.new(data)
  if listing.save
    status 201
    listing.to_json
  else
    status 422
    { error: 'Failed to create listing' }.to_json
  end
end

put '/listings/:id' do
  data = JSON.parse(request.body.read)
  listing = Listing.find_by(id: params[:id])
  if listing&.update(data)
    listing.to_json
  else
    status 404
    { error: 'Listing not found' }.to_json
  end
end

delete '/listings/:id' do
  listing = Listing.find_by(id: params[:id])
  if listing&.destroy
    status 204
  else
    status 404
    { error: 'Listing not found' }.to_json
  end
end
