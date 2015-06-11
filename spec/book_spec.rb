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
end
