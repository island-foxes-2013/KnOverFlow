class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_secure_password

  attr_accessible :name, :email
end
