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

get '/lists/:id/edit' do
  @list = List.find(params['id'].to_i)
  erb(:edit_list)
end

patch '/lists/:id' do
  name = params['name']
  @list = List.find(params['id'].to_i)
  @list.update({:name => name})
  redirect('/')
end

delete 'lists/delete/:id' do

end
