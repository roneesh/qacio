class Document < ActiveRecord::Base
  attr_accessible :access_link, :name, :project_id

  belongs_to :project
end
