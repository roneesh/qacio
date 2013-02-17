class Project < ActiveRecord::Base
  attr_accessible :client, :name, :password, :text_description, :user_id

  belongs_to :user
end
