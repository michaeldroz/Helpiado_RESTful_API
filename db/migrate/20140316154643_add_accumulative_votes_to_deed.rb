class AddAccumulativeVotesToDeed < ActiveRecord::Migration
  def change
    add_column :deeds, :accumulative_votes, :integer
  end
end
