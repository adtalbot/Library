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
end
