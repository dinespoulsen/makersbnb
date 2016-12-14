require 'spec_helper'

feature 'Incoming requests' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test')
    User.create(email: 'test2@test2.com',
                password: 'test2')
  end

  scenario "use should see incoming requests for their spaces" do
    book_space
    logout
    sign_in
    click_link('Incoming Requests')
    expect(page).to have_content('test')

  end

end
