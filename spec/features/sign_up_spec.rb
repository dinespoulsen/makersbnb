require 'spec_helper'

RSpec.feature "Sign Up" do
  scenario 'we want a user to be able to sign up' do
    visit '/users/new'
    fill_in 'email', :with => 'user@user.com'
    fill_in 'password', :with => 'password123'
    click_button 'Sign Up'
    expect(page).to have_content('Hello, user@user.com')
  end
end
