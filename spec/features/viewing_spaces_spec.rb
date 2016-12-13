require "spec_helper"

feature "Users can view spaces" do
  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test')
  end

  scenario "all users should be able to view spaces" do
    sign_in
    add_space
    visit("/spaces")
    expect(page).to have_content("test")
  end

end
