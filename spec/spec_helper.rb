ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'pg'
require 'pry'
require './lib/list'
require './lib/task'

# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM lists *;")
#     DB.exec("DELETE FROM tasks *;")
#   end
# end
