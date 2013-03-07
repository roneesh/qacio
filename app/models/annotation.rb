class Annotation < ActiveRecord::Base
  attr_accessible :content, :document_version_id, :user_id


  belongs_to :document_version

end

