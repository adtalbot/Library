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
      books.push(Book.new({:name => 'Middlesex', :id => id}))
    end
    books
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO books (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch('id').to_i()
  end

  define_method(:==) do |another_book|
    self.name().==(another_book.name()).&(self.id().==(another_book.id()))
  end

  define_singleton_method(:find) do |id|
    result = DB.exec("SELECT * FROM books WHERE id = #{id};")
    name = result.first.fetch('name')
    Book.new({:name => name, :id => id})
  end
  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE books SET name = '#{@name}' WHERE id = #{@id};")
  end
  define_method(:delete) do
    DB.exec("DELETE FROM books WHERE id = #{self.id()};")
  end
end
