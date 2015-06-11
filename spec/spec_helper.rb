require('rspec')
require('pry')
require('pg')
require('book')
require('author')

DB = PG.connect({:dbname => 'library_database_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM books *;')
    DB.exec('DELETE FROM authors *;')
  end
end
