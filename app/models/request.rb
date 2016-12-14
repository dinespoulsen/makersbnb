require 'data_mapper'
require 'dm-postgres-adapter'

class Request

  include DataMapper::Resource

  property :id, Serial
  property :date_from, Date, :required => true
  property :date_to, Date, :required => true
  property :confirmed, Boolean

  belongs_to :user, :space

end
