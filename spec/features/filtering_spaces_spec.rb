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
    date = Date.new(2017, 12, 17)
    fill_in 'available_on', :with => date
    click_button "Find Spaces"
    expect(page).to have_content('test2')
  end
end
