require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")
require("pg")

DB = PG.connect({:dbname => "to_do"}) #this is the database that store Shi..

get('/') do

  erb(:index)
end

post('/') do
  task = Task.new({:description => params["name"], :due_date => dd = params["dd"], :list_id => 1})
  task.save
  erb(:index)#this reloads webpage 
end
