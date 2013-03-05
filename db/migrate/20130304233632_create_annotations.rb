class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.integer :document_version_id
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
