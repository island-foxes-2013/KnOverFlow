class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  attr_accessible :content, :user_id # The user_id needs to be accessible to use the seed file
  # but can be removed after development has ended.
end
