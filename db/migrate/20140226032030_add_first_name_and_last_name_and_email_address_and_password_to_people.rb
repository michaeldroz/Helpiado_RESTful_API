class AddFirstNameAndLastNameAndEmailAddressAndPasswordToPeople < ActiveRecord::Migration
  def change
    add_column :people, :first_name, :string
    add_column :people, :last_name, :string
    add_column :people, :email_address, :string
    add_column :people, :password, :string
  end
end
