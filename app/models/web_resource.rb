class WebResource < ActiveRecord::Base
  validates_uniqueness_of :uri_md5, :allow_nil => false

    # remove_column :web_resources, :parses_as_csv
    # remove_column :web_resources, :blank_rows
    # remove_column :web_resources, :first_row
    # remove_column :web_resources, :headers_in_first_row

  scope :data_files, where("uri not like 'http://data.gov.uk/dataset/%'")

  def check_csv
    if file_path.nil? || file_path.include?('scraped/uk/gov/data/dataset')
      update_attribute(:parse_attempted, false)
    else
      begin
        puts file_path
        update_attribute(:parse_attempted, true)
        first_row = false
        FasterCSV.foreach(file_path) do |row|
          update_attribute(:first_row, row.inspect) unless first_row
          first_row = true
        end
        update_attribute(:parses_as_csv, true)
      rescue Exception => e
        puts e.to_s
        update_attribute(:parse_error, e.to_s)
      end
    end
    nil
  end

  ESSENTIAL_HEADINGS = ["department family", "entity", "date", "expense type", "expense area", "supplier", "transaction number", "amount"]

  STANDARD_HEADINGS = ESSENTIAL_HEADINGS + ["vat registration number", "invoice number"]

  def has_essential_headings
    ESSENTIAL_HEADINGS.select {|heading| !headings.include?(heading) }.empty?
  end

  def missing_standard_headings
    STANDARD_HEADINGS - standard_headings_present
  end

  def headings
    eval(first_row.downcase)
  end

  def standard_headings_present
    STANDARD_HEADINGS.select {|heading| headings.include?(heading)}
  end

  def only_standard_headers
    standard_headings_present == headings
  end
end
