class AddVoteCountToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :vote_count, :integer
  end
end
