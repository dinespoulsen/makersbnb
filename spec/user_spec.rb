require './app/models/user.rb'
require 'spec_helper.rb'

describe User do

  subject(:user) {described_class.create(email: 'test@test.com', password: 'test')}

  describe "When signing in" do
    it "should return true when user is authenticated" do
      expect(user.authenticated?('test')).to eq true
    end
  end

end
