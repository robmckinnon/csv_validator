class AddFieldsToWebResources < ActiveRecord::Migration
  def self.up
    add_column :web_resources, :parses_as_csv, :boolean
    add_column :web_resources, :blank_rows, :boolean
    add_column :web_resources, :first_row, :text
    add_column :web_resources, :headers_in_first_row, :boolean
  end

  def self.down
    remove_column :web_resources, :parses_as_csv
    remove_column :web_resources, :blank_rows
    remove_column :web_resources, :first_row
    remove_column :web_resources, :headers_in_first_row
  end
end
