class User < ApplicationRecord
  attr_accessor :password
  validates_confirmation_of :password
  # validates :password, presence: true, length: { minimum: 8 }
  validates :password, :format => {:with => /(?=.*[a-zA-Z])(?=.*[0-9]).{6,}/, message: "must be at least 6 characters and include one number and one letter."}
  validates :email, :presence => true, :uniqueness => true
  before_save :encrypt_password

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(email, password)
    user = User.find_by "email = ?", email
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
