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
  click_button 'Add space'
end
