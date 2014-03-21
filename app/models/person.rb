class Person < ActiveRecord::Base
    has_many :deeds, dependent: :destroy
    #has_one :vote_balances, dependent: :destroy
    #example transaction code
    #person.transaction do 
    #person.save!
    #account.save!
    #end 
  
 
end
