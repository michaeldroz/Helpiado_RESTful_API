class FixDescriptonColumn < ActiveRecord::Migration
  def change
  rename_column :deeds, :descripton, :description
  end
end
