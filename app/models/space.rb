require "data_mapper"
require "dm-postgres-adapter"

class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :price, Integer
  property :description, Text
  property :available_from, Date
  property :available_to, Date

  belongs_to :user
  has n, :requests

end
