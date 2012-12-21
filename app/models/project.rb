class Project < ActiveRecord::Base
  belongs_to :message
  has_one :pem
  has_many        :token
  
  attr_accessible :message_id, :name
end
