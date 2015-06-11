class Author
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_authors = DB.exec("SELECT * FROM authors;")
    authors = []
    returned_authors.each() do |author|
      name = author.fetch('name')
      id = author.fetch('id').to_i()
      authors.push(Author.new({:name => name, :id => id}))
    end
    authors
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO authors (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch('id').to_i()
  end

  define_method(:==) do |another_author|
    self.name().==(another_author.name()).&(self.id().==(another_author.id()))
  end

  define_singleton_method(:find) do |id|
    result = DB.exec("SELECT * FROM authors WHERE id = #{id};")
    name = result.first.fetch('name')
    Author.new({:name => name, :id => id})
  end
  define_method(:update) do |attributes|  #Passes in attributes entered by user in update form.
    @name = attributes.fetch(:name, @name)#Fetches new name or original name if new name wasn't entered.
    @id = self.id() #Calls id method on instance of author.
    DB.exec("UPDATE authors SET name = '#{@name}' WHERE id = #{@id};") #Updates in DB the name of instance where id is equal to @id
  end
  define_method(:delete) do
    DB.exec("DELETE FROM authors WHERE id = #{self.id()};")
  end
end
