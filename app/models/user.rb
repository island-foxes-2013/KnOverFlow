class User < ActiveRecord::Base

  attr_accessible :name, :email, :password, :password_confirmation

  has_many :questions
  has_many :answers
  has_many :comments

  has_secure_password

  # validates_presence_of :password, :on => :create, 
  validates :password, presence: true, length: { minimum: 6 }

  validates_presence_of :password_confirmation, :on => :create

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
