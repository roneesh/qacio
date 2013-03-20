class AddAnnotationCountToDocumentVersion < ActiveRecord::Migration
  def change
    add_column :document_versions, :annotation_count, :integer
  end
end
