class CreateDeedVotes < ActiveRecord::Migration
  def change
    create_table :deed_votes do |t|
      t.integer :person_id
      t.integer :deed_id
      t.integer :votes

      t.timestamps
    end
  end
end
