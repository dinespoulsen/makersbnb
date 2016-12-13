require "data_mapper"
require "dm-postgres-adapter"

class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :price, Integer
  property :description, Text

  belongs_to :user 

end
