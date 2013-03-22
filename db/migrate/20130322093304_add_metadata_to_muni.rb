class AddMetadataToMuni < ActiveRecord::Migration
  def change
     add_column :munis, :administration, :integer
     add_column :munis, :district, :integer
     add_column :munis, :bfs_type, :integer

     add_index :munis, :administration
     add_index :munis, :district
     add_index :munis, :bfs_type
  end
end
