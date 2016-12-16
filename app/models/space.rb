require "data_mapper"
require "dm-postgres-adapter"

class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :price, Integer, :required => true
  property :description, Text, :required => true
  property :image_url, Text
  property :available_from, Date, :required => true
  property :available_to, Date, :required => true

  belongs_to :user
  has n, :requests

  def available?(date_from, date_to)
    confirmed_requests = self.requests.all(confirmed: true)
      if confirmed_requests.any? do |request|
        request.date_from <= date_from || request.date_to >= date_to
        end
      return false
      else
      self.available_from <= date_from || self.available_to >= date_to
      end
  end
end
