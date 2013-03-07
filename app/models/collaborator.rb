class Collaborator < ActiveRecord::Base
  attr_accessible :document_id, :email, :initials

  belongs_to :document

end


