class Book
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end
  define_singleton_method(:all) do
    returned_books = DB.exec("SELECT * FROM books;")
    books = []
    returned_books.each() do |book|
      name = book.fetch('name')
      id = book.fetch('id').to_i()
      books.push(Book.new({:name => 'Middlesex', :id => nil}))
    end
    books
  end
end
