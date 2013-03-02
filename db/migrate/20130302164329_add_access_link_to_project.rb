class AddAccessLinkToProject < ActiveRecord::Migration
  
  def change
    add_column :projects, :access_link, :string
  end

end
