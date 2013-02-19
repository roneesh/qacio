class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :project_id
      t.string :name
      t.string :access_link

      t.timestamps
    end
  end
end
