class AddAnnotationCountToAnnotation < ActiveRecord::Migration
  def change
    add_column :annotations, :annotation_count, :integer
  end
end
