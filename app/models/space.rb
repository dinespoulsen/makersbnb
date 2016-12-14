require "data_mapper"
require "dm-postgres-adapter"

class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :price, Integer, :required => true
  property :description, Text, :required => true
  property :available_from, Date, :required => true
  property :available_to, Date, :required => true

  belongs_to :user
  has n, :requests

end
