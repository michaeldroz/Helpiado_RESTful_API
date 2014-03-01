class AddPersonIdToDeeds < ActiveRecord::Migration
  def change
    add_column :deeds, :person_id, :integer
    add_index :deeds, :person_id
  end
end
