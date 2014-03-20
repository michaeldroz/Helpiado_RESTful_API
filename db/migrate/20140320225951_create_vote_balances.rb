class CreateVoteBalances < ActiveRecord::Migration
  def change
    create_table :vote_balances do |t|
      t.integer :person_id
      t.integer :vote_balance

      t.timestamps
    end
  end
end
