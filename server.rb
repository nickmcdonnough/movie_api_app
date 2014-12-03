require 'sinatra'
require 'rest_client'
require 'json'

get '/' do
  erb :index
end

get '/movies' do
  @data = JSON.parse RestClient.get 'http://movies.api.mks.io/movies'
  erb :movies
end

get '/movies/:id' do
  movie_url = 'http://movies.api.mks.io/movies/' + params[:id]
  @movie = JSON.parse RestClient.get movie_url
  actor_url = 'http://movies.api.mks.io/movies/' + params[:id] + '/actors'
  @actors = JSON.parse RestClient.get actor_url
  erb :movie
end

get '/actors' do
  @data = JSON.parse RestClient.get 'http://movies.api.mks.io/actors'
  erb :actors
end

get '/actors/:id' do
  actor_url = 'http://movies.api.mks.io/actors/' + params[:id]
  @actor = JSON.parse RestClient.get actor_url
  movies_url = 'http://movies.api.mks.io/actors/' + params[:id] + '/movies'
  @movies = JSON.parse RestClient.get movies_url
  erb :actor
end

