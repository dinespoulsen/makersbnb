def sign_in
  visit('/sessions/new')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'test')
  click_button('Sign In')
end

def add_space
  click_link 'Add space'
  fill_in 'name', :with => "test"
  fill_in 'price', :with => 200
  fill_in 'description', :with => "testing"
  fill_in 'available_from', :with => '14-12-2016'
  fill_in 'available_to', :with => '30-12-2016'
  click_button 'Add space'
end

def add_second_space
  click_link 'Add space'
  fill_in 'name', :with => "second space"
  fill_in 'price', :with => 200
  fill_in 'description', :with => "second space description"
  fill_in 'available_from', :with => '16-12-2016'
  fill_in 'available_to', :with => '11-01-2017'
  click_button 'Add space'
end
