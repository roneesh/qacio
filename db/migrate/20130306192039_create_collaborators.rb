class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.integer :document_id
      t.string :initials
      t.string :email

      t.timestamps
    end
  end
end
