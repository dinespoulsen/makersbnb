require 'spec_helper.rb'

feature "Signing in" do
  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test')
  end

  scenario "User will be able to sign in with correct password" do
    visit('/sessions/new')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'test')
    click_button('Sign In')
    expect(page).to have_content('Welcome, test@test.com')
  end

end
