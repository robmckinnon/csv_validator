class CreateWebResources < ActiveRecord::Migration

  def self.up
    create_table :web_resources, :force => true do |t|
      t.string :name
      t.string :uri_md5
      t.text :uri
      t.string :last_modified
      t.string :etag
      t.text :file_path

      t.integer :response_code
      t.string :content_type
      t.integer :content_length
      t.text :response_header

      t.timestamps
    end

    add_index :web_resources, :uri_md5
  end

  def self.down
    drop_table :web_resources
  end

end
