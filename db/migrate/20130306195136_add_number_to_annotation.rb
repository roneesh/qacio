class AddNumberToAnnotation < ActiveRecord::Migration
  def change
    add_column :annotations, :number, :integer
  end
end
