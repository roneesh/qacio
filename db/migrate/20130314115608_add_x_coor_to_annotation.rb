class AddXCoorToAnnotation < ActiveRecord::Migration
  def change
    add_column :annotations, :xcoor, :integer
  end
end
