class AddErrorToWebResource < ActiveRecord::Migration
  def self.up
    add_column :web_resources, :parse_error, :string
    add_column :web_resources, :parse_attempted, :boolean
  end

  def self.down
    remove_column :web_resources, :parse_error
    remove_column :web_resources, :parse_attempted
  end
end
