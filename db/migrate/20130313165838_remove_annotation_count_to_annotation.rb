class RemoveAnnotationCountToAnnotation < ActiveRecord::Migration
  def up
    remove_column :annotations, :annotation_count
  end

  def down
    add_column :annotations, :annotation_count, :integer
  end
end
