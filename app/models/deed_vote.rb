class DeedVote < ActiveRecord::Base
belongs_to :deed 
#validates :person, :presence => true
validates :deed, :presence =>true
end
