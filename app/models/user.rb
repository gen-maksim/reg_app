class User < ApplicationRecord
 attr_accessible :name, :studnum, :password, :password_confirmation

 attr_accessor :password
 before_save :encrypt_password

 validates_confirmation_of :password
 validates_presence_of :password, :on => :create
 validates_presence_of :name, :studnum
 validates_uniqueness_of :studnum

 def self.authenticate(studnum, password)
   user = find_by_studnum(studnum)
   if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
     user
   else
     nil
   end
 end

 def encrypt_password
   if password.present?
     self.password_salt = BCrypt::Engine.generate_salt
     self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
   end
 end
end
