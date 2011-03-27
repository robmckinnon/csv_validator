class CreateDataFiles < ActiveRecord::Migration
  def self.up
    create_table :data_files do |t|
      t.string :domain
      t.text :datagovuk_uri
      t.string :title
      t.string :agency
      t.string :entity_from_title
      t.string :spend_over
      t.string :department
      t.integer :web_resource_id

      t.timestamps
    end

    add_index :data_files, :web_resource_id
  end

  def self.down
    drop_table :data_files
  end
end
