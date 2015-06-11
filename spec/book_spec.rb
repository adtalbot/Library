require('spec_helper')

describe(Book) do
  describe('initialize') do
    it('initializes a new instance of book with a name') do
      test_book = Book.new({:name => 'Middlesex', :id => nil})
      expect(test_book.name()).to(eq('Middlesex'))
    end
    it('initializes a new instance of book with a database ID') do
      test_book = Book.new({:name => 'Middlesex', :id => 1})
      expect(test_book.id()).to(eq(1))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Book.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds an book to the database') do
      test_book = Book.new({:name => 'Middlesex', :id => nil})
      test_book.save()
      expect(Book.all()).to(eq([test_book]))
    end
  end

  describe('#==') do
    it('recognizes that two instances with the same name and ID are equal') do
      test_book = Book.new({:name => 'Middlesex', :id => nil})
      test_book2 = Book.new({:name => 'Middlesex', :id => nil})
      expect(test_book).to(eq(test_book2))
    end
  end

  describe('.find') do
    it('returns a book by its ID') do
      test_book = Book.new({:name => 'Middlesex', :id => nil})
      test_book.save()
      test_book2 = Book.new({:name => 'Emma', :id => nil})
      test_book2.save()
      expect(Book.find(test_book.id())).to(eq(test_book))
    end
  end

  describe('#update') do
    it('updates a book in the database') do
      test_book = Book.new({:name => 'Middlesex', :id => nil})
      test_book.save()
      test_book.update({:name => 'Harry Potter'})
      expect(test_book.name()).to(eq('Harry Potter'))
    end
  end
  describe('#delete') do
    it('deletes a book from the database') do
      test_book = Book.new({:name => 'Middlesex', :id => nil})
      test_book.save()
      test_book2 = Book.new({:name => 'Harry Potter', :id => nil})
      test_book2.save()
      test_book2.delete()
      expect(Book.all()).to(eq([test_book]))
    end
  end
end
