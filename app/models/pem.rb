class Pem < ActiveRecord::Base
  belongs_to :project
  
  attr_accessible :desc, :filepath, :name, :project_id
end
