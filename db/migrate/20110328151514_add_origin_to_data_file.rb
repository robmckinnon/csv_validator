class AddOriginToDataFile < ActiveRecord::Migration
  def self.up
    add_column :data_files, :origin, :string

    add_index :data_files, :origin
  end

  def self.down
    remove_column :data_files, :origin, :string
  end
end
