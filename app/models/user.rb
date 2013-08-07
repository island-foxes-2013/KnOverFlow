class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments

  attr_accessible :name, :email
end
