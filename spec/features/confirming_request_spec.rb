require 'spec_helper'

feature 'Confirming requests' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test')
    User.create(email: 'test2@test2.com',
                password: 'test2')
  end

  scenario "a user should be able to confirm incoming requests" do
    book_space
    logout
    sign_in
    click_link('My Incoming Requests')
    click_button('Confirm')
    expect(page).to have_content('Request confirmed')
    expect(page).to have_content('Test has been booked from 2016-12-14 to 2016-12-15')
    expect(Request.first.confirmed).to eq(true)
  end

end
