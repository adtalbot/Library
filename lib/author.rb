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
  define_method(:update) do |attributes|    #Fields entered by user in form.
    @name = attributes.fetch(:name, @name)  #Fetches the new name entered or if the name wasn't changed, fetches the original name.
    @id = self.id()                         #Calling id method to find id of instance.
    DB.exec("UPDATE authors SET name = '#{@name}' WHERE id = #{@id};") #Updates the author table in DB to set name field to new name where the ID is equal to ID.
  end
end
