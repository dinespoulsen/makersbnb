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

end
