require './app/models/space'
require 'spec_helper'

describe Space do

  subject(:space) { described_class.create(name: "test", price: 100, description: "testing", available_from: Date.today, available_to: Date.today.next_month)}


  describe "when checking availability" do

    it "should be able to check for availability" do
      expect(space.available?(Date.today.next_day, Date.today.next_day(5)))
    end
  end


end
