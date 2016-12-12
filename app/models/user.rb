require "data_mapper"
require "dm-postgres-adapter"
require "bcrypt"

class User

  include DataMapper::Resource
  attr_reader :password
  # attr_accessor :password_confirmation
  # #
  #validates_confirmation_of :password

  property :id, Serial
  property :email, String
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticated?(user_password)
    BCrypt::Password.new(self.password_digest) == user_password
  end

end
