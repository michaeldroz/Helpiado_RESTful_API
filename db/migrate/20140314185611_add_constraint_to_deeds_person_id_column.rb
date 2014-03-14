class AddConstraintToDeedsPersonIdColumn < ActiveRecord::Migration
  def change
  change_column :deeds, :person_id, :column_type, :null = false 
  end
end
