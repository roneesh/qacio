class DocumentVersion < ActiveRecord::Base
  attr_accessible :document_id, :file, :name

  belongs_to :Document

  mount_uploader :file
end
