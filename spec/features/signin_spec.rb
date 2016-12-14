require 'spec_helper.rb'

feature "Signing in" do
  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test')
  end

  scenario "User will be able to sign in with correct password" do
    sign_in
    expect(page).to have_content('Hello, test@test.com')
  end

end
