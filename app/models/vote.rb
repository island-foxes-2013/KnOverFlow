class Vote <ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  attr_accessible :up_voted

  validates :voteable_id, :up_voted, :user, presence: true
end