class Deed < ActiveRecord::Base
    belongs_to :person
    validates_associated :person
end
