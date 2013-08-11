class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  attr_accessible :title, :content

  validates :title, :content, :user, presence: true
end
