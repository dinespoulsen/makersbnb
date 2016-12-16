require 'spec_helper'

feature "adding space" do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test')
  end

  scenario "a user can add a space when signed in" do
    sign_in
    add_space
    expect(page).to have_content("test")
    expect(page).to have_content("14/12/2016")
  end

  scenario "a user can't put the available 'to' date before the 'from' date" do
    sign_in
    click_link 'Add space'
    fill_in 'name', :with => "test"
    fill_in 'price', :with => 200
    fill_in 'description', :with => "testing"
    fill_in 'available_from', :with => '18/12/2016'
    fill_in 'available_to', :with => '14/12/2016'
    click_button 'Add space'
    expect(page).to have_content("Unable to add space - Available to date is before available from")
  end

end
