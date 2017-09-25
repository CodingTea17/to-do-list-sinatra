require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
also_reload 'lib/**/*.rb'
require './lib/task'
require './lib/list'
require 'pg'

get '/' do
  @lists = List.all
  erb :index
end

get '/lists/add_list' do
  erb :list_form
end

post '/lists/new' do
  name = params['name']
  list = List.new({:name => name})
  list.save
  erb(:success)
end
