require 'spec_helper'

feature "adding space" do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test')
  end

  scenario "a user can add a space when signed in" do
    sign_in

    click_link 'Add space'
    fill_in 'name', :with => "Rory's penthouse"
    fill_in 'price', :with => 200
    fill_in 'description', :with => "downtown central location"
    fill_in 'available_from', :with => '14/12/2016'
    fill_in 'available_to', :with => '30/12/2016'
    click_button 'Add space'
    expect(page).to have_content("Rory's penthouse")
    expect(page).to have_content("Available from 14/12/2016 to 30/12/2016")

  end

end
