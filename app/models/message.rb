class Message < ActiveRecord::Base
  has_one         :project
  
  attr_accessible :desc, :name
end
