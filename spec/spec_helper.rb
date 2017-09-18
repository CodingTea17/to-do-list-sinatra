require("rspec")
require("pg")
require("list")
require("task")

DB = PG.connect({:dbname => "to_do_test"}) #this database is just for test 

# This resets the to_do_test database after every tests
RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM tasks *;")
  end
end
