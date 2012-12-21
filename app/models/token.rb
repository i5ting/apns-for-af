class Token < ActiveRecord::Base
  belongs_to :project
  attr_accessible :desc, :project_id, :name
end
