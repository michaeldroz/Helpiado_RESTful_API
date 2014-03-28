class Person < ActiveRecord::Base
    has_many :deeds, dependent: :destroy
    has_one :vote_balances, dependent: :destroy
    accepts_nested_attributes_for :vote_balances
  
    #example transaction code
    #person.transaction do 
    #person.save!
    #account.save!
    #end 
  
 
end
