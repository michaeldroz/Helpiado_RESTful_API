class AddConstraintToDeedsPersonIdColumn < ActiveRecord::Migration
  def change
  change_column :deeds, :person_id, :integer, :null =>false 
  end
end
