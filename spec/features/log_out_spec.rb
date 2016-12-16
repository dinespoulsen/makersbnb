require "spec_helper.rb"

feature "when logging a user out" do
  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test')
  end

  scenario "a user should be able to terminate a log in session" do
    sign_in
    click_button("Log Out")
    expect(page).to have_content("You have been logged out")
  end
end
