class UserBicycle < ActiveRecord::Base
  attr_accessible :bicycle, :kind, :user

  has_paper_trail
  
  validates_presence_of :bicycle_id, :kind, :user_id
  validates_inclusion_of :kind, :in => [REGISTERED, CURRENT_OWNER, PREVIOUS_OWNER]

  belongs_to :user
  belongs_to :bicycle
  
end
