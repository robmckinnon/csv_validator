module ApplicationHelper

  def clean origin
    origin.gsub(' ','_').gsub('&','amp;').gsub("'",'_comma_').gsub(".",'_dot_')
  end

  def display resource
    "#{resource.data_file.title} - ...#{resource.uri.reverse[0..15].reverse}"
  end
end
