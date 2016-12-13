require 'data_mapper'
require 'dm-postgres-adapter'

class BookingRequest

  include DataMapper::Resource

  property :id, Serial
  property :date_from, Date
  property :date_to, Date
  property :confirmed, Boolean

  belongs_to :user, :space

end
