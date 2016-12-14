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
  fill_in 'available_from', :with => '14/12/2016'
  fill_in 'available_to', :with => '30/12/2016'
  click_button 'Add space'
end

def sign_in_2
  visit('/sessions/new')
  fill_in('email', with: 'test2@test2.com')
  fill_in('password', with: 'test2')
  click_button('Sign In')
end

def sign_out
  click_button('Sign Out')
end
