class WebResource < ActiveRecord::Base
  validates_uniqueness_of :uri_md5, :allow_nil => false
end