class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :full_name, :password, :password_confirmation
  validates_presence_of :password, :email, :on => :create
  validates_uniqueness_of :email, :on => :create
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_many :orders

end
