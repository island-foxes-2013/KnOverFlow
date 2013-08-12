class Vote <ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  attr_accessible :up_voted, :voteable_type

  validates :voteable_id, :user, presence: true

  after_save :update_vote_count

  def update_vote_count
    if up_voted 
      self.voteable.vote_count += 1
    else 
      self.voteable.vote_count -=1
    end
  self.voteable.save
  end
end