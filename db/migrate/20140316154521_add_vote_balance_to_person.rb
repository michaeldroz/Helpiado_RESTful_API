class AddVoteBalanceToPerson < ActiveRecord::Migration
  def change
    add_column :people, :vote_balance, :integer
  end
end
