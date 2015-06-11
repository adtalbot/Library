require('sinatra')
require('sinatra/reloader')
require('pg')
require('./lib/author')
require('./lib/book')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => 'library_database'})

get('/') do
  erb(:index)
end

get('/books') do
  @books = Book.all()
  erb(:books)
end

get('/authors') do
  @authors = Author.all()
  erb(:authors)
end
