class AddPasswordToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :password, :string
  end
end
