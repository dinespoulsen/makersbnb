require 'spec_helper'

feature "Outgoing requests" do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test')
    User.create(email: 'test2@test2.com',
                password: 'test2')
  end

  scenario "user can see their own outgoing requests" do
    sign_in
    add_space
    sign_out
    sign_in_2

    

  end


end
