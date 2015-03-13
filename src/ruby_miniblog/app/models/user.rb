require 'bcrypt'
class User < ActiveRecord::Base
# has_secure_password
# #byebug
#   attr_accessor :password
#   before_save :encrypt_password
  
#   #validates_confirmation_of :password
#   #validates_presence_of :password, :on => :create
#   #validates_presence_of :email
#   #validates_uniqueness_of :username
#   #validates_uniqueness_of :email
#   def self.authenticate(username, password)
#     user = find_by_username(username)
#     if user && user.password == BCrypt::Engine.hash_secret(password, user.password)
#       user
#     else
#       nil
#     end
#   end
# private
#   def encrypt_password
#   	if password.present?
#        BCrypt::Password.create(password)
#     end
#   end
#   def self.check?(password, encrypted_password)
#     BCrypt::Password.new(encrypted_password) == password
#   end
end


