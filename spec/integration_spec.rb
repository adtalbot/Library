require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the library database website path', {:type => :feature}) do
  it('stores book titles with author name') do
    visit('/')
    expect(page).to have_content('See all books')
    expect(page). to have_content('See all authors')
  end
end
