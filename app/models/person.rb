class Person < ActiveRecord::Base
    has_many :deeds, dependent: :destroy
    has_one :vote_balances, dependent: :destroy

end
