class AddNameToDocumentVersion < ActiveRecord::Migration
  def change
    add_column :document_versions, :name, :string
  end
end
