class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable

  attr_accessible :content

  validates :content, :question, :user, presence: true
end
