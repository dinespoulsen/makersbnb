require 'spec_helper'

feature "Filtering space" do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test')



  end

  scenario "by date" do
    sign_in
    add_space
    add_second_space
    click_button('Spaces')
    # page.find('#start_date').set("15/12/2016")
    # page.find('#end_date').set("16/12/2016")
    fill_in 'start_date', :with => '15/12/2016'
    fill_in 'end_date', :with => '16/12/2016'
    # save_and_open_page
    click_button('Filter')
    expect(current_path).to eq '/spaces/filter'
    # save_and_open_page
    # expect(page).to have_content("test")
    # expect(page).not_to have_content("second space")
  end

end
