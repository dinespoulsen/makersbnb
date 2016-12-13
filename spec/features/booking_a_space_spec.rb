require "spec_helper"

feature "When booking a space" do
  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test')
  end

  scenario "only a signed in user can book" do
    sign_in
    add_space
    visit("/spaces/1")
    fill_in("book_from", :with => '15/12/2016')
    fill_in("book_to", :with => '29/12/2016')
    click_button("Book")
    expect(page).to have_content("From: 2016-12-15")
  end

end
