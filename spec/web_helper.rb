def sign_in
  visit('/sessions/new')
  fill_in('email', with: 'test@test.com')
  fill_in('password', with: 'test')
  click_button('Sign In')
end
