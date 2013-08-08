class User < ActiveRecord::Base

attr_accessible :name, :email, :password, :password_confirmation

  has_many :questions
  has_many :answers
  has_many :comments

  has_secure_password

  validates_presence_of :password, :on => :create


end
