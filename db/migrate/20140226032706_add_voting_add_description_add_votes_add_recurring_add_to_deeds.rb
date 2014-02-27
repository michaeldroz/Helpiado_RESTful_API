class AddVotingAddDescriptionAddVotesAddRecurringAddToDeeds < ActiveRecord::Migration
  def change
    add_column :deeds, :voting, :boolean
    add_column :deeds, :descripton, :string
    add_column :deeds, :votes, :integer
    add_column :deeds, :recurring, :boolean
  end
end
