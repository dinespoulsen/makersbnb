require 'data_mapper'
require 'dm-postgres-adapter'

class Request

  include DataMapper::Resource

  property :id, Serial
  property :date_on, Date
  property :confirmed, Boolean

  belongs_to :user, :space

end
