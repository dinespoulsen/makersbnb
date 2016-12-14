RSpec.feature 'filter spaces' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test')
  end

  scenario 'We want to see dates available on one day' do
    sign_in
    add_space
    add_second_space
    visit'/spaces'
    date_from = Date.new(2017, 12, 17)
    date_to = Date.new(2017, 12, 18)
    fill_in 'available_from', :with => date_from
    fill_in 'available_to', :with => date_to
    click_button "Find Spaces"
    expect(page).to have_content('test2')
  end
end
