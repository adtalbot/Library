require('spec_helper')

describe(Author) do
  describe('initialize') do
    it('initializes a new instance of author with a name') do
      test_author = Author.new({:name => 'Jane Austen', :id => nil})
      expect(test_author).to(be_an_instance_of(Author))
    end
    it('is assigned an id by the database') do
      test_author = Author.new({:name => 'Jane Austen', :id => 1})
      expect(test_author).to(be_an_instance_of(Author))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Author.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds an author to the database') do
      test_author = Author.new({:name => 'Jane Austen', :id => nil})
      test_author.save()
      expect(Author.all()).to(eq([test_author]))
    end
  end

  describe('#==') do
    it('recognizes that two instances with the same name and id are equal') do
      test_author = Author.new({:name => 'Jane Austen', :id => nil})
      test_author2 = Author.new({:name => 'Jane Austen', :id => nil})
      expect(test_author).to(eq(test_author2))
    end
  end

  describe('.find') do
    it('returns an author by its ID') do
      test_author = Author.new({:name => 'Jane Austen', :id => nil})
      test_author.save()
      test_author2 = Author.new({:name => 'Charles Dickens', :id => nil})
      test_author2.save()
      expect(Author.find(test_author.id())).to(eq(test_author))
    end
  end
end
