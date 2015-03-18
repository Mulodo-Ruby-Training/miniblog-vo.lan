class User < ActiveRecord::Base

belongs_to :post

before_save :hash_new_password, :if=>:password_changed?

# check validate all column     
validates_confirmation_of :password, :if=>:password_changed?
validates :username, length: { maximum: 40 }
validates :first_name, length: { maximum: 50 }
validates :last_name, length: { maximum: 50 }
validates :display_name, length: { maximum: 50 }
validates :birthday, length: { maximum: 20 }
validates :password, length: { in: 6..20 }, :on => :create
validates_uniqueness_of :username, :email
validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
# add avarta

has_attached_file :avatar, :styles => { :medium => "60x60>", :thumb => "30x30>" }, :default_url => "/system/users/avatars/default/:style/missing.jpg"
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

# check password blank
def password_changed?
	!password.blank?
end

private
# create hash password sign up
def hash_new_password
	self.password_salt = BCrypt::Engine.generate_salt
	self.password = BCrypt::Engine.hash_secret(password, password_salt)
end 

# authenticate password sign in
def self.authenticate(username, password)
	#byebug
	if user = find_by(username: username)
		if user && user.password == BCrypt::Engine.hash_secret(password, user.password_salt)
			return user
		end
	end
	return nil
end
end


