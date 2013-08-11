class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :votes, :up_voted?, :up_voted
  end 
end
