class Deed < ActiveRecord::Base
    belongs_to :person
    validates :person, :presence =>true
    has_many :deed_votes, dependent: :destroy
end
