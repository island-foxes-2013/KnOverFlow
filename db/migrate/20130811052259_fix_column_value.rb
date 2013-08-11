class FixColumnValue < ActiveRecord::Migration
 def change
    change_column :questions, :vote_count, :integer, default: 0
    change_column :answers, :vote_count, :integer, default: 0
    Question.update_all(vote_count: 0)
    Answer.update_all(vote_count: 0)
  end 
end
