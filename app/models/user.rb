require "data_mapper"
require "dm-postgres-adapter"
require "bcrypt"

class User

  include DataMapper::Resource
  attr_reader :password
  # attr_accessor :password_confirmation
  #
  # validates_confirmation_of :password

  property :id, Serial
  property :email, String
  property :password_digest, Text

  def password=(pasword)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


end


  DataMapper.setup(:default, "postgres://localhost/makersbnb_development")
  DataMapper.finalize
  DataMapper.auto_upgrade!
