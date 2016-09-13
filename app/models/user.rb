class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :name, :studnum
  validates_uniqueness_of :studnum

end
