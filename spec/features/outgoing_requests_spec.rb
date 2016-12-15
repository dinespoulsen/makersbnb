require 'spec_helper'

feature "Outgoing requests" do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test')
    User.create(email: 'test2@test2.com',
                password: 'test2')
  end

  scenario "user can see their own outgoing requests" do
    book_space
    click_link('My Requests')
    expect(page).to have_content('test')
    expect(page).to have_content('false')
  end

  # add another test for page not to have content ...


end
