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
    fill_in("date_from", :with => '14/12/2016')
    fill_in("date_to", :with => '15/12/2016')
    click_button("Book")
    expect(page).to have_content("Request for: 2016-12-14 To: 2016-12-15")
  end

  scenario "user cannot enter 'date to' which is before 'date from'" do
    sign_in
    add_space
    visit("/spaces/1")
    fill_in("date_from", :with => '18/12/2016')
    fill_in("date_to", :with => '14/12/2016')
    click_button("Book")
    expect(page).to have_content("Unable to add space - Available to date is before available from")
  end

end
